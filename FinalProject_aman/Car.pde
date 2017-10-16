/*
This class will create and execute the car with its properties.
- The properties of the car is as follows:
- The body placement of the car.
- Wheels of the car which will rotate based on keypress fucntions.
- Wheels to rotate will have another function which will rotate the car in actual.
- CarRun function will denote how the car will run based on the size allotments.
-  Move function - this function is basically the main function that will move the car.
*/
class Car
{
  // 1. Initializations.
 PImage CarImg;
 PImage WheelImg;
 int carcounter=0;
 int bottomx=275;
 int bottomy=250;
 Box box;
  // 2. Constructor
  Car(int tempx,int tempy)
  {
    x=tempx;
    y=tempy;
    CarImg = loadImage("maincar.png");
    WheelImg = loadImage("mwheels.png");
    
  }
  // 3. Properties of the Car
  
  // Final Display of the Car
  void Display()
  {
    box = new Box(175,130,x-90,y-75);
    CarWheels();// Wheels of the Car
    CarBody();// Body of the Car
    noStroke();
    noFill();
    box.display();
    //rect(x-90,y-75,175,175);
  }
  //Final Move of the Car
  void Move()
  {
    CarRun();
    //CarMove();
  }
  //Body of the Car without wheels
  void CarBody()
  {
    
    imageMode(CENTER);
    pushMatrix();
    translate(x,y);
    image(CarImg,0,0,275,250);
    popMatrix();
  }
  // Initial wheels of the car
  void CarWheels()
  {
    image(WheelImg,x+52,y+25,55,55);
    image(WheelImg,x-42,y+25,55,55);
  }
  //Wheels Rotation of the Car
  void CarWheelsRotate()
  {
    imageMode(CENTER);
    carcounter= carcounter+55;
    pushMatrix();
    translate(x+52,y+25);
    rotate(-carcounter*TWO_PI/360);
   image(WheelImg,0,0,55,55);
    popMatrix();
    pushMatrix();
    translate(x-42,y+25);
    rotate(-carcounter*TWO_PI/360);
   image(WheelImg,0,0,55,55);
    popMatrix();
    //image(WheelImg,48,455,40,40);
  }
  
  // Running Movements of the Car
  void CarRun()
  {
    
    if (key==CODED) {   
  if (keyCode==RIGHT) { 
    CarWheelsRotate (); // Rotate the wheels.
  } else if (keyCode==UP) {     
    CarWheelsRotate ();
  } else if (keyCode==DOWN) {     
    CarWheelsRotate ();
  }

  }
  CarBody();
}


   
 

}