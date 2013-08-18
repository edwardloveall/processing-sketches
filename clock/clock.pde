// Polar Clock by Edward Loveall
// www.edwardloveall.com
//
// Based on Pixel breaker's Polar CLock which is much cooler than mine:
// http://blog.pixelbreaker.com/polarclock/

float s;
float m;
float h;
float ms;
float unit = TWO_PI/60.;

void setup() {
  size(300, 300);
  smooth();
  strokeWeight(3);
  stroke(0);
  frameRate(24);
  ellipseMode(CENTER);
}

void draw() {
  background(0);
  
  translate(0, 300);
  rotate(-HALF_PI);
  
  fill(127, 255, 0);
  s = (second()*unit);
  ms = (millis()%1000.)*(TWO_PI/60000.);
  arc(width/2, height/2, 210, 210, 0, s);
  arc(width/2, height/2, 200, 200, 0, s + ms);
  
  m = (minute()*(TWO_PI/60.));
  fill(0);
  ellipse(width/2, height/2, 150, 150);
  fill(0, 127, 255);
  arc(width/2, height/2, 150, 150, 0, m);
  
  h = (hour()*(TWO_PI/24.));
  fill(0);
  ellipse(width/2, height/2, 100, 100);
  fill(255, 0, 127);
  arc(width/2, height/2, 100, 100, 0, h);
  
  fill(0);
  ellipse(width/2, height/2, 50, 50);
}
