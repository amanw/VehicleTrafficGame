/*
This class will have access to all the screens in Loop.
- This is the main class which will display the screens based on selection.
- There are various screens start,summer,winter,end,replay, exit
 */
class Screens
{
  // 1. Initialization
  // declare all class variables
  Button startButton;
  Button winButton;
  Button replayButton;
  Button exitButton;
  Button Summer;
  Button Winter;
  Button Night;
  Button Restart;
  Button NextButton1;
  Button NextButton2;
  Background Bg;
  Car car;
  ReverseCar1 RC1;
  ReverseCar2 RC2;
  ReverseCar3 RC3;
  ScoringObject1 SO1;
  ScoringObject2 SO2;
  ScoringObject3 SO3;
  Health[] H = new Health[4];
  // Variable Initializations
  float rotateVal=0;
  // Image Initializations
  PImage StartScreen;
  PImage Instructions;
  PImage Hint;
  PImage Bgg;
  PImage GameOver;
  PImage Sad;
  PImage Win;
  PImage Exit;
  // 2. Paramerized Constructor
  Screens(int tempx, int tempy)
  {
    StartScreen = loadImage("Startscreen.png");
    Instructions = loadImage("play.png");
    Hint = loadImage("hint.png");
    Bgg = loadImage("bg.png");
    GameOver = loadImage("gameover.png");
    Sad = loadImage("sad.png");
    Win = loadImage("win.png");
    Exit = loadImage("bye.png");
    car = new Car(tempx, tempy);
    RC1 =  new ReverseCar1();
    RC2 =  new ReverseCar2();
    RC3 =  new ReverseCar3();
    Bg = new Background();
    SO1 =  new ScoringObject1();
    SO2 = new ScoringObject2();
    SO3 = new ScoringObject3();
    for (int i=0; i<H.length; i++) { // gives the desired amount of lives
      H[i]=new Health(0 + (i*400));
    }
  }
  // 3. Properties of Screens
  // This will display the start of the screen which can be seen on play
  void startScreen () {
    background(0);
    pushMatrix();
    translate(500, 400);
    image(StartScreen, 0, 0, 1000, 800); 
    popMatrix();
    buttonFont = loadFont("Baghdad-24.vlw");
    textFont(buttonFont);
    fill(20, 58, 81);
    //text("Vehicle traffic Game",10,60);
    //text ("Instructions:", 10, 100);
    //text ( "Here is how you play the game", 10, 140);
    text("Please Proceed by clicking the start button", 200, 450);
    //text("Good Luck!", 10, 220);
    startButton.display();
  }
  // This will display the instructions of the game.
  void nextScreen1 () {
    background(0);
    pushMatrix();
    translate(500, 400);
    image(Instructions, 0, 0, 1000, 800); 
    popMatrix();
    buttonFont = loadFont("AgencyFB-Bold-48.vlw");
    textFont(buttonFont);
    fill(69, 139, 144);
    //text("Vehicle traffic Game",10,60);
    //text ("Instructions:", 10, 100);
    //text ( "Here is how you play the game", 10, 140);
    String s="Instructions";

    text(s, 400, 100);
    //line(400,100,textWidth(s),1);
    //text("Good Luck!", 10, 220);
    NextButton1.display();
  }
  // this will display the hint for the game.
  void nextScreen2 () {
    background(0);
    pushMatrix();
    translate(500, 400);
    image(Hint, 0, 0, 1000, 800); 
    popMatrix();
    buttonFont = loadFont("Baghdad-24.vlw");
    textFont(buttonFont);
    fill(20, 58, 81);
    //text("Vehicle traffic Game",10,60);
    //text ("Instructions:", 10, 100);
    //text ( "Here is how you play the game", 10, 140);
    String s="Please Proceed by clicking the next button below";
    text(s, 250, 450);
    //line(400,100,textWidth(s),5);
    //text("Good Luck!", 10, 220);
    NextButton2.display();
  }
  // Exit screen
  void endGame() {
    println("end");
    background(0);
    buttonFont = loadFont("AppleColorEmoji-48.vlw");
    textFont(buttonFont);
    fill(255, 255, 255);
    image(Exit,500,150,500,300);
    text ("Thanks for Playing the Game!", 100, 400);
    text ("Hope you enjoyed :)", 100, 480);
    text ("Come back soon!", 100, 560);
  } // end endGame

