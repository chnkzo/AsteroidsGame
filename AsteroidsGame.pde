//your variable declarations here
SpaceShip Falcon = new SpaceShip(250,450);
Stars [] pluto = new Stars[200];
Asteroids [] juno = new Asteroids[10];

public void setup() 
{
  //your code here
  size(600,600);
       for(int i =0; i< pluto.length;i++)
  {
    pluto[i] = new Stars();
  }
        for(int i =0; i< juno.length;i++)
  {
    juno[i] = new Asteroids((int)(Math.random()*250),(int)(Math.random()*250),(int)(Math.random()*2));
  }
}

public void draw() 
{
  //your code here
  background(0);
  for(int i =0; i< pluto.length;i++)
  {
      pluto[i].show();
  }
   for(int i =0; i< juno.length;i++)
  {
    juno[i].show();
    juno[i].move();
  }
  Falcon.show();
  Falcon.move();
  Falcon.speedLimit();
  Falcon.display();
}

public void keyPressed()
{
  if (keyCode == UP || key == 'w')
  {
    Falcon.accelerate(0.22);
  }
  if (keyCode == LEFT || key == 'a')
  {
    Falcon.rotate(-10);
  }
    if (keyCode == RIGHT || key == 'd')
  {
    Falcon.rotate(10);
  }
      if (keyCode == DOWN || key == 's')
  {
    Falcon.accelerate(-0.10);
  }
  if (key == ' ')
  {
    if(Falcon.getH()>0)
    {
    Falcon.hyperSpace();
  }
  }
}

class Stars 
{
  private int myX, myY,myColor;
Stars()
  {
    myX =(int)(Math.random()*600);
    myY= (int)(Math.random()*600);
    myColor = color(255,255,255);
  }
 public void setX(int x){myX = x;}
 public int getX(){return (int)myX;}
 public void setY(int y){myY =y;}
 public int getY(){return (int)myY;}
 public void show()
{
  fill(myColor);
  stroke(0,0,255);
  ellipse(getX(),getY(),5,5);
}
}

class SpaceShip extends Floater  
{   
  private int hype;
  SpaceShip(double centerX, double centerY)
  {
   corners = 12;
   int[] xList = {-20,-10,10,12,20,5,5,20,12,10,-10,-20};
   int [] yList = {10,20,20,20,5,5,-5,-5,-20,-20,-20,-10};
   xCorners = xList;
   yCorners = yList;
   myColor = color(61,186,227);
   myCenterX = centerX;
   myCenterY = centerY;
   myDirectionX =0;
   myDirectionY = 0;
   myPointDirection = (int)(Math.random()*360); 
   hype = 3;
 }
 public void setX(int x){myCenterX = x;}
 public int getX(){return (int)myCenterX;}
 public void setY(int y){myCenterY =y;}
 public int getY(){return (int)myCenterY;}
 public void setDirectionX(double x) {myDirectionX = x;}
 public double getDirectionX(){return myDirectionX;}
 public void setDirectionY(double y){myDirectionY =y;}
 public double getDirectionY(){return myDirectionY;}
 public void setPointDirection(int degrees){myPointDirection = degrees;}
 public double getPointDirection(){return myPointDirection;}
 public int getH(){return (int)hype;}
 public void setH(int h){hype =h;} 
 public void speedLimit()
 {
  System.out.println(myDirectionX);
  if(myDirectionX > 2.11){
    myDirectionX = myDirectionX- 0.22;
  }
   if(myDirectionY > 2.11){
    myDirectionY = myDirectionY- 0.22;
  }
    if(myDirectionX < -2.11){
    myDirectionX = myDirectionX+ 0.22;
  }
   if(myDirectionY < -2.11){
    myDirectionY = myDirectionY+ 0.22;
  }
 }
 public void hyperSpace()
 {
  myCenterX = (int)(Math.random()*500);
  myCenterY = (int)(Math.random()*500);
  myDirectionX =0;
  myDirectionY = 0;
  hype= hype -1;
 }
 public void display()
 {
  noFill();
  stroke(0);
  textSize(15);
  text("Power",545,20);
  rect(550,30,75,30);
  fill(0,255,0);
  if(hype >2)
  rect(550,30,30,30);
  if (hype >1)
  rect(550,60,30,30);
   if (hype >0)
  rect(550,90,30,30);
 }
}

 class Asteroids extends Floater
 {
  private int myrotSpeed,myRandom,rotRandom;
  Asteroids(double centerX, double centerY, int rotSpeed)
  {
    myRandom =(int)(Math.random()*3)+1;
    myrotSpeed = rotSpeed;
    rotRandom =(int)(Math.random()*2);
    corners = 13;
    int [] xList = {17*myRandom,14*myRandom,6*myRandom,0*myRandom,-7*myRandom,-11*myRandom,-17*myRandom,-16*myRandom,-13*myRandom,-9*myRandom,-2*myRandom,4*myRandom,11*myRandom};
    int [] yList = {4*myRandom,-6*myRandom,-13*myRandom,-15*myRandom,-14*myRandom,-10*myRandom,-6*myRandom,-1*myRandom,6*myRandom,10*myRandom,10*myRandom,16*myRandom,12*myRandom};
    xCorners = xList;
   yCorners = yList;
   myColor = color(105,105,105);
   myCenterX = centerX;
   myCenterY = centerY;
   myDirectionX =(int)(Math.random()*4)-2;
   myDirectionY = (int)(Math.random()*4)-2;
   myPointDirection = (int)(Math.random()*360); 
    }
  public void setX(int x){myCenterX = x;}
 public int getX(){return (int)myCenterX;}
 public void setY(int y){myCenterY =y;}
 public int getY(){return (int)myCenterY;}
 public void setDirectionX(double x) {myDirectionX = x;}
 public double getDirectionX(){return myDirectionX;}
 public void setDirectionY(double y){myDirectionY =y;}
 public double getDirectionY(){return myDirectionY;}
 public void setPointDirection(int degrees){myPointDirection = degrees;}
 public double getPointDirection(){return myPointDirection;}
 public void move()
 {
    super.move();
  for(int i =0; i< juno.length; i++)
  {
    if(rotRandom != 0)
      juno[i].rotate(myrotSpeed);
    else
      juno[i].rotate(myrotSpeed*-1);
  }
 }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   

  public void show ()  //Draws the floater at the current position  
  {             
    fill(160,160,160);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

