import traer.physics.*; // http://www.cs.princeton.edu/~traer/physics/
import controlP5.*;

ParticleSystem ringoffun;
Spring s;
Particle ball, a;

ControlP5 speedControl;

float speed = 1;

void setup() {
  background(0);
  size(400, 400);
  noStroke();
  smooth();
  frameRate(30);
  ellipseMode(CENTER);

  float x = random(width);
  float y = random(height);


  ringoffun = new ParticleSystem(0, 0.1);
  ball = ringoffun.makeParticle(100.0, x, y, 0);
  a = ringoffun.makeParticle(100.0, width/2, height/2, 0);
  a.makeFixed();
  s = ringoffun.makeSpring(ball, a, 20, 2, 150);
  
  speedControl = new ControlP5(this);
  Slider s = speedControl.addSlider("speed", 0, 3, 20, height-20, width-50, 10);
}

void draw() {
  background(0, 10);
  fill(255);
  ellipse(ball.position().x(), ball.position().y(), 20, 20);
  if (mousePressed && (mouseButton == RIGHT)) {
    ball.moveTo(mouseX, mouseY, 0);
  } 
  else {
    ringoffun.advanceTime(speed);
  }
}
