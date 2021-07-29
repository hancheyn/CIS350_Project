//Original Source code for esp32 post request by:
//https://techtutorialsx.com/2017/05/20/esp32-http-post-requests/
//
//Author by Nathan Hanchey 1/30/2019
//
#include <WiFi.h>
#include <HTTPClient.h>
#include <string.h>

//IR Setup
#include <IRremote.h>

#define TIMER_PWM_PIN  12
IRsend irsend; //PIN 3 Default


//Web connection (Must use your own wifi network)
const char* ssid = "Bamboo";
const char* password =  "kungfupanda1";

int i, j, endfor = 0, charVal = 0;
char command[30];

#define LED_1 15
#define LED_2 32
#define LED_3 14

void setup() {
 
  Serial.begin(115200);
  delay(4000);
  WiFi.begin(ssid, password);
 
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Connecting to WiFi..");
  }
  Serial.println("Connected to the WiFi network");

  pinMode(LED_1, OUTPUT);
  pinMode(LED_2, OUTPUT);
  pinMode(LED_3, OUTPUT);

  digitalWrite(LED_1, HIGH);
  digitalWrite(LED_2, LOW);
  digitalWrite(LED_3, LOW);
  delay(300);
  
  digitalWrite(LED_1, LOW);
  digitalWrite(LED_2, HIGH);
  digitalWrite(LED_3, LOW);
  delay(300);
  
  digitalWrite(LED_1, LOW);
  digitalWrite(LED_2, LOW);
  digitalWrite(LED_3, HIGH);
  delay(300);

  digitalWrite(LED_1, LOW);
  digitalWrite(LED_2, LOW);
  digitalWrite(LED_3, LOW);
  delay(300);
}


void loop() {

  String URL_packet = "http://cis350.ellsworth-mi.com/get-values.php";
  int uploadVal = 0; //i
  int endLoop = 0;
  i = 0;
  endfor = 0;

  //PART 1 - CONNECT & RETRIEVE
  if ((WiFi.status() == WL_CONNECTED)) { //Check the current connection status
    
  //Retrieve data  
   //and find inputed value collected from website
  HTTPClient http;
  //Upload the temp and humidity here
  //URL_packet += String(uploadVal);
  //URL_packet += String("&temp=5");

  http.begin(URL_packet);
  delay(100);
  
   //Specify the URL and get SQL information back
    int httpCode = http.GET();                                        //Make the request
    if (httpCode > 0) { //Check for the returning code
      
        //Get HTML back with getString
        String payload = http.getString(); 
        Serial.println(httpCode);
        Serial.println(payload);

  //PART 2 - SEARCH FOR COMMANDS
      // Add in for loop to find important value once timer goes too high
    int index = 0, i_command = 0, i_val = 0, i_val2 = 0;

      for(j=0; j < payload.length() && endfor <= 5; j++) {
        if (payload[j] == 32) {
          ++endfor;
        }
          else if (endfor == 1) {
            charVal = j;
            ++index;
          }
          else if (endfor == 2) {
            //command[i_command] = payload[j];
            //++i_command;
          }
          else if (endfor == 3) {
            command[i_command] = payload[j];
            ++i_command;
          }
          else if (endfor == 4) {
            
            command[i_command] = '\0';
            charVal = j;
          }
          else if (endfor == 5) {
            
            //charVal = j;
          }
      }
      //end of new for loop
      Serial.println(command);
      i = (int)payload[charVal-1] - '0';
      Serial.println(i);
      }
    else {
      Serial.println("Error on HTTP request");
    }
    http.end(); //Free the resources
  }


  //PART 3 - IR CONTROLS / MESSAGE 
  //! NOT YET FULLY ADDED 
  delay(500);

//OLD CONDITIONALS
  if(!strcmp(command,"device1-volup")) {
  digitalWrite(LED_1, HIGH);
  digitalWrite(LED_2, LOW);
  digitalWrite(LED_3, LOW);
  irsend.sendNEC(0xE0E0E01F, 32); //Volume Up SAMSUNG
  delay(800); //At least 800 ms delay for signal
  }

  if(!strcmp(command,"device1-power")) {
  digitalWrite(LED_1, LOW);
  digitalWrite(LED_2, LOW);
  digitalWrite(LED_3, LOW);
  delay(300);
  }

  if(!strcmp(command,"device1-voldown")) {
  digitalWrite(LED_1, LOW);
  digitalWrite(LED_2, LOW);
  digitalWrite(LED_3, HIGH);
  irsend.sendNEC(0xE0E0D02F, 32); //Volume Down SAMSUNG
  delay(300);

  digitalWrite(LED_1, LOW);
  digitalWrite(LED_2, HIGH);
  digitalWrite(LED_3, LOW);
  delay(300);

  digitalWrite(LED_1, HIGH);
  digitalWrite(LED_2, LOW);
  digitalWrite(LED_3, LOW);
  delay(300);

  digitalWrite(LED_1, LOW);
  digitalWrite(LED_2, LOW);
  digitalWrite(LED_3, LOW);
  delay(300);
  }

/*
  //Add ir transmittor code below
    irsend.sendNEC(..., 32); // Replace ... with 0x / hex code
    Serial.println("IR Transmitted");
    delay(500);
*/
  delay(600);
 
}