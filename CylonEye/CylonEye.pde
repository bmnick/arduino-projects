/*
 * Cylon eye
 *
 * Uses an array of 6 LEDs to emulate the scanning eye of cylon centurions
 * from the Battlestar Galactica TV show.  Even if you are not a fan, it can
 * provide an interesting effect.
 *
 * The Circuit:
 * 6 LEDs, connected from PWM pins to ground, specifically:
 * 0: connected from pin  3 to ground.
 * 1: connected from pin  5 to ground.
 * 2: connected from pin  6 to ground.
 * 3: connected from pin  9 to ground.
 * 4: connected from pin 10 to ground.
 * 5: connected from pin 11 to ground.
 *
 * Created 12 December 2009
 * By Ben Nicholas
 *
 */

/* USER CONFIGURATION SECTION */
int debug = 0;  // Set to 1 to enable debugging information

/* NON-CONFIGURABLE INFORMATION */
int leds[ ] = {3,5,6,9,10,11}; // The pins the LEDs are attached to
int values[ ] = {240, 120, 0, 0, 0, 0}; // the initial values of the leds
int focus = 1;  // Sets the initial focus - changing will break the program
int rl = 1;     // The direction of the oscillation - right or left

/* Program set up method.
 *
 * Runs once when the arduino first recieves power.
 *
 * Sets the pins to output and prepares for any debugging desired. 
 */
void setup() {
  pinMode (leds[0], OUTPUT);
  pinMode (leds[1], OUTPUT);
  pinMode (leds[2], OUTPUT);
  pinMode (leds[3], OUTPUT);
  pinMode (leds[4], OUTPUT);
  pinMode (leds[5], OUTPUT);
  if (debug) {
    Serial.begin(9600);
  }
}

/* Main Program loop.
 * 
 * Runs as long as the arduino has power.
 * 
 * Steps the oscillation forward mathematically and physically:
 * Calculates the next steps based on a 4 LED progression, then applies those
 * steps to the led array.  
 */
void loop() {
  // Calculate the brightness values for the led array
  if (focus + rl > -1 && focus + rl < 6) {
    // will range from 0 to 120 - the leading edge of the oscillation
    values[focus+rl]++;
  }
  // will range from 120 to 240 - the focus of the oscillation
  values[focus]++;
  if (focus - rl > -1 && focus - rl < 6) {
    // will range from 240 to 120 - the first fade of the oscillation
    values[focus-rl]--;
  }
  if (focus - (2*rl) > -1 && focus - (2*rl) < 6) {
    // will range from 120 to 0 - the trailing edge of the oscillation
    values[focus-(2*rl)]--;
  }
  
  // adjust focus - the point of the oscillation that values are based from
  if (values[focus] == 240) {
    if (focus < 5 && focus > 0) {
      // Oscillation is in the middle of the array
      focus += rl;
    } else if (focus == 5) {
      // Oscillation is on the extreme right of the array
      focus--;
      rl = -1;
      delay(350);
    } else if (focus == 0) {
      // Oscillation is on the extreme left of the array
      focus++;
      rl = 1;
      delay(350);
    }
    // Print some debug information over serial
    if (debug) {
      for (int i = 0; i < 6; i++) {
        Serial.print(values[i]);
        Serial.print(" ");
      }
    Serial.println(focus);
    }
  }
  
  // write the values to the led array
  for (int i = 0; i < 6; i++) {
    analogWrite(leds[i], values[i]);
  }
  
  // Delay between steps to smooth out the motion
  delay(1);
  Serial.flush();
}


