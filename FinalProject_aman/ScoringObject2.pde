/*
This class will give insight on the Scoring object
 -  The properties will be:
 - Coin placement
 - Coin moving according to the lane
 */

class ScoringObject2
{
  // 1. Initialization
  Box b5;
  float CoinX2=random(width, width+500);
  // speed initialization
  float CS1=9;
  float CS2=12;
  float CS3=10;
 // image initilization
 PImage Coin1;
  // 2. Constructor
 ScoringObject2()
 {
   Coin1 = loadImage("coin.png");
 }
  // 3. Properties of the Scoring Objects.
  // This will move the coin across the lanes
  void Coin1Move()
  {
    if(CoinX2<-500)
  CoinX2=random(1050,1000);

    CoinX2=CoinX2-9;
    
}
  
  // this will display the coin
  void Coin1Display(float x)
  {
    
    b5 = new Box(100,100,x-50,430-50);
    b5.display();
    //println("println:"+b4.bottomRightX);
    imageMode(CENTER);
    pushMatrix();
    translate(x, 430);
    image(Coin1, 0, 0, 100, 100);
    popMatrix();
  }
  
  // main display for the coin on the Screen
  void CoinMain()
  {
    
    if(key==CODED){
  if(keyCode==RIGHT){
    CoinX2 = CoinX2-CS3;
    Coin1Display(CoinX2);
    //b4 = new Box(100,100,CoinX2-50,230-50);
  }else if(keyCode==UP){
    CoinX2=CoinX2-CS2;
    Coin1Display(CoinX2);
    //b4 = new Box(100,100,CoinX2-50,230-50);
  }else if(keyCode==DOWN){
    CoinX2=CoinX2-CS2;
    Coin1Display(CoinX2);
    //b4 = new Box(100,100,CoinX2-50,230-50);
  }else if(keyCode==LEFT){
    CoinX2=CoinX2-2;
    Coin1Display(CoinX2);
    //b4 = new Box(100,100,CoinX2-50,230-50);
  }else{
    CoinX2=CoinX2-CS1;
    Coin1Display(CoinX2);
    //b4 = new Box(100,100,CoinX2-50,230-50);
  }
  }
  //if(b4!=null)
  //b4.display();
  }
}