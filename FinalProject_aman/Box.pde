// This class will dispay the transparent rectangles to detect intersection.
 class Box {
   // define the properties that the Box has
   // again, notice that since we need to detect box intersection
   // we've selected the edges of the box as properties
       float w; // width
       float h; //height
       float topLeftX;
       float topLeftY;
       float bottomRightX;
       float bottomRightY;
       
       // Constructor takes width and height of the box
       Box(float tempW, float tempH,float tempX,float tempY) {
         w=tempW;
         h=tempH;
         topLeftX = tempX;
         topLeftY = tempY;
         bottomRightX = topLeftX + w;
         bottomRightY = topLeftY + h;
       }
       
// Define the behavior of the Box
      
       // Draw the box
       void display() {
         noStroke();
         noFill();
         rect(topLeftX,topLeftY,w,h);
       }
     }