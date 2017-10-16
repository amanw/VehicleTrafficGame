// This class will display the coutdown for the game.
class Timer {
  int savedTime; // when timer was started
  int totalTime; // How long the timer should last
  // constructor takes total time that the timer should run for
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  } // end constuctor 
  
  // countdown the behaviors of the timer
    void countdown()
  {
    time=t;
    t=interval=(interval-0.17);
    if(!won && !loose)
    {
    fill(255,0,0);
    text(time,width/2,20); //<>// //<>//
    }
  }
  
}