// This Class will execute the Car but in reverse direction to the main car
/*
- The properties of the Reverse Car is as follows:
 - The body placement of the car.
 - Wheels of the car which will rotate based on keypress fucntions.
 - Wheels to rotate will have another function which will rotate the car in actual.
 - CarRun function will denote how the car will run based on the size allotments.
 -  Move function - this function is basically the main function that will move the car.
 */
class ReverseCar3
{
  // 1. Initialization.
  Box b3;
  float RC2X=random(1000, 2000);
  int RY2=230;
  int RBX2=140;
  int RBY2=135;
  PImage RC3;
  PImage RC3Wheels;
  int RC3counter=0;
  float S =9;// this will take of the S;
  // 2. Constructor of the class
  ReverseCar3()
  {
    RC3 = loadImage("carn2.png");
    RC3Wheels = loadImage("mwheels2.png");
  }
  // 3. Properties of the Reverse Car.

  // Main Display of Reverse Car
  void Display()
  {
    b3 = new Box(140, 135, RC2X-70, RY2-75);
    b3.display();
    //noStroke();
    //noFill();
    //rect(RCX-70,RY-75,RBX,RBY);
    RCWheelsRotate();
    RCBody();
    if (RC2X<-30) {
      RC2X=width+random(1000, 2000);
    }
  }
  void Move()
  {
    RC2X=RC2X-S;
    S=9;
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
    translate(RC2X, RY2);
    image(RC3, 0, 0, 150, 150);
    popMatrix();
  }
  // Wheels of the Reverse Car.
  void RCWheelsRotate()
  {
    imageMode(CENTER);
    RC3counter= RC3counter+45;
    pushMatrix();
    translate(RC2X-38, 260);
    rotate(RC3counter*TWO_PI/360);
    image(RC3Wheels, 0, 0, 75, 75);
    popMatrix();
    pushMatrix();
    translate(RC2X+44, 260);
    rotate(RC3counter*TWO_PI/360);
    image(RC3Wheels, 0, 0, 75, 75);
    popMatrix();
  }
}