/*
----------begin_max5_patcher----------
315.3ocuREsSCBCE84xWQSeFMzBDh9O3WfYwz0VY0.2RVKQzk42tPAbr4l1r
X7kB2SO8dOmSt6hPj0lNkkfuG+HFg1EgPdnA.zTMhTy6DUbqmFwYJKqTj3wq
Z3NwFMT9zVkvM1FVZwsIwX5czgOrj4S7po2.s0ZnR478iNApk9taV+xM4jCD
MstSYNB4dqQMNOhF5m7pgK2GEMbDGnU.0q8yadZNUm2ADtT7AlhY+jGKxV3w
7ohEd7YC3r528RrGOPmyNuyYWx4VcIvqHwe82QyG30dhjGL.WXH+cIjjOlP3
Tb1uuIvX9TpH+ZRorumRzymRIgYc+vIUZ3z0duAFvONOrl1sh4.eZ8DevBRk
0oAtSafEbnGwYiVJUvRMVqkMl981IIbgs2PUDKPEw9WUDM.EkdkJpuXezmPB
bXgG
-----------end_max5_patcher-----------

Set Out to SoundFlower (2ch)

*/

// Max
import com.cycling74.processing.*;
import com.cycling74.max.*;
MaxProcessingObject maxObj;

// Custom classes
Point2D sketchCenter, eachCircleCenter;
Ring[] rings;

// Global vars
int numRings = 3;
float angle, circleSize;
color[] ringColors = {color(89, 136, 140), color(168, 217, 167), color(252, 255, 176)};
float distance, spinSpeed, amplitude;

void setup() {
  size(700, 400);
  /*size(1680, 1050);*/
  background(16);
  smooth();
  noFill();
  strokeWeight(15);
  stroke(255);
  circleSize = 80;
  distance = 0;
  spinSpeed = 0;
  
  frameRate(30);
  
  randomSeed(millis());
  float tilt = random(0, 360);
  
  sketchCenter = new Point2D(width/2, height/2);
  eachCircleCenter = new Point2D(width/2, height/2);
  rings = new Ring[numRings];
  
  for (int i = 0; i<rings.length; i++){
    rings[i] = new Ring(ringColors[i], 80, ((360 / numRings) * (i+1)) + tilt, sketchCenter, eachCircleCenter);
  }
  
  maxObj = MaxProcessingObject.get(this);
  maxObj.declareIO(2, 1);
  maxObj.createInfoOutlet(false);
}

void draw() {
  background(16);
  
  for (int i = 0; i<rings.length; i++) {
    rings[i].positionRing(amplitude*20*(float)distance*20, (float)spinSpeed*20);
    /*rings[i].positionRing(amplitude*20*(float)mouseX / width * 40, (float)mouseY / height * 20);*/
    /*println(frameCount*(mouseX/width*5));*/
    rings[i].drawRing();
  }
  maxObj.jitter(0);
}

void amplitude(float data) {
  if (maxObj.getInlet() == 0) {
    amplitude = data;
  } else {
    maxObj.post("\nObject does not understand this data at this input");
  }
}

void spin(float data) {
  if (maxObj.getInlet() == 0) {
    spinSpeed = data;
  } else {
    maxObj.post("\nObject does not understand this data at this input");
  }
}

void distance(float data) {
  if (maxObj.getInlet() == 0) {
    distance = data;
  } else {
    maxObj.post("\nObject does not understand this data at this input");
  }
}

class Ring {
  float circleSize;
  float directionAngle;
  color ringColor;
  Point2D radiusCenter, circleCenter;
  
  Ring(color ringColor, float circleSize, float directionAngle, Point2D radiusCenter, Point2D circleCenter) {
    this.circleSize = circleSize;
    this.directionAngle = radians(directionAngle);
    this.ringColor = ringColor;
    this.radiusCenter = radiusCenter;
    this.circleCenter = circleCenter;
  }
  
  void positionRing(float radius, float rotationOffset) {
    directionAngle += radians(rotationOffset);
    circleCenter.x = radiusCenter.x + radius * sin(directionAngle);
    circleCenter.y = radiusCenter.y + radius * cos(directionAngle);
    /*println(directionAngle + " : " + circleCenter.y + " : " + radius + " : " + radiusCenter.y);*/
  }
  
  void drawRing() {
    noFill();
    stroke(ringColor);
    ellipse(circleCenter.x, circleCenter.y, circleSize, circleSize);
  }
}
