/*
This class will give insight on the Scoring object
 -  The properties will be:
 - Coin placement
 - Coin moving according to the lane
 */

class ScoringObject1
{
  // 1. Initialization
  Box b4;
  float CoinX1=random(width, width+500);
  // speed initialization
  float CS1=9;
  float CS2=12;
  float CS3=9;
 // image initilization
 PImage Coin1;
  // 2. Constructor
 ScoringObject1()
 {
   Coin1 = loadImage("coin1.png");
 }
  // 3. Properties of the Scoring Objects.
  // This will move the coin across the lanes
  void Coin1Move()
  {
    if(CoinX1<-500)
  CoinX1=random(1050,1000);

    CoinX1=CoinX1-3;
    
}
  
  // this will display the coin
  void Coin1Display(float x)
  {
    
    b4 = new Box(100,100,x-50,230-50);
    b4.display();
    //println("println:"+b4.bottomRightX);
    imageMode(CENTER);
    pushMatrix();
    translate(x, 230);
    image(Coin1, 0, 0, 100, 100);
    popMatrix();
  }
  
  // main display for the coin on the Screen
  void CoinMain()
  {
    
    if(key==CODED){
  if(keyCode==RIGHT){
    CoinX1 = CoinX1-CS2;
    Coin1Display(CoinX1);
    //b4 = new Box(100,100,CoinX1-50,230-50);
  }else if(keyCode==UP){
    CoinX1=CoinX1-CS1;
    Coin1Display(CoinX1);
    //b4 = new Box(100,100,CoinX1-50,230-50);
  }else if(keyCode==DOWN){
    CoinX1=CoinX1-CS1;
    Coin1Display(CoinX1);
    //b4 = new Box(100,100,CoinX1-50,230-50);
  }else if(keyCode==LEFT){
    CoinX1=CoinX1-0;
    Coin1Display(CoinX1);
    //b4 = new Box(100,100,CoinX1-50,230-50);
  }else{
    CoinX1=CoinX1-CS1;
    Coin1Display(CoinX1);
    //b4 = new Box(100,100,CoinX1-50,230-50);
  }
  }
  //if(b4!=null)
  //b4.display();
  }
}