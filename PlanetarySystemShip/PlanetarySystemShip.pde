import gifAnimation.*;
float ang;

CelestialBody star1;

CelestialBody planet1;
CelestialBody planet2;
CelestialBody planet3;
CelestialBody planet4;
CelestialBody planet5;

CelestialBody satellite1;

PImage backgroundTexture;

PImage star1Texture;

PImage planet1Texture;
PImage planet2Texture;
PImage planet3Texture;
PImage planet4Texture;
PImage planet5Texture;

PImage satellite1Texture;

boolean drag;

float rotateX, rotateY;

int positionX, positionY, orientationX, orientationY;

float moveX, moveY, moveZ;

GifMaker gif;
int gifCount = 0;

String state = "VISUAL";

void setup()
{
  size(1656,842,P3D);
  stroke(0);
  backgroundTexture = loadImage("background.PNG");
  star1Texture = loadImage("star.jpg");
  planet1Texture = loadImage("planet1.jpg");
  planet2Texture = loadImage("planet2.jpg");
  planet3Texture = loadImage("planet3.jpg");
  planet4Texture = loadImage("planet4.jpg");
  planet5Texture = loadImage("earth.jpg");
  satellite1Texture = loadImage("satelite.jpg");
  ang = 0;
  rotateX = 0;
  rotateY = 0;
  moveX = width/2;
  moveY = height/2;
  moveZ = -500;
  
  //gif = new GifMaker(this, ".gif");
  //gif.setRepeat(0);
}

void draw(){
  switch(state){
    case "VISUAL":
      visual();
      //gif();
      break;
    case "SHIP":
      ship();
      //gif();
      break;
  }
}

void visual(){
  background(backgroundTexture);
  camera();
  translate(width/2, height/2, -500);
    
  textSize(60);
  text("- PRESS ENTER for ship mode",-width/2-500, height/2+200);
  if (drag) {
    rotateY += mouseX - pmouseX;
    rotateX += mouseY - pmouseY;
  }
  
  rotateY(radians(rotateY));
  rotateX(-radians(rotateX));
  pushMatrix();
  star1 = new CelestialBody(star1Texture, 2, 0, 0, 100, 0);
  popMatrix();
  pushMatrix();
  
  planet1 = new CelestialBody(planet1Texture, 1, -1.3, -200, 20, 0);
  satellite1 = new CelestialBody(satellite1Texture, 2, -2, -70, 10, 5);
  popMatrix();
  pushMatrix();
  
  planet2 = new CelestialBody(planet2Texture, 1.2, 2, -400, 35, -8);
  popMatrix();
  pushMatrix();
  
  planet3 = new CelestialBody(planet3Texture, 0.9, -1.75, -500, 25, 0);
  popMatrix();
  pushMatrix();
  planet4 = new CelestialBody(planet4Texture, 1.4, 1, -600, 65, -5);
  popMatrix();
  pushMatrix();
  planet5 = new CelestialBody(planet5Texture, 1.2, -2.3, -800, 30, 10);
  popMatrix();


  ang=ang+0.25;
  if (ang>360){
    ang=0;
  }
}
void ship()
{
  background(backgroundTexture);
  
  camera(width/2.0-positionX, height/2.0-positionY, (height/2.0) / tan(PI*30.0 / 180.0),
         width/2.0-orientationX, height/2.0-orientationY, 0,
         0, 1, 0);
              
  translate(moveX,moveY,moveZ);
  
  textSize(60);
  if (drag) {
    rotateY += mouseX - pmouseX;
    rotateX += mouseY - pmouseY;
  }
  pushMatrix();
  star1 = new CelestialBody(star1Texture, 2, 0, 0, 100, 0);
  popMatrix();
  pushMatrix();
  
  planet1 = new CelestialBody(planet1Texture, 1, -1.3, -200, 20, 0);
  satellite1 = new CelestialBody(satellite1Texture, 2, -2, -70, 10, 5);
  popMatrix();
  pushMatrix();
  
  planet2 = new CelestialBody(planet2Texture, 1.2, 2, -400, 35, -8);
  popMatrix();
  pushMatrix();
  
  planet3 = new CelestialBody(planet3Texture, 0.9, -1.75, -500, 25, 0);
  popMatrix();
  pushMatrix();
  planet4 = new CelestialBody(planet4Texture, 1.4, 1, -600, 65, -5);
  popMatrix();
  pushMatrix();
  planet5 = new CelestialBody(planet5Texture, 1.2, -2.3, -800, 30, 10);
  popMatrix();


  

  ang=ang+0.25;
  if (ang>360){
    ang=0;
  }
  key();
}
void mouseReleased(){
  drag = false;
}

void mouseDragged(){
  if (mousePressed){
    drag = true;
  }
}

void key(){
    if(keyPressed){
      if(state == "SHIP"){
        if(key == 'w'){
          positionY -= 5;
        }
        if(key == 's'){
          positionY += 5;
        }
        if(key == 'd'){
          positionX -= 5;
        }
        if(key == 'a'){
          moveX += 5;
        }
        if(key == ' '){
          moveZ += 10;
        }
        if(key == CODED){
          if(keyCode == UP){
            orientationY -= 10;
          }
          if(keyCode == DOWN){
            orientationY += 10;
          }
          if(keyCode == RIGHT){
            orientationX -= 5;
          }
          if(keyCode == LEFT){
            orientationX += 5;
          }
          if(keyCode == SHIFT){
            moveZ -= 10;
          }
        }
      }
  }
}

void keyReleased(){
  if(key == ENTER){
    if(state == "VISUAL"){
      state = "SHIP";
    }else if(state == "SHIP"){
      state = "VISUAL";
    }
  }
}

void gif(){
  if(gifCount % 5 == 0 && gifCount > 500){
    gif.addFrame();    
  }
  if(gifCount > 700){
     gif.finish(); 
  }
  gifCount++;
}
