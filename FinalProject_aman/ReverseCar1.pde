// This Class will execute the Car but in reverse direction to the main car
/*
- The properties of the Reverse Car is as follows:
 - The body placement of the car.
 - Wheels of the car which will rotate based on keypress fucntions.
 - Wheels to rotate will have another function which will rotate the car in actual.
 - CarRun function will denote how the car will run based on the size allotments.
 -  Move function - this function is basically the main function that will move the car.
 */
class ReverseCar1
{
  // 1. Initialization.
   Box b1;
  float RCX=random(width, width+630);
  int RY=630;
  int RBX=140;
  int RBY=135;
  PImage RC1;
  PImage RC1Wheels;
  int RC1counter=0;
  float S =3;// this will take of the S;
  // 2. Constructor of the class
  ReverseCar1()
  {
    RC1 = loadImage("carn.png");
    RC1Wheels = loadImage("mwheels2.png");
   
  }
  // 3. Properties of the Reverse Car.

  // Main Display of Reverse Car
  void Display()
  {
     b1 = new Box(140,135,RCX-70,RY-75);
    b1.display();
    //noStroke();
    //noFill();
    //rect(RCX-70,RY-75,RBX,RBY);
    RCWheelsRotate();
    RCBody();
    if (RCX<-30) {
      RCX=width+random(0, 580);
    }
    
  }
  void Move()
  {
    RCX=RCX-S;
    S=3;
    if (key==CODED) {
      if (keyCode==RIGHT) {
        S=9;
      } else if (keyCode==UP) {
        S=3;
      } else if (keyCode==DOWN) {
        S=3;
      } else {
        S=3;
      }
    }
    if (t<120) {
      S=S+2;
    }
    if (t<100) {
      S=S+4;
    }
    if (t<80) {
      S=S+6;
    }
    if (t<60) {
      S=S+9;
    }
    if (t<40) {
      S=S+11;
    }
    if (t<20) {
      S=S+12;
    }
    
  }
  // Body of the ReverseCar
  void RCBody()
  {
    imageMode(CENTER);
    pushMatrix();
    translate(RCX, RY);
    image(RC1, 0, 0, 150, 150);
    popMatrix();
  }
  // Wheels of the Reverse Car.
  void RCWheelsRotate()
  {
    imageMode(CENTER);
    RC1counter= RC1counter+45;
    pushMatrix();
    translate(RCX-38, 660);
    rotate(RC1counter*TWO_PI/360);
    image(RC1Wheels, 0, 0, 75, 75);
    popMatrix();
    pushMatrix();
    translate(RCX+44, 660);
    rotate(RC1counter*TWO_PI/360);
    image(RC1Wheels, 0, 0, 75, 75);
    popMatrix();
  }
}