/**
 * Cube Wall by Felix Turner
 * www.airtightinteractive.com
 * Simple animation of 3D boxes with cyclical movement
 *
 * Requires P5Sunflow library:
 * http://hipstersinc.com/p5sunflow 
 */
 
import hipstersinc.sunflow.*;
import hipstersinc.sunflow.shader.*;
import hipstersinc.*;
import processing.opengl.*;

String movName = "img/CubeWall01"; //where to render images
boolean useSunflow = false; //set to false for fast OPENGL render
int numCubes = 20;
float numFrames = 90;//length of animation
float pileSize = 250; //dimension of cube pile
Cube[] cubes = new Cube[numCubes];

// Set up the scene
void setup() {
  if (useSunflow){
    size(1280, 720, "hipstersinc.P5Sunflow");
  }else{  
    size(1280, 720, OPENGL);
  }
  noStroke();  
  
 //create cubes
  for(int i=0; i<numCubes; i++) {
    cubes[i] = new Cube();
  }
}

// Draw our scene
void draw() {
  if (useSunflow){
    setupCamera();
  }else{
    lights();
  }
 
  drawFrame();
 
  if (frameCount <= numFrames) {
    saveFrame(movName + "-####.tif");
  }else{
    exit();
  } 
}

void drawFrame(){
  colorMode(HSB, 100);
  
  if (useSunflow){
    background(255);
  }else{
    background(100);
  } 
 
  // Adjust perspective
  translate(width/2, height/2, 0);
  rotateX(QUARTER_PI );
  rotateZ(QUARTER_PI);

  for(int i=0; i<numCubes; i++) {
    cubes[i].draw();
  }    
}

// Tweak our camera parameters.  Make sure to call this from `draw`
void setupCamera() {
  // Get the P5Sunflow PGraphics
  P5Sunflow sunflow = (P5Sunflow) g;
  // Set our camera to "pinhole"
  sunflow.camera.setType(SunflowCamera.PINHOLE);
}

class Cube {
  float x,y,z,fillColor,h,w,d,xd,yd,zd,maxDelta;
  float maxCubeSize = 180;
  float minCubeSize = 30;
  
  // Contructor (required)
  Cube() {
    init();
  }
    
  void init(){
      
      //set random position
      x = random(-pileSize,pileSize);
      y = random(-pileSize,pileSize);
      z = random(-pileSize,pileSize);
      
      //set random movement speed
      xd = 0;
      yd = 0;
      zd = 0;
      float r = random(1);      
      if (r < 0.3){
        xd = random(-PI,PI);
      }else if (r < 0.6){
        yd = random(-PI,PI);
      }else{
        zd = random(-PI,PI);
      }      
      maxDelta = random(pileSize); 
 
     //set random size     
      h = random(minCubeSize,maxCubeSize);
      w = random(minCubeSize,maxCubeSize);
      d = random(minCubeSize,maxCubeSize);     
  }
    
  void draw(){
    
    pushMatrix();
    
    //move
    if (xd != 0) x = cos(map(frameCount,0,numFrames,-PI,PI)+xd)*maxDelta;
    if (yd != 0) y = cos(map(frameCount,0,numFrames,-PI,PI)+yd)*maxDelta;
    if (zd != 0) z = cos(map(frameCount,0,numFrames,-PI,PI)+zd)*maxDelta;
   
    //draw
    fillColor = map(x,-pileSize,pileSize,0,100);
    translate(x,y,z);
    fill(fillColor,30,90,100);
    box(w,h,d);
    popMatrix();
    }
  }
