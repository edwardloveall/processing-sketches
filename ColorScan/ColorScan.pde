color shade;
float red;
float green;
float blue;
float i = 0;

void setup() {
  size(400, 400);
  background(0);
  smooth();
  ellipseMode(CENTER);
  stroke(255);
}

void draw() {
  background(0);
  strokeWeight(0);
  float slope = sin(i);
  i += (TWO_PI)/600;
  red = sin(i)*765;
  green = sin(i+90)*765;
  blue = sin(i+180)*765;
  fill(red, green, blue);
  ellipse(width/2, width/2, 200, 200);

  strokeWeight(2);
  line(10, height/2, 10, height/2-(red/6));
  println(red/255);
  line(20, height/2, 20, height/2-(green/6));
  line(30, height/2, 30, height/2-(blue/6));
}
