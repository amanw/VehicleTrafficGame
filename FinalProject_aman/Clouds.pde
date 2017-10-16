/*
This will display the clouds at the top of the screen
 - It contains the properties like
 - Display which will be used to display the cloud.
 - MOve which will help the clouds to move in motion.
 
 */
class Clouds 
{
  float x;
  float y;
  float cloudSlow=0.3; //cloud slow speed
  float cloudFast=1.0; // fastest cloud speed

  Clouds(float cloudx, float cloudy) 
  {
    x=cloudx;
    y=cloudy;
  }

  // This will help the cloud to move in motion based on random selections.
  void move() 
  { // the clouds loop
    x=(x+random(cloudSlow, cloudFast));
    if (x>width+30) 
    {
      x=-30;
    }
  }

  // This will display the clouds.
  void display() 
  {
    noStroke();
    fill(255);
    ellipse(x, y, 100, 20);
    ellipse(x+10, y+3, 100,20);
    ellipse(x+16, y-2, 100, 20);
  }
}