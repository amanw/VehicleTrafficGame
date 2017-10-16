/*
This class will give insight on the Scoring object
 -  The properties will be:
 - Coin placement
 - Coin moving according to the lane
 */

class ScoringObject3
{
  // 1. Initialization
  Box b6;
  float CoinX3=random(width, width+500);
  // speed initialization
  float CS1=3;
  float CS2=6;
  float CS3=9;
 // image initilization
 PImage Coin1;
  // 2. Constructor
 ScoringObject3()
 {
   Coin1 = loadImage("coin1.png");
 }
  // 3. Properties of the Scoring Objects.
  // This will move the coin across the lanes
  void Coin1Move()
  {
    if(CoinX3<-500)
  CoinX3=random(1050,1000);

    CoinX3=CoinX3-3;
    
}
  
  // this will display the coin
  void Coin1Display(float x)
  {
    
    b6 = new Box(100,100,x-50,630-50);
    b6.display();
    //println("println:"+b4.bottomRightX);
    imageMode(CENTER);
    pushMatrix();
    translate(x, 630);
    image(Coin1, 0, 0, 100, 100);
    popMatrix();
  }
  
  // main display for the coin on the Screen
  void CoinMain()
  {
    
    if(key==CODED){
  if(keyCode==RIGHT){
    CoinX3 = CoinX3-CS2;
    Coin1Display(CoinX3);
    //b4 = new Box(100,100,CoinX3-50,230-50);
  }else if(keyCode==UP){
    CoinX3=CoinX3-CS1;
    Coin1Display(CoinX3);
    //b4 = new Box(100,100,CoinX3-50,230-50);
  }else if(keyCode==DOWN){
    CoinX3=CoinX3-CS1;
    Coin1Display(CoinX3);
    //b4 = new Box(100,100,CoinX3-50,230-50);
  }else if(keyCode==LEFT){
    CoinX3=CoinX3-0;
    Coin1Display(CoinX3);
    //b4 = new Box(100,100,CoinX3-50,230-50);
  }else{
    CoinX3=CoinX3-CS1;
    Coin1Display(CoinX3);
    //b4 = new Box(100,100,CoinX3-50,230-50);
  }
  }
  //if(b4!=null)
  //b4.display();
  }
}