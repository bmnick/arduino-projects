/*
 *  Morse
 *
 * Reads info from serial input and buffers it until it can be displayed.
 * It then reads from the buffer and blinks an led with the morse code of the 
 * input.
 * 
 * The circuit:
 * LED connected from digital pin 13 to ground.
 * Speaker (any type) connected from PWM pin 9 to ground.
 *
 * Note: On most Arduino boards, there is already an LED on the board
 * connected to pin 13, so you don't need any extra components for this example.
 * 
 * 
 * Created 12 December 2009
 * By Ben Nicholas
 * Adapted from Blink example included with Arduino.
 *
 */

/* USER CONFIGURATION SECTION */
int ledPin =  13;    // LED connected to digital pin 13
int speaker = 9;     // Speaker should be connected from 9 to ground
int tone = 500;      // Used to determine the frequency of the audio

/* NON_CONFIGURABLE SECTION */
int incoming = 0;    // The value read from serial
char buffer[128];    // The buffer of items read from serial
int bufpos = 0;      // Current position in the buffer
int start;           // Used for timing the audio

/* Program set up method.
 *
 * Runs once when the arduino first recieves power.
 * 
 * Sets the pins to output and prepares the serial system.
 */
void setup()   {                
  pinMode(ledPin, OUTPUT);
  pinMode(speaker, OUTPUT);
  Serial.begin(9600); 
    
}

// the loop() method runs over and over again,
// as long as the Arduino has power
/* Main program loop.
 *
 * Runs as long as the arduino has power
 * 
 * Reads values from serial input, buffers it, then sends it to output
 */
void loop()                     
{
 if (Serial.available() > 0) 
  {
    Serial.print("Recieved: ");
    while (Serial.available() > 0)
    {
      incoming = Serial.read();
      Serial.print((char)incoming);
      addToBuffer(incoming);
    }
    Serial.println();
    outputBuffer();  
  }
}

/* Buffer output method.
 *
 * Iterates over the loaded section of the buffer and sends each to morse
 * code handling methods.
 */
void outputBuffer()
{
  for (int i = 0; i < bufpos; i++)
  {
    morse(buffer[i]);
  }
  clrBuffer();
}

/* Clear buffer method.
 *
 * Clears the buffer without overriding the data.
 */
void clrBuffer()
{
  bufpos = 0;
}

/* Buffer enqueue method.
 * 
 * Loads "toAdd" into the buffer in the next available position.
 */
void addToBuffer(char toAdd)
{
  buffer[bufpos] = toAdd;
  bufpos++;
}

/* Morse code display method.
 *
 * From the "input" character, determines the encoding in morse code and farms
 * out output to the "dah()" and "dit()" methods.
 */
void morse(char input)
{
 switch (input)
 {
  case 'a': // .-
   dit();
   dah();
   break;
  case 'b': // -...
   dah();
   dit();
   dit();
   dit();
   break;
  case 'c': // -.-.
   dah();
   dit();
   dah();
   dit();
   break;
  case 'd': // -..
   dah();
   dit();
   dit();
   break;
  case 'e': // .
   dit();
   break;
  case 'f': // ..-.
   dit();
   dit();
   dah();
   dit();
   break;
  case 'g': // --.
   dah();
   dah();
   dit();
   break;
  case 'h': // ....
   dit();
   dit();
   dit();
   dit();
   break;
  case 'i': // ..
   dit();
   dit();
   break;
  case 'j': // .---
   dit();
   dah();
   dah();
   dah();
   break;
  case 'k': // -.-
   dah();
   dit();
   dah();
   break;
  case 'l': // .-..
   dit();
   dah();
   dit();
   dit();
   break;
  case 'm': // --
   dah();
   dah();
   break;
  case 'n': // -.
   dah();
   dit();
   break;
  case 'o': // ---
   dah();
   dah();
   dah();
   break;
  case 'p': // .--.
   dit();
   dah();
   dah();
   dit();
   break;
  case 'q': // --.-
   dah();
   dah();
   dit();
   dah();
   break;
  case 'r': // .-.
   dit();
   dah();
   dit();
   break;
  case 's': // ...
   dit();
   dit();
   dit();
   break;
  case 't': // -
   dah();
   break;
  case 'u': // ..-
   dit();
   dit();
   dah();
   break;
  case 'v': // ...-
   dit();
   dit();
   dit();
   dah();
   break;
  case 'w': // .--
   dit();
   dah();
   dah();
   break;
  case 'x': // -..-
   dah();
   dit();
   dit();
   dah();
   break;
  case 'y': // -.--
   dah();
   dit();
   dah();
   dah();
   break;
  case 'z': // --..
   dah();
   dah();
   dit();
   dit();
   break;
  case '1': // .----
   dit();
   dah();
   dah();
   dah();
   dah();
   break;
  case '2': // ..---
   dit();
   dit();
   dah();
   dah();
   dah();
   break;
  case '3': // ...--
   dit();
   dit();
   dit();
   dah();
   dah();
   break;
  case '4': // ....-
   dit();
   dit();
   dit();
   dit();
   dah();
   break;
  case '5': // .....
   dit();
   dit();
   dit();
   dit();
   dit();
   break;
  case '6': // -....
   dah();
   dit();
   dit();
   dit();
   dit();
   break;
  case '7': // --...
   dah();
   dah();
   dit();
   dit();
   dit();
   break;
  case '8': // ---..
   dah();
   dah();
   dah();
   dit();
   dit();
   break;
  case '9': // ----.
   dah();
   dah();
   dah();
   dah();
   dit();
   break;
  case '0': // -----
   dah();
   dah();
   dah();
   dah();
   dah();
   break;
  case ' ': // pause
   delay(1000);
   break;
  case '.': // .-.-.-
   dit();
   dah();
   dit();
   dah();
   dit();
   dah();
   break;
  case ',': // --..--
   dah();
   dah();
   dit();
   dit();
   dah();
   dah();
   break;
  case '?': // ..--..
   dit();
   dit();
   dah();
   dah();
   dit();
   dit();
   break;
  case '!': // -.-.--
   dah();
   dit();
   dah();
   dit();
   dah();
   dah();
   dah();
   break; 
 }
 delay(200); // adds a small space between letters as officially suggested
             // by morse code.
}

/* Dot output method
 * 
 * Blinks the led for for 2 tenths of a second and also plays sound for the 
 * same amount of time.  Equivalent to outputting a dot.
 */
void dit()
{
  digitalWrite(ledPin, HIGH);
  start = millis();
  while ((millis() - start) < 200)
  {
    digitalWrite(speaker, HIGH);
    delayMicroseconds(tone);
    digitalWrite(speaker, LOW);
    delayMicroseconds(tone);
  }
  digitalWrite(ledPin, LOW);
  delay (200);
}

/* Dash output method
 * 
 * Blinks the led for 3 times the length of a "dit" and also plays sound for 
 * the same amount of time.  Equivalent to outputting a dash.
 */
void dah()
{
  digitalWrite(ledPin, HIGH);
  start = millis();
  while ((millis() - start) < 600)
  {
    digitalWrite(speaker, HIGH);
    delayMicroseconds(tone);
    digitalWrite(speaker, LOW);
    delayMicroseconds(tone);
  }
  digitalWrite(ledPin, LOW);
  delay (200);
}
