/**
 * <h1> ESP32 IR Controller w/ Web Interface </h1>
 * <p>
 * Embedded project that accepts commands from a web interface
 * that are stored in a MySQL server and accessed by this microcontroller
 * to act as a remote control for infrared-controlled devices such as TVs,
 * Radios, or AC units. 
 * 
 * @author Austin Ellsworth 
 * @author Nathan Hanchey
 * @author Dale Betts
 * 
 * 
 *
 * @version 1.1
 * @since 2021-07-01 
 */
#include <string.h>
#include <stdlib.h>

#ifndef FACADE
  #include <MySQL_Generic_WiFi.h>
  #define MYSQL_DEBUG_PORT      Serial
  #define _MYSQL_LOGLEVEL_      1

  #include <IRremoteESP8266.h>
  #include <IRsend.h>
#else
  #include "esp-myssql-ir.h"
#endif

// Change Pin For your Board
IRsend irsend(A1);  // sets pin

/**
 * Wireless network SSID for WiFi connection.
 */
char ssid[] = "Network";

/**
 * Wireless network password.
 */
char pass[] = "password";

/**
 * MySQL server username for database connection, must have R/W privileges.
 */
char user[] = "remoteuser";

/**
 * MySQL user password for database connection.
 */
char password[] = "fDTuZ6Z&Bt";

/**
 * IP address of the MySQL Server. 
 */
IPAddress server_addr(3, 15, 200, 46);

/**
 * TCP port of the MySQL Server.
 */
uint16_t server_port = 3306;

/**
 * Command ID global variable extracted from MySQL query, currently unused
 * as we are only running one command at a time. 
 */
int ID;

/**
 * Command name global variable extracted from MySQL query, to be used in
 * switch statement for corresponding infrared functions. 
 */
char Command[32];

/**
 * Board number global variabnle for if/when we may have multiple ESP32's 
 * connected within the same project. 
 */
int Board;

/**
 * Command status global variable extracted from MySQL, value of "0" when the
 * website sets a new command, to be set to "1" by the ESP once the command is 
 * received. Prevents running same command twice and confirms receipt.
 */
int commandStatus;

/**
 * String of the MySQL query used for fetching table values.
 * !Change TABLE NAME FOR YOUR SPECIFIC CONTROLLER
 */
String query = String("SELECT * FROM cis350project.commands WHERE ID = '1'");
#define insert "UPDATE cis350project.commands SET Status=1 WHERE ID = '1'"
char iquery[128];

/**
 * Create a MySQL_Connection variable to open and close connection.
 */
MySQL_Connection conn((Client *)&client);

/** 
 *Create an instance of the cursor passing in the connection.
 */
MySQL_Query sql_query = MySQL_Query(&conn);


/** 
 *Method to initialize serial communicaitons and setup Wifi. 
 */
void setup() {
  Serial.begin(115200);
  while (!Serial) {}
  MYSQL_DISPLAY(MYSQL_MARIADB_GENERIC_VERSION);

  // initialize WiFi module
#if ( USING_WIFI_ESP8266_AT  || USING_WIFIESPAT_LIB )
  #if ( USING_WIFI_ESP8266_AT )
    MYSQL_DISPLAY("Using ESP8266_AT/ESP8266_AT_WebServer Library");
  #elif ( USING_WIFIESPAT_LIB )
    MYSQL_DISPLAY("Using WiFiEspAT Library");
  #endif

  // initialize serial for ESP module
  EspSerial.begin(115200);
  // initialize ESP module
  WiFi.init(&EspSerial);

  MYSQL_DISPLAY(F("WiFi shield init done"));

  // check for the presence of the shield
  if (WiFi.status() == WL_NO_SHIELD) {
    MYSQL_DISPLAY(F("WiFi shield not present"));
    // don't continue
    while (true) {}
  }
#endif

  // Begin WiFi section
  MYSQL_DISPLAY1("Connecting to", ssid);
  WiFi.begin(ssid, pass);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    MYSQL_DISPLAY0(".");
  }

  // debug information about WiFi and SQL connection:
  MYSQL_DISPLAY1("Connected to network. My IP address is:", WiFi.localIP());
  MYSQL_DISPLAY3("Connecting to SQL Server @", server_addr, ", Port =",
  server_port);
  MYSQL_DISPLAY5("User =", user, ", PW =", password, ", DB =", "cis350project");


  //*********************************************
  // IR Remote
  //*********************************************
    irsend.begin();
    #if ESP8266
      Serial.begin(115200, SERIAL_8N1, SERIAL_TX_ONLY);
    #else  // ESP8266
      Serial.begin(115200, SERIAL_8N1);
    #endif  // ESP8266
}

