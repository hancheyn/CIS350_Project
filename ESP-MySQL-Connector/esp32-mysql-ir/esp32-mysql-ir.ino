

/*************************************************************************
 * Title: ESP32 IR Controller
 * Description:
 * 
 * Authors: Austin, Nathan, Dale
 * 
 * References and Source Code:
 *  "MySQL" Library in Arduino Library Management
 *    MySQL_MariaDB_Generic by Dr. Charles Bell & Khoi Hoang
 *  
 *  
 * 
 * ESP Help:
 * https://techtutorialsx.com/2017/05/20/esp32-http-post-requests/
 *************************************************************************/

/*************************************************************************
 * SQL / WIFI SETUP
 */
#include <MySQL_Generic_WiFi.h>

char ssid[] = "your SSID";        // your network SSID (name)
char pass[] = "your password here";        // your network password

char user[]         = "remoteuser";              // MySQL user login username
char password[]     = "fDTuZ6Z&Bt";          // MySQL user login password

int ID;
char Command[32];
int Board;
int commandStatus;

#define MYSQL_DEBUG_PORT      Serial

// Debug Level from 0 to 4
#define _MYSQL_LOGLEVEL_      1


IPAddress server_addr(3, 15, 200, 46);
uint16_t server_port = 3306;

//SQL query to run to get data from table
String query = String("SELECT * FROM cis350project.commands WHERE ID='1'");

MySQL_Connection conn((Client *)&client);

// Create an instance of the cursor passing in the connection
MySQL_Query sql_query = MySQL_Query(&conn);
/* END OF SQL WIFI SETUP
 *************************************************************************/


/*************************************************************************
 * IR LIBRARY SETUP
 */
#include <string.h>

//IR Setup
#include <IRremote.h>

#define TIMER_PWM_PIN  12
IRsend irsend; //PIN 3 Default
/* END OF IR SETUP
 *************************************************************************/

void setup()
{
  Serial.begin(115200);
  while (!Serial);

  MYSQL_DISPLAY("\nStarting Basic_Select_WiFi on");
  MYSQL_DISPLAY(MYSQL_MARIADB_GENERIC_VERSION);

  // Remember to initialize your WiFi module
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
  if (WiFi.status() == WL_NO_SHIELD)
  {
    MYSQL_DISPLAY(F("WiFi shield not present"));
    // don't continue
    while (true);
  }
#endif

  // Begin WiFi section
  MYSQL_DISPLAY1("Connecting to", ssid);

  WiFi.begin(ssid, pass);
  
  while (WiFi.status() != WL_CONNECTED) 
  {
    delay(500);
    MYSQL_DISPLAY0(".");
  }

  //debug information about WiFi and SQL connection:
  MYSQL_DISPLAY1("Connected to network. My IP address is:", WiFi.localIP());
  MYSQL_DISPLAY3("Connecting to SQL Server @", server_addr, ", Port =", server_port);
  MYSQL_DISPLAY5("User =", user, ", PW =", password, ", DB =", "cis350project");
}

void runQuery()
{
  row_values *row = NULL;
  long head_count = 0;

  // Initiate the query class instance
  MySQL_Query query_mem = MySQL_Query(&conn);
  
  // Execute the query
  MYSQL_DISPLAY(query);

  // Execute the query
  // KH, check if valid before fetching
  if ( !query_mem.execute(query.c_str()) )
  {
    MYSQL_DISPLAY("Querying error");
    return;
  }
  
  // Fetch the columns so we know how many columns
  //there will be when we loop through the row
  column_names *cols = query_mem.get_columns();

  // Read the row - do-while loop
   do
  {
    row = query_mem.get_next_row();

    if (row != NULL)
    {
      for (int f = 0; f < cols->num_fields; f++)
      {
        //MYSQL_DISPLAY0(row->values[f]);
        if (f = 0) {
          //SQL int read as Char so has to be converted back with atoi
          ID = atoi(row->values[f]);
        }
        if (f = 1) {
          //have to use strcopy because char array can't be assigned with =
          strcpy(Command, row->values[f]);
        }
        if (f = 2) {
          //SQL int read as Char so has to be converted back with atoi
          Board = atoi(row->values[f]);
        }
        if (f = 3) {
          //SQL int read as Char so has to be converted back with atoi
          commandStatus = atoi(row->values[f]);
        }
      }
    }
  } while (row != NULL);

  delay(500);
}

void loop()
{
  MYSQL_DISPLAY("Connecting...");
  
  //test connection
  if (conn.connectNonBlocking(server_addr, server_port, user, password) != RESULT_FAIL)
  {
    //delay(500);
    runQuery();
    //close SQL connection--leave open if we are going to keep polling??
    conn.close();
  } 
  else 
  {
    MYSQL_DISPLAY("\nConnect failed. Trying again on next iteration.");
  }

 //print variables stored from MySQL loop
  Serial.print("\nID: ");
  Serial.print(ID);
  Serial.print("\nCommand: ");
  Serial.print(Command);
  Serial.print("\nBoard: ");
  Serial.print(Board);
  Serial.print("\nCommand Status: ");
  Serial.print(commandStatus);
  Serial.print("\n");


  //PART 3 - IR CONTROLS / MESSAGE 
  //! NOT YET FULLY ADDED 
  //Use Switch Case
  if(!strcmp(command,"device1-volup")) {
    irsend.sendNEC(0xE0E0E01F, 32); //Volume Up
    delay(800); //At least 800 ms delay for signal
  }

  if(!strcmp(command,"device1-power")) {
    
    delay(800);
  }

  if(!strcmp(command,"device1-voldown")) {

    irsend.sendNEC(0xE0E0D02F, 32); //Volume Down Samsung
    delay(800);
  }
  
  
  delay(500);
}
