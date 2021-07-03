//Original Source code for esp32 post request by:
//https://techtutorialsx.com/2017/05/20/esp32-http-post-requests/
//Original Source code for DHT11 temp and humidity sensor by:
//www.elegoo.com
//2016.12.9

//Revised by Nathan Hanchey 1/30/2019
//

//DHT11
#include <SimpleDHT.h>
// for DHT11, 
//      VCC: 5V or 3V
//      GND: GND
//      DATA: 2
int pinDHT11 = A0;
SimpleDHT11 dht11;

#include <WiFi.h>
#include "HTTPClient.h"

//IR library (for ir remote functions)
//#include <IRremote.h>
//#define IR_SEND_PIN  A1; //Try this for send pin
//IRsend irsend(IR_SEND_PIN);

//Web connection (Must use your own wifi network)
const char* ssid = "moto g(6) play 1790";
const char* password =  "aced27cc4a26";

int i, j, endfor = 0, charVal = 0;

#define LED_1 15
#define LED_2 32
#define LED_3 14

void setup() {
 
  Serial.begin(115200);
  delay(4000);
  WiFi.begin(ssid, password);
 delay(500);
  while (WiFi.status() != WL_CONNECTED) {
    
    delay(1000);
    WiFi.begin(ssid, password);
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
  // read with raw sample data.
  byte temperature = 0;
  byte humidity = 0;
  byte data[40] = {0};

  // start working...
  Serial.println("=================================");
  Serial.println("Sample DHT11...");
  

  if (dht11.read(pinDHT11, &temperature, &humidity, data)) {
    Serial.print("Read DHT11 failed");
    return;
  }
  
  Serial.print("Sample RAW Bits: ");
  for (int i = 0; i < 40; i++) {
    Serial.print((int)data[i]);
    if (i > 0 && ((i + 1) % 4) == 0) {
      Serial.print(' ');
    }
  }
  Serial.println("");
  
  Serial.print("Sample OK: ");
  Serial.print((int)temperature); Serial.print(" *C, ");
  Serial.print((int)humidity); Serial.println(" %");
  //
  
  String URL_packet = "http://chartingprofits.com/micro/from_micro.php?unit=1&sensor=";
  int uploadVal = i;
  int endLoop = 0;
  i = 0;
  endfor = 0;
  if ((WiFi.status() == WL_CONNECTED)) { //Check the current connection status

    //Retrieve data  
    // and find inputed value collected from website
  HTTPClient http;
  //Upload the temp and humidity here
  URL_packet += String(uploadVal);
  URL_packet += String("&temp=");
  URL_packet += String((int)temperature);
   URL_packet += String("&hum=");
   URL_packet += String((int)humidity);
  http.begin(URL_packet);
  delay(100);
   // http.begin("http://chartingprofits.com/micro/from_micro.php?unit=1"); //Specify the URL
    int httpCode = http.GET();                                        //Make the request
    if (httpCode > 0) { //Check for the returning code
        String payload = http.getString();
        Serial.println(httpCode);
        Serial.println(payload);
       //Add in for loop to find important value once timer goes too high
      for(j=0; j < 20 && endfor <= 3; j++) {
        if (payload[j] == 35) {
          ++endfor;
          if (endfor == 3) {
            charVal = j;
          }
        }
      }
      //end of new for loop
      Serial.println(charVal);
      i = (int)payload[charVal-1] - '0';
      Serial.println(i);
      }
    else {
      Serial.println("Error on HTTP request");
//       WiFi.begin(ssid, password);
// 
//      while (WiFi.status() != WL_CONNECTED) {
//        delay(1000);
//        Serial.println("Connecting to WiFi..");
//      }
    }
    http.end(); //Free the resources
  }
  else {
    WiFi.begin(ssid, password);
  }
  delay(5000);

  if(i == 1) {
  digitalWrite(LED_1, HIGH);
  digitalWrite(LED_2, LOW);
  digitalWrite(LED_3, LOW);
  delay(300);
  }

  if(i == 2) {
  digitalWrite(LED_1, LOW);
  digitalWrite(LED_2, LOW);
  digitalWrite(LED_3, LOW);
  delay(300);
  }

  if(i == 3) {
  digitalWrite(LED_1, LOW);
  digitalWrite(LED_2, LOW);
  digitalWrite(LED_3, HIGH);
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
 
}
