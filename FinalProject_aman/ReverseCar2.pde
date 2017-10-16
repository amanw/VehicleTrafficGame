// This Class will execute the Car but in reverse direction to the main car
/*
- The properties of the Reverse Car is as follows:
 - The body placement of the car.
 - Wheels of the car which will rotate based on keypress fucntions.
 - Wheels to rotate will have another function which will rotate the car in actual.
 - CarRun function will denote how the car will run based on the size allotments.
 -  Move function - this function is basically the main function that will move the car.
 */
class ReverseCar2
{
  // 1. Initialization.
   Box b2;
  float RC1X=width;
  int RY1=430;
  int RBX1=140;
  int RBY1=135;
  PImage RC2;
  PImage RC2Wheels;
  int RC2counter=0;
  float S =3;// this will take of the S;
  // 2. Constructor of the class
  ReverseCar2()
  {
    RC2 = loadImage("carn1.png");
    RC2Wheels = loadImage("mwheels2.png");
   
  }
  // 3. Properties of the Reverse Car.

  // Main Display of Reverse Car
  void Display()
  {
     b2 = new Box(140,135,RC1X-70,RY1-75);
    b2.display();
    //noStroke();
    //noFill();
    //rect(RCX-70,RY-75,RBX,RBY);
    RCWheelsRotate();
    RCBody();
    if (RC1X<-30) {
      RC1X=width+random(1000, 2000);
    }
    
  }
  void Move()
  {
    RC1X=RC1X-S;
    S=3;
    if (key==CODED) {
      if (keyCode==RIGHT) {
        S=3;
      } else if (keyCode==UP) {
        S=3;
      } else if (keyCode==DOWN) {
        S=2;
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
    translate(RC1X, RY1);
    image(RC2, 0, 0, 150, 150);
    popMatrix();
  }
  // Wheels of the Reverse Car.
  void RCWheelsRotate()
  {
    imageMode(CENTER);
    RC2counter= RC2counter+45;
    pushMatrix();
    translate(RC1X-38, 460);
    rotate(RC2counter*TWO_PI/360);
    image(RC2Wheels, 0, 0, 75, 75);
    popMatrix();
    pushMatrix();
    translate(RC1X+44, 460);
    rotate(RC2counter*TWO_PI/360);
    image(RC2Wheels, 0, 0, 75, 75);
    popMatrix();
  }
}