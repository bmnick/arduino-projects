/*
  Morse
 
 Reads info from serial input and buffers it until it can be displayed.
 It then reads from the buffer and blinks an led with the morse code of the 
 input.
  
 The circuit:
 * LED connected from digital pin 13 to ground.
 
 * Note: On most Arduino boards, there is already an LED on the board
 connected to pin 13, so you don't need any extra components for this example.
 
 
 Created 1 June 2005
 By Ben Nicholas
 Adapted from Blink example included with Arduino.
 
 */

int ledPin =  13;    // LED connected to digital pin 13
int incoming = 0;
char buffer[128];
int bufpos = 0;

// The setup() method runs once, when the sketch starts

void setup()   {                
  // initialize the digital pin as an output:
  pinMode(ledPin, OUTPUT);
  Serial.begin(9600); 
    
}

// the loop() method runs over and over again,
// as long as the Arduino has power

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

// Take the buffer in it's current state, and display it over the LED
void outputBuffer()
{
  for (int i = 0; i < bufpos; i++)
  {
    morse(buffer[i]);
  }
  clrBuffer();
}

// Reset the buffer without overriding the data
void clrBuffer()
{
  bufpos = 0;
}

// Add the argument to the next position in the buffer
void addToBuffer(char toAdd)
{
  buffer[bufpos] = toAdd;
  bufpos++;
}

// blink the LED to output the morse code version of the argument
void morse(char input)
{
 switch (input)
 {
  case 'a':
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case 'b':
   digitalWrite(ledPin, HIGH);
   delay(600);
   digitalWrite(ledPin, LOW);
   delay(200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case 'c':
  digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case 'd':
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case 'e':
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case 'f':
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case 'g':
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case 'h':
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case 'i':
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case 'j':
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case 'k':
  digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case 'l':
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case 'm':
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case 'n':
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case 'o':
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case 'p':
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case 'q':
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case 'r':
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case 's':
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case 't':
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case 'u':
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case 'v':
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case 'w':
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case 'x':
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case 'y':
  digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case 'z':
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case '1':
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case '2':
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case '3':
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case '4':
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case '5':
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case '6':
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case '7':
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case '8':
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case '9':
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case '0':
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case ' ':
   delay(1000);
   break;
  case '.':
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case ',':
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case '?'
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   break;
  case '!':
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (200);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   digitalWrite(ledPin, HIGH);
   delay (600);
   digitalWrite(ledPin, LOW);
   delay (200);
   break; 
 }
 delay(200);
}
