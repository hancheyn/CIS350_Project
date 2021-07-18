#include <IRremote.h>

IRsend irsend;

void setup() {
  Serial.begin(9600);

  irsend.sendNEC(0xE0E0E01F, 32); //Power Code
  Serial.println("Volume");
  delay(800);

  irsend.sendNEC(0xE0E0E01F, 32); //Power Code
  Serial.println("Volume");
  delay(800);
  
  irsend.sendNEC(0xE0E0D02F, 32); //Power Code
  Serial.println("Volume");
  delay(800);

  irsend.sendNEC(0xE0E0D02F, 32); //Power Code
  Serial.println("Volume");
  delay(800);

}


void loop() {
  //Power//
//  irsend.sendNEC(0xE0E040BF, 32); //Power Code
//  Serial.println("Power");
  
 
}
