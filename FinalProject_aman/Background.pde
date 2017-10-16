/*
This class will carry background properties those required to the game.
- Moving clouds display at the top of the screen.
- Sun and moon based on weather selection.
- Background color based on weather change.
- Grass and snow moving on x axis.
- Snow particles random.
- 
 
 */
class Background
{
  // Initialization
  Clouds[] clds=new Clouds[15];
  float[] X = new float [0];
  float[] Y = new float [0];
  float[] xV = new float [0];
  float[] yV = new float [0];
  float[] S = new float[0];
  float rotateVal =0;
  int movingSpeed = 70;
  int Roadxx=0;
  int Grassxx=0;
  int counter=0;
  // Image initilization
  PImage sun;
  PImage grass;
  PImage snow;
  PImage moon;
  // Default constructor
  Background()
  {
    sun = loadImage("sun.png");
    grass = loadImage("green.png");
    moon = loadImage("m.png");
    snow = loadImage("Merrybg.jpg");
    imageMode(CENTER); 
    for (int i=0; i<clds.length; i++)
    {
      clds[i]=new Clouds((random(20, 1050)), (random(10.0, 80.0))); 
      // randomizes the clouds position each playthrough
    }
  }
  // Properties of the Background Class
  // This will display the background with the feel of Summer
  void SummerDisplay()
  {
    background(#95c4e0);
    counter=counter+1;
    pushMatrix();
    translate(500,50);
    rotate(radians(counter+0.6));
   image(sun, 0, 0,100,100);// sun image
    popMatrix();
  }

  // Snow particles for winter display
  void SnowParticles()
  {
    noStroke();
    X = append(X, random(0, 800));
    Y = append(Y, 0);
    xV = append(xV, random(-1, 1));
    yV = append(yV, random(1, 3));
    S = append(S, random(1, 7));
  }
  // Winter display
  // Display the snow in form of particles
  void WinterDisplay()
  {
     //<>// //<>//
    //Generation of snow flakes.
    fill(0);
    fill(255);

    for (int i = 0; i<X.length; i++ ) {

      ellipse(X[i], Y[i], S[i], S[i]);
      X[i] += xV[i];       /// Adding them together
      Y[i] += yV[i];     /// to make them move
    }
    counter=counter+1;
    pushMatrix();
    translate(500,50);
    rotate(radians(counter+0.6));
   image(moon, 0, 0,100,100);// sun image
    popMatrix();
  }

  // to display the clouds 
  void cloudsDisplay()
  {
    for (int i=0; i<clds.length; i++) {
      clds[i].display();
      clds[i].move();
    }
  }
  // to move the grass and snow
  void grassMove()
  {
      if(Grassxx>width)
  Grassxx=0;
    if(key==CODED){
  if(keyCode==RIGHT){
    Grassxx=(Grassxx+movingSpeed);
  }else if(keyCode==UP){
    Grassxx=(Grassxx+movingSpeed);
  }else if(keyCode==DOWN){
    Grassxx=(Grassxx+movingSpeed);
  }else{
    Grassxx=0;
  }
  }
  }
  // to display the grass up position
  void grassUp()
  {
    
    image(grass,Grassxx,150,2000,100);
  grassMove();
  }
  // to display grass down the road.
  void grassDown()
  {
    image(grass,Grassxx,750,2000,100);
    grassMove();
  }
  // to display the snow up position
  void snowUp()
  {
    
    image(snow,Grassxx,150,2000,100);
  grassMove();
  }
  // display the snow down the road
  void snowDown()
  {
    image(snow,Grassxx,750,2000,100);
    grassMove();
  }
  // This allows the Road to display and in motion
  void RoadMain()
  {
    Road(Roadxx);
    if(Roadxx>width)
  Roadxx=-150;
  if(key==CODED){
  if(keyCode==RIGHT){
    Roadxx=(Roadxx+movingSpeed);
  }else if(keyCode==UP){
    Roadxx=(Roadxx+movingSpeed);
  }else if(keyCode==DOWN){
    Roadxx=(Roadxx+movingSpeed);
  }else{
    Roadxx=-150;
  }
  }
  }
  void Road(int x)
  {
    fill(1);
    rect(0,200,1000,500);
    for(int Roadx=-150;Roadx<=width+150;Roadx+=200){
  noStroke();
  fill(255);
  rect(Roadx+-150+x, 520,100,20);
  rect(Roadx+-150+x, 350,100,20);
    }
    
  }
}