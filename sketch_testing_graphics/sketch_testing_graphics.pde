import processing.serial.*; // this library handles the serial talk 

Serial myPort;  // Create object from Serial class
String data="" ; // empty string to gather the pot values
PFont  myFont;  // object from the font class
void setup()// this runs just once
{
size(950,500); // size of processing window
background(0);// setting background color to black
myPort = new Serial(this, "COM14", 9600);// giving parameters to object of serial class,put the com to which your arduino is connected and the baud rate
myPort.bufferUntil('\n');// gathers data till new line character
myFont = createFont("Georgia", 100);// font type see the data folder of your sketch
textFont(myFont,20);

}
void draw()
{
  //HEART BEAT
  
  //data = "Heart beat readings : 50 bpm   SPO2 : 95%";
  background(255);//refreshing background everytime the draw runs
  textAlign(CENTER);// alighn text to the centre of coordinates
  fill(0);// fill white color to text
  text(data,400,150);// display the data at 350,155 coordinate
  textSize(40);// size of text
  fill(#4B5DCE);// fillinf blue color on the text 
 // text("Heart beat readings : 50 bpm   SPO2 : 95%",155,150);
   noFill();//the upcoming rect will not have anything inside
   stroke(#4B5DCE);// color of boader of rectangle
   rect(5,100,900,80);// rectangle
   
   //SPO2
   
   

   
   
  
}
void serialEvent(Serial myPort)// whenever serial event happens it runs
{
  
  data=myPort.readStringUntil('\n'); //gathering data from pot in a variable
}