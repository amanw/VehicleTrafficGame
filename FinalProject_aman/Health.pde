// This Object will help identify the health of the Car.
// The health will be divided to 4 lives
class Health
{
  //1. Initialization
  PImage Cimg;
  float healthx;
  //2. Constructor
  Health(float HX)
  {
    Cimg = loadImage("cars.png");
    healthx=HX;
  }
  //3. Properties
  void display()
  {
    image(Cimg,healthx,60);
  }
}