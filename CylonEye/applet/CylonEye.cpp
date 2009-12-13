#include "WProgram.h"
void setup();
void loop();
int leds[ ] = {3,5,6,9,10,11};
int values[ ] = {240, 120, 0, 0, 0, 0};
int focus = 1;
int rl = 1;

void setup() {
  pinMode (leds[0], OUTPUT);
  pinMode (leds[1], OUTPUT);
  pinMode (leds[2], OUTPUT);
  pinMode (leds[3], OUTPUT);
  pinMode (leds[4], OUTPUT);
  pinMode (leds[5], OUTPUT);
  Serial.begin(9600);
}

void loop() {

  
  // Calculate the next step's values
  if (focus + rl > -1 && focus + rl < 6) {
    values[focus+rl]++;// 0->120  
  }
  values[focus]++;//120 -> 240
  if (focus - rl > -1 && focus - rl < 6) {
    values[focus-rl]--;// 240 -> 120
  }
  if (focus - (2*rl) > -1 && focus - (2*rl) < 6) {
    values[focus-(2*rl)]--;// 120 -> 0
  }
  
  // adjust focus
  if (values[focus] == 240) {
    if (focus < 5 && focus > 0) {
      focus += rl;
    } else if (focus == 5) {
      focus--;
      rl = -1;
      delay(350);
    } else if (focus == 0) {
      focus++;
      rl = 1;
      delay(350);
      for (int i = 0; i < 6; i++) {
        Serial.print(values[i]);
        Serial.print(" ");
      }
    }
    Serial.println(focus);
  }
  
  // write the values to the led array
  analogWrite(leds[0], values[0]);
  analogWrite(leds[1], values[1]);
  analogWrite(leds[2], values[2]);
  analogWrite(leds[3], values[3]);
  analogWrite(leds[4], values[4]);
  analogWrite(leds[5], values[5]);
    
  // wait so the oscillation slows down
  delay(1);
  Serial.flush();
}



int main(void)
{
	init();

	setup();
    
	for (;;)
		loop();
        
	return 0;
}

