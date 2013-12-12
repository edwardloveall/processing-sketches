ArrayList<Ball> balls;

void setup() {
  size(700, 400);
  noStroke();
  fill(63);
  balls = new ArrayList<Ball>();
}

void draw() {
  background(255);
  for (int i = 0; i < balls.size(); i++) {
    Ball ball = balls.get(i);
    ball.update();
    ball.display();
  }
}

void mousePressed() {
  PVector mouse = new PVector(mouseX, mouseY);
  balls.add(new Ball(mouse));
}