/**
 * Read query function runs the MySQL query string "query", and iterates through
 * the table row while updating the corresponding global variables to be used later.
 */
void runReadQuery() {
  row_values *row = NULL;
  long head_count = 0;

  // Initiate the query class instance
  MySQL_Query query_mem = MySQL_Query(&conn);

  // Execute the query
  MYSQL_DISPLAY(query);

  // Check if query valid before fetching
  if ( !query_mem.execute(query.c_str()) ) {
    MYSQL_DISPLAY("Querying error");
    return;
  }

  // Fetch the columns so we know how many columns
  // there will be when we loop through the row
  column_names *cols = query_mem.get_columns();

  // Read the row - do-while loop
  do {
    row = query_mem.get_next_row();

    if (row != NULL) {
      for (int f = 0; f < cols->num_fields; f++) {
        // MYSQL_DISPLAY0(row->values[f]);
        if (f = 0) {
          // SQL int read as Char so has to be converted back with atoi
          ID = atoi(row->values[f]);
        }
        if (f = 1) {
          // have to use strcopy because char array can't be assigned with =
          strcpy(Command, row->values[f]);
        }
        if (f = 2) {
          // SQL int read as Char so has to be converted back with atoi
          Board = atoi(row->values[f]);
        }
        if (f = 3) {
          // SQL int read as Char so has to be converted back with atoi
          commandStatus = atoi(row->values[f]);
        }
      }
    }
  } while (row != NULL);

  delay(500);
}

/**
 * Read query function runs the MySQL query string "insert", updating status of board
 */
void runInsert() {
  // Initiate the query class instance
  MySQL_Query query_mem = MySQL_Query(&conn);
  conn.connected();
  MYSQL_DISPLAY(insert);
  query_mem.execute(insert);
}

/**
 * Main loop function that tests the SQL connection, runs the sql query 
 * function, calls the appropriate function(s) and then updates the 
 * command status with another sql query
 */