  // This function will be just the main play to reduce the redundancy in code
  void thePlay()
  {
    Restart.display();
    HealthDisplay();
    car.Display();
    car.Move();
    RC1.Display();
    RC1.Move();
    RC2.Display();
    RC2.Move();
    RC3.Display();
    RC3.Move();
    SO1.CoinMain();
    SO1.Coin1Move();
    SO2.CoinMain();
    SO2.Coin1Move();
    SO3.CoinMain();
    SO3.Coin1Move();
    ScoreDisplay();
    if (intersect(car, RC1))
    {
      //println("Intersect");
      carcrash = minim.loadSnippet("Car-crash-sound-effect-[AudioTrimmer.com] (2).mp3");
      carcrash.rewind();
      carcrash.play();
      RC1.RCX=width+random(0, 660);
      if (H.length>0) {
        H=(Health[])shorten(H);
      }
    }
    if (intersect(car, RC2))
    {
      //println("Intersect");
      carcrash = minim.loadSnippet("Car-crash-sound-effect-[AudioTrimmer.com] (2).mp3");
      carcrash.rewind();
      carcrash.play();
      RC2.RC1X=width+random(1000, 2000);
      if (H.length>0) {
        H=(Health[])shorten(H);
      }
    }
    if (intersect(car, RC3))
    {
      //println("Intersect");
      carcrash = minim.loadSnippet("Car-crash-sound-effect-[AudioTrimmer.com] (2).mp3");
      carcrash.rewind();
      carcrash.play();
      RC3.RC2X=width+random(1000, 2000);
      if (H.length>0) {
        H=(Health[])shorten(H);
      }
    }
    if (H.length==0)
    {
      loose=true;
      t=0;
      interval=0;
      wait=0;
      println("Lost");
      LoseScreen();

      //interval=1;
    }
    if (intersect(car, SO1))
    {
      SO1.CoinX1 = random(1050, 1000);
      coinsound = minim.loadSnippet("coinsound.mp3");
      coinsound.rewind();
      coinsound.play();
      Score=Score+10;
      println("Score:"+Score);
      ScoreDisplay();
    }
    if (intersect(car, SO2))
    {
      SO2.CoinX2 = random(1050, 1000);
      coinsound = minim.loadSnippet("coinsound.mp3");
      coinsound.rewind();
      coinsound.play();
      Score=Score+10;
      println("Score:"+Score);
      ScoreDisplay();
    }
    if (intersect(car, SO3))
    {
      SO3.CoinX3 = random(1050, 1000);
      coinsound = minim.loadSnippet("coinsound.mp3");
      coinsound.rewind();
      coinsound.play();
      Score=Score+10;
      println("Score:"+Score);
      ScoreDisplay();
    }
  }
  // Summer diplay
  void theSummerPlay()
  {
    summerR=true;
    winterR=false;
    pushMatrix();
    translate(width, 1);
    scale(-1, 1);
    Bg.SummerDisplay();
    Bg.grassUp();
    Bg.grassDown();
    Bg.RoadMain();
    Bg.cloudsDisplay();
    popMatrix();
    thePlay();
  }
  // winter display
  void theWinterPlay()
  {
    winterR=true;
    summerR=false;
    background(12, 12, 58);
    pushMatrix();
    translate(width, 1);
    scale(-1, 1);
    Bg.snowUp();
    Bg.snowDown();
    Bg.RoadMain();
    Bg.SnowParticles();
    Bg.WinterDisplay();
    Bg.cloudsDisplay();
    popMatrix();
    thePlay();
  }
// Win Screen for display
  void winScreen() {
    T = new Timer(160);
    t=0;
    interval=0;
    wait=0;
    summer=false;
    winter=false;
    restart=false;
    exit=false;
    replay=false;
    // the lose screen will be the same except 
    // the text won't congratulate the user
    // instead it will wish him better luck next time!
    background(0);
    pushMatrix();
    translate(500, 400);
    image(Bgg, 0, 0, 1000, 800); 
    popMatrix();
    image(GameOver,500,150,400,200);
    buttonFont = loadFont("EngraversMT-48.vlw");
    textFont(buttonFont);
    fill(69, 139, 144);
    image(Win,900,350,150,150);
    text ("Congratulations!", 200, 350);
    buttonFont = loadFont("Baghdad-24.vlw");
    textFont(buttonFont);
    text ( "You have won with a stellar score of "+Score, 300, 390);
    text("Select whether you would like to play again or exit", 250, 420);
    replayButton.display();
    //println("exit button created");
    exitButton.display();
    //exit = exitButton.isClicked(mouseX, mouseY, twang, twang);
  }
  // Lose Screen for display
  void LoseScreen()
  {
    T = new Timer(160);
    t=0;
    interval=160;
    wait=160;
    summer=false;
    winter=false;
    restart=false;
    exit=false;
    replay=false;
    background(0);
    pushMatrix();
    translate(500, 400);
    image(Bgg, 0, 0, 1000, 800); 
    popMatrix();
    image(GameOver,500,150,400,200);
    buttonFont = loadFont("EngraversMT-48.vlw");
    textFont(buttonFont);
    fill(69, 139, 144);
    image(Sad,750,350,100,100);
    text ("You Lost!", 300, 350);
    buttonFont = loadFont("Baghdad-24.vlw");
    textFont(buttonFont);
    text ( "You have Lost with the score of "+Score, 300, 390);
    text("Select whether you would like to play again or exit", 250, 420);
    replayButton.display();
    //println("exit button created");
    exitButton.display();
    // exit = exitButton.isClicked(mouseX, mouseY, twang, twang);
    //exit = exitButton.isClicked(mouseX, mouseY, twang, twang);
  }
  // Weather handling screen.
  void weatherScreen()
  {
    background(0);
    pushMatrix();
    translate(500, 400);
    image(Bgg, 0, 0, 1000, 800); 
    popMatrix();
    buttonFont = loadFont("AppleColorEmoji-48.vlw");
    textFont(buttonFont);
    fill(69, 139, 144);
    text("Choose Weather to Play:", 100, 320);
    Summer.display();
    Winter.display();
    //Night.display();
  }
  // Display the health
  void HealthDisplay()
  {
    // This will to display the Health i.e. 5 lives
    for (int i=0; i<H.length; i++) {

      pushMatrix();
      translate(680, 5);
      scale(.25, .25);
      H[i].display();
      popMatrix();
    }
  }
  //this will help to display the score 
  void ScoreDisplay()
  {
    buttonFont = loadFont("Baghdad-24.vlw");
    textFont(buttonFont);
    if(winterR)
    {
    fill(0,255,0);
    }
    else{
      fill(133,20,75);
    }
    text("Score :"+" "+ Score, 820, 90);
  }
  // Intersect Code for ReverseCar1
  boolean intersect(Car C, ReverseCar1 RC1) {
    if ((C.box.topLeftX > RC1.b1.bottomRightX)
      || (C.box.bottomRightX < RC1.b1.topLeftX)
      || (C.box.topLeftY > RC1.b1.bottomRightY)
      || (C.box.bottomRightY < RC1.b1.topLeftY)) {
      return false;
    } else {
      return true;
    }
  }
  // Intersect Code for ReverseCar2
  boolean intersect(Car C1, ReverseCar2 RC2) {
    if ((C1.box.topLeftX > RC2.b2.bottomRightX)
      || (C1.box.bottomRightX < RC2.b2.topLeftX)
      || (C1.box.topLeftY > RC2.b2.bottomRightY)
      || (C1.box.bottomRightY < RC2.b2.topLeftY)) {
      return false;
    } else {
      return true;
    }
  }
  // Intersect Code for ReverseCar2
  boolean intersect(Car C2, ReverseCar3 RC3) {
    if ((C2.box.topLeftX > RC3.b3.bottomRightX)
      || (C2.box.bottomRightX < RC3.b3.topLeftX)
      || (C2.box.topLeftY > RC3.b3.bottomRightY)
      || (C2.box.bottomRightY < RC3.b3.topLeftY)) {
      return false;
    } else {
      return true;
    }
  }
  // Intersect Code for Coin
  boolean intersect(Car C2, ScoringObject1 S1) {
    if (S1.b4!=null)
    {
      //println(S1.b4.bottomRightX);
      if ((C2.box.topLeftX > S1.b4.bottomRightX)
        || (C2.box.bottomRightX < S1.b4.topLeftX)
        || (C2.box.topLeftY > S1.b4.bottomRightY)
        || (C2.box.bottomRightY < S1.b4.topLeftY)) {
        return false;
      } else {
        return true;
      }
    }
    return false;
  }
  // Intersect Code for Fuel Points
  boolean intersect(Car C3, ScoringObject2 S2) {
    if (S2.b5!=null)
    {
      //println(S2.b5.bottomRightX);
      if ((C3.box.topLeftX > S2.b5.bottomRightX)
        || (C3.box.bottomRightX < S2.b5.topLeftX)
        || (C3.box.topLeftY > S2.b5.bottomRightY)
        || (C3.box.bottomRightY < S2.b5.topLeftY)) {
        return false;
      } else {
        return true;
      }
    }
    return false;
  }
  // Intersect Code for Coin
  boolean intersect(Car C4, ScoringObject3 S3) {
    if (S3.b6!=null)
    {
      //println(S2.b5.bottomRightX);
      if ((C4.box.topLeftX > S3.b6.bottomRightX)
        || (C4.box.bottomRightX < S3.b6.topLeftX)
        || (C4.box.topLeftY > S3.b6.bottomRightY)
        || (C4.box.bottomRightY < S3.b6.topLeftY)) {
        return false;
      } else {
        return true;
      }
    }
    return false;
  }
}