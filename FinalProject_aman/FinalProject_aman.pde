/* //<>// //<>//
 This is the Main Game Loop
 - The screens object is setup which will display the screens based on mousepress
 - The game will start with Car Object.
 - The reverse Car Object made.
 - push and pop matrix functions used.
 - keypress events used whenever necessary.
 - Intersection of the car done with reference to the exercise learnt in the lecture.
 - Font property used.
 - Screens done with repect to gameloop project
 - When you press mouspress in the middle of the game the game is paused
 - On click of Restart in the game it returns back where u left.
 - the game starts with keys like up,down,right anf left
 - the more u press right key increases the speed and make evrything in motion.
 - Score at the right top corner of ther screen.
 - Health at the top right corner of the screen .
 - Shorten function used when hit my the car decrease in health by 1.
 - start and button press music from freesound.org.
 - Main music attributed as below:
 Music by Eric Matyas
 www.soundimage.org
 */


// import any libraries you need
import ddf.minim.*;
// declare the fonts
PFont buttonFont;
// Class Initializations
Screens screen;
Background BG;
Timer T;
// Global Initializations
boolean start =false;
boolean weather =false;
boolean summer =false;
boolean winter =false;
boolean won = false;
boolean loose = false;
boolean exit = false;
boolean replay = false;
boolean restart = false;
boolean summerR =false;
boolean winterR =false;
boolean Next1 =false;
boolean Next2 =false;
int x=150;
int y=430;
float t=0;
float time;  
float interval=160; /// the count down # ///
float wait=160; // the number that will not change
float sradius=12;
int Score=0;
boolean loopR=false;
// declare all sound variables
Minim minim;
// sample sound effects
AudioSnippet pop;
AudioSnippet twang;
AudioSnippet right;
AudioSnippet coinsound;
AudioSnippet carcrash;
AudioSnippet mainsound;
AudioSnippet startsound;
// The setup Function
/*
This is the main project loop which will execute to display the game.
 
 */
// The setup function to initialize the vairables and instantiate the classes.
void setup()
{
  size(1000, 800);
  minim = new Minim(this); // start the Minim sound engine
  pop = minim.loadSnippet("156859__multimax2121__button-1.wav");
  twang = minim.loadSnippet("twang.mp3");
  right = minim.loadSnippet("right.mp3");
  mainsound = minim.loadSnippet("More-Crazy-Races.mp3");
  startsound = minim.loadSnippet("Guitar-Mayhem.mp3");
  screen = new Screens(x, y);
  screen.startButton = new Button(width/2-40, 700, 90, 30, "start");

  screen.startScreen();
  T = new Timer(160);
  BG = new Background();
  imageMode(CENTER);
  startsound.play();
}

// The draw Function
void draw()
{
  CheckScreens();
  if (interval<0)
  {
    //println("in");
    won=true;
    screen.winScreen();
    T= new Timer(160);
    t=0;
    wait=0;
    interval=0;
  }
  //Loop();
  //println("summer :"+summerR);
  //println("winter :"+winterR);
  //println("interval :"+interval);
  //println("mousex :"+mouseX+"mouseY:"+mouseY);
}

void mousePressed()
{ 
  screen.Summer = new Button(400, 400, 110, 30, "Summer");
  screen.Winter = new Button(400, 460, 110, 30, "Winter");
  screen.Night =  new Button(400, 520, 110, 30, "Night");
  screen.replayButton = new Button(370, 500, 90, 30, "Replay");
  screen.Restart = new Button(200, 20, 90, 30, "Restart");
  screen.exitButton = new Button(500, 500, 90, 30, "Exit");
  screen.NextButton1 = new Button(750, 700, 90, 30, "Next ->");
  screen.NextButton2 = new Button(450, 500, 90, 30, "Next ->");

  start = screen.startButton.isClicked(mouseX, mouseY, pop, pop );
  summer = screen.Summer.isClicked(mouseX, mouseY, pop, pop );
  winter = screen.Winter.isClicked(mouseX, mouseY, pop, pop );
  if (screen.exitButton!=null)
  {
    exit = screen.exitButton.isClicked(mouseX, mouseY, twang, twang);
    //println(exit);
    if (interval==0)
    {
      //CheckScreens();
      summer=false;
      winter=false;
      restart=false;
      replay=false;
    }
  }
  replay = screen.replayButton.isClicked(mouseX, mouseY, pop, pop);
  restart = screen.Restart.isClicked(mouseX, mouseY, pop, pop);
  Next1 = screen.NextButton1.isClicked(mouseX, mouseY, pop, pop);
  Next2 = screen.NextButton2.isClicked(mouseX, mouseY, pop, pop);

  //CheckScreens();
}

// This will display the screens 
void CheckScreens()
{
  // println(exit);
  if (start && !loose && !won)
  {
    screen.nextScreen1();
  } else if (Next1 && !loose && !won)
  {
    screen.nextScreen2();
  } else if (Next2 && !loose && !won)
  {
    screen.weatherScreen();
  } else if (summer && !loose && !won)
  {
    startsound.pause();
    summerR=true;
    winterR=false;
    screen.theSummerPlay();
    boolean sound = mainsound.isPlaying();
    println(sound);
    if (sound==false)
    {
      println("playing");
      mainsound.loop(1);
    }
    //Loop();
    T.countdown();
    // timer=true;

    //T.start();

    //redraw();
  } else if (winter && !loose && !won)
  {
    startsound.pause();
    winterR=true;
    summerR=false;
    screen.theWinterPlay();
    boolean sound = mainsound.isPlaying();
    println(sound);
    if (sound==false)
    {
      println("playing");
      mainsound.loop(1);
    }
    //mainsound.loop(3);
    //Loop();
    T.countdown();
  } else if ((replay &&loose) || (replay && won))
  {
    mainsound.pause();
    loose=false;
    won=false;
    Score=0;
    screen= new Screens(x, y);
    T = new Timer(160);
    t=0;
    interval=160;
    wait=160;
    screen.startButton = new Button(width/2-40, 700, 90, 30, "START");
    //println(interval);
    screen.startScreen();
    startsound.rewind();
    startsound.play();
    mainsound = minim.loadSnippet("More-Crazy-Races.mp3");
    //setup();
  } else if ((exit &&loose) || (exit && won))
  {
    //println("exiten");
    T = new Timer(160);
    t=0;
    interval=0;
    wait=0;
    //println("exit");
    mainsound.pause();
    screen.endGame();
  } else if (restart)
  {
    if (summerR)
    {
      screen.theSummerPlay();
    } else
    {
      screen.theWinterPlay();
    }
    T.countdown();
  } else
  {
    redraw();
    //println("Click");
  }
}
// This gives flexibility to the Car to switch up between the roads.
void keyPressed()
{
  if (key==CODED) {
    if (keyCode==UP) {
      y-=200;
      //mainsound.loop(2);
      //println(y);
      if (y<230)
        y=230;
      //println(y);
    } else if (keyCode==DOWN) {
      y+=200;
      //println(y);
      if (y>630)
        y=630;
      //println(y);
    }
  }
}