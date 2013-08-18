class Circle {
  PVector location = new PVector();
  float hue;
  float sat;
  float reach;
  
  Circle(float h, float r) {
    hue = h;
    sat = 0;
    reach = r;
    location.y = height/2;
  }
  
  void update() {
    location.x = (mouseX - halfWidth) * reach + halfWidth;
    sat = abs(mouseX - halfWidth) * (255 / (halfWidth));
  }
  
  void draw() {
    fill(hue, sat, 255, 127);
    ellipse(location.x, location.y, 300, 300);
  }
}
