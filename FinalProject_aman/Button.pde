// Create a multi-purpose Button class
// with text and sound effects

class Button  {    
  // Properties: Button location and size
  float x; // top left x coordinate  
  float y;  // top left right coordinate  
  float w;  // rectangle width 
  float h; // rectangle height
  String t;  // text to add to the button
  // Is the button on or off?
  boolean on = false;

  // Constructor initializes all variables
  Button(float tempX, float tempY, float tempW, float tempH, String tmpT)  {    
    x  = tempX;   
    y  = tempY;   
    w  = tempW;   
    h  = tempH;   
    on = false;  // Button always starts as off
    t = tmpT;
  }    

  boolean isClicked(int mx, int my,AudioSnippet onSound, AudioSnippet offSound) {
    // Check to see if a point is inside the rectangle
    if (mx > x && mx < x + w && my > y && my < y + h) { //<>// //<>//
      on = !on;
      onSound.rewind();
      onSound.play();
      return true;
    } else {
      return false;
    }
    
  }
  
  // Draw the rectangle
  void display() {
    pushMatrix();
    translate(x, y);
    //if (on == true) {
    //  fill(255,0,0);
    //}
    //else{
      fill(255,255,255);  
   // }
    strokeWeight(3);
    stroke(0);
    rect(0, 0, w, h);
    // set up the font
    buttonFont = loadFont("Baghdad-24.vlw");
    textFont(buttonFont);
    fill(0);
    text(t, (-3 *(t.length())+25), 23);
    popMatrix(); 
 } // END display 

} // end class 