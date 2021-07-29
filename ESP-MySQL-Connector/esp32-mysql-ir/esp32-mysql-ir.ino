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
 * @version 1.1
 * @since 2021-07-01 
 */

#include <MySQL_Generic_WiFi.h>
#include <string.h>

#define MYSQL_DEBUG_PORT      Serial
#define _MYSQL_LOGLEVEL_      1

//#include <Arduino.h>
#include <IRremoteESP8266.h>
#include <IRsend.h>


#define LED_1 15
#define LED_2 32
#define LED_3 14

const uint16_t kIrLed = 4;  
IRsend irsend(4); //sets pin

/**
 * Wireless network SSID for WiFi connection.
 */
char ssid[] = "Bamboo";

/**
 * Wireless network password.
 */
char pass[] = "kungfupanda1";

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
 */
String query = String("SELECT * FROM cis350project.commands WHERE ID='1'");

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

  pinMode(LED_1, OUTPUT);
  pinMode(LED_2, OUTPUT);
  pinMode(LED_3, OUTPUT);
  
  Serial.begin(115200);
  while (!Serial) {};
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
    while (true) {};
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
  //IR Remote
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
  // Use Switch Case
  
  if (!strcmp(Command, "device1-power")) {
    irsend.sendNEC(0xE0E0E01F, 32);  // POWER VISO
    delay(800);
  digitalWrite(LED_1, LOW);
  digitalWrite(LED_2, HIGH);
  digitalWrite(LED_3, LOW);    
  }
  
  if (!strcmp(Command, "device1-volup")) {
    irsend.sendNEC(0xE0E0E01F, 32);  // Volume Up
    delay(800);  // At least 800 ms delay for signal
  digitalWrite(LED_1, HIGH);
  digitalWrite(LED_2, LOW);
  digitalWrite(LED_3, LOW);
  }

  if (!strcmp(Command, "device1-voldown")) {
    irsend.sendNEC(0xE0E0D02F, 32);  // Volume Down Samsung
    delay(800);
  digitalWrite(LED_1, HIGH);
  digitalWrite(LED_2, LOW);
  digitalWrite(LED_3, HIGH);    
  }

  if (!strcmp(Command, "device1-chup")) {
    irsend.sendNEC(0xE0E0E01F, 32);  // POWER VISO
    delay(800);
  digitalWrite(LED_1, LOW);
  digitalWrite(LED_2, HIGH);
  digitalWrite(LED_3, HIGH);    
  }
  
  if (!strcmp(Command, "device1-chdown")) {
    irsend.sendNEC(0xE0E0E01F, 32);  // Volume Up
    delay(800);  // At least 800 ms delay for signal
  digitalWrite(LED_1, LOW);
  digitalWrite(LED_2, LOW);
  digitalWrite(LED_3, LOW);
  }
  
  delay(500);

}