void loop() {
  MYSQL_DISPLAY("Connecting...");
  // test connection
  if (conn.connectNonBlocking(server_addr, server_port, user, password)
  != RESULT_FAIL) {
    runReadQuery();
    // close SQL connection--leave open if we are going to keep polling??
    conn.close();
  }
  else {
    MYSQL_DISPLAY("\nConnect failed. Trying again on next iteration.");
  }

// print variables stored from MySQL loop for serial debug purposes
  Serial.print("\nID: ");
  Serial.print(ID);
  Serial.print("\nCommand: ");
  Serial.print(Command);
  Serial.print("\nBoard: ");
  Serial.print(Board);
  Serial.print("\nCommand Status: ");
  Serial.print(commandStatus);
  Serial.print("\n");

  // PART 3 - IR CONTROLS / MESSAGE
  // NOT YET FULLY ADDED
  // Use Switch Case?

  // POWER
  if (!strcmp(Command, "device1-power") && !commandStatus) {
    irsend.sendNEC(0x20DF10EF, 32);  // POWER VISO
    delay(800);
        // VISIO 20DF10EF
        // YAMAHA 7E8154AB
        // SAMSUNG

        switch (Board) {
          case 1:
            // irsend.sendNEC(0x20DF10EF, 32);  // POWER SAMSUNG
          break;
          case 2:
            irsend.sendNEC(0x7E8154AB, 32);  // POWER YAMAHA
          break;
          case 3:
            irsend.sendNEC(0x20DF10EF, 32);  // POWER VISO
          break;
          default:
            irsend.sendNEC(0x20DF10EF, 32);  // POWER VISO
        }
        conn.connectNonBlocking(server_addr, server_port, user, password);
        delay(500);
        runInsert();
        conn.close();
  }

  // VOLUME UP
  if (!strcmp(Command, "device1-volup") && !commandStatus) {
        // VISIO 20DF40BF
        // YAMAHA 5EA158A7
        // SAMSUNG 0xE0E0E01F

         switch (Board) {
          case 1:
            irsend.sendNEC(0xE0E0E01F, 32);  // SAMSUNG
          break;
          case 2:
            irsend.sendNEC(0x5EA158A7, 32);  // YAMAHA
          break;
          case 3:
            irsend.sendNEC(0x20DF40BF, 32);  // VISO
          break;
          default:
            irsend.sendNEC(0x20DF40BF, 32);  // POWER VISO
        }
        delay(800);  // At least 800 ms delay for signal
        conn.connectNonBlocking(server_addr, server_port, user, password);
        delay(500);
        runInsert();
        conn.close();
  }

  // VOLUME DOWN
  if (!strcmp(Command, "device1-voldown") && !commandStatus) {
        // VISIO 20DFC03F
        // YAMAHA 5EA1D827
        // SAMSUNG 0xE0E0D02F

         switch (Board) {
          case 1:
            irsend.sendNEC(0xE0E0E01F, 32);  // SAMSUNG
          break;
          case 2:
            irsend.sendNEC(0x5EA158A7, 32);  // YAMAHA
          break;
          case 3:
            irsend.sendNEC(0x20DF40BF, 32);  // VISO
          break;
          default:
            irsend.sendNEC(0x20DF40BF, 32);  // POWER VISO
        }

        delay(800);  // At least 800 ms delay for signal
        conn.connectNonBlocking(server_addr, server_port, user, password);
        delay(500);
        runInsert();
        conn.close();
  }

  // CHANNEL UP
  if (!strcmp(Command, "device1-chup") && !commandStatus) {
        // VISIO 20DF00FF
        // YAMAHA
        // SAMSUNG

        switch (Board) {
          case 1:
            // irsend.sendNEC(0x20DF00FF, 32);  //  SAMSUNG
          break;
          case 2:
            // irsend.sendNEC(0x5EA158A7, 32);  //  YAMAHA
          break;
          case 3:
            irsend.sendNEC(0x20DF00FF, 32);  //  VISO
          break;
          default:
            irsend.sendNEC(0x20DF10EF, 32);  // POWER VISO
        }

        delay(800);  // At least 800 ms delay for signal
        conn.connectNonBlocking(server_addr, server_port, user, password);
        delay(500);
        runInsert();
        conn.close();
  }

  // CHANNEL DOWN
  if (!strcmp(Command, "device1-chdown") && !commandStatus) {
        // VISIO 20DF807F
        // YAMAHA
        // SAMSUNG
        switch (Board) {
          case 1:
            // irsend.sendNEC(0x20DF00FF, 32);  //  SAMSUNG
          break;
          case 2:
            // irsend.sendNEC(0x5EA158A7, 32);  //  YAMAHA
          break;
          case 3:
            irsend.sendNEC(0x20DF807F, 32);  //  VISO
          break;
          default:
            irsend.sendNEC(0x20DF807F, 32);  // POWER VISO
        }
        delay(800);  // At least 800 ms delay for signal

        conn.connectNonBlocking(server_addr, server_port, user, password);
        delay(500);
        runInsert();
        conn.close();
  }

  delay(500);
}
