
import processing.serial.*; // this library handles the serial talk 

Serial myPort;  // Create object from Serial class
String data="" ; // empty string to gather the pot values

PFont f;

// Variable to store text currently being typed
String typing = "";
String typing_NAME = "";
String typing_CONTACT = "";
String typing_AGE = "";


// Variable to store saved text when return is hit
String saved = "";
String saved_NAME = "";
String saved_CONTACT = "";
String saved_AGE = "";

int screen = 0;
int input_count = 0;

void setup() {
  
  
  size(1150,750); // size of processing window
  
  myPort = new Serial(this, "COM14", 9600);
  myPort.bufferUntil('\n');
 
}

void draw() {
  
  
  if(screen == 0)
  {
     f = createFont("Arial",15);
  background(255);
  int indent = 25;
  
  // Set the font and fill for text
  textFont(f);
  fill(0);
  
  // Display everything
  text("Click in this window and ENTER THE PATIENT DETAILS", indent, 40);
  text("NAME: " + typing_NAME,indent,80);
  text("CONTACT: " + typing_CONTACT,indent,100);
  text("AGE: " + typing_AGE,indent,120);
  }
  else
  {
     f = createFont("Arial",15);
    background(255);
    int indent = 25;
    //  textAlign(CENTER);// alighn text to the centre of coordinates
    
  // Set the font and fill for text
  textFont(f);
  fill(0);
  

  // Display everything
  
  
  text("PATIENT DETAILS", indent, 40);
  text("NAME: " + saved_NAME,indent,80);
  text("CONTACT: " + saved_CONTACT,indent,100);
  text("AGE: " + saved_AGE,indent,120);
  
  //////////////////////////////////////////////////////////////////
   f = createFont("Arial",25);
    textFont(f);
  
  //data = "Heart beat readings : 50 bpm   SPO2 : 95%";
  text(data,120,180);
  textSize(40);// size of text
  // text("Heart beat readings : 50 bpm   SPO2 : 95%",155,150);
   noFill();//the upcoming rect will not have anything inside
   stroke(#4B5DCE);// color of boader of rectangle
   rect(50,140,900,80);// rectangle
  
  //////////////////////////////////////////////////////////////////
  f = createFont("Arial",20);
    textFont(f);
  text("ECG GRAPH",indent,300);
  rect(50,340,900,350);// rectangle
  }
    
    
}

void keyPressed() {
  // If the return key is pressed, save the String and clear it
  if (key == '\n' ) {
    
    if(input_count == 0)
    {
      saved_NAME = typing_NAME;
      input_count++;
    }
    else if(input_count == 1)
    {
      saved_CONTACT = typing_CONTACT;
      input_count++;
    }
    else if(input_count == 2)
    {
      saved_AGE = typing_AGE;
      input_count++;
    }
    
    else if(input_count == 3)
    {
      screen++;
      draw();
    }
 
    // A String can be cleared by setting it equal to ""
    typing = ""; 
  }
 
  
  else {
    
    typing = typing + key; 
       if(input_count == 0)
    {
      typing_NAME = typing;
    }
    else if(input_count == 1)
    {
      typing_CONTACT = typing;
    }
    else if(input_count == 2)
    {
      typing_AGE = typing;
    }
    
    
    // Otherwise, concatenate the String
    // Each character typed by the user is added to the end of the String variable.
    
  }
}

void serialEvent(Serial myPort)// whenever serial event happens it runs
{
  
  data=myPort.readStringUntil('\n'); //gathering data from pot in a variable
}