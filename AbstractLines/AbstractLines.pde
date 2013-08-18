ArrayList lines;

void setup() {
  size(700, 400);
  lines = new ArrayList();

  for (int i = 0; i < 10; i++){
    float width = random(1, 5);
    color c = color(random(0, 255), random(0, 255), random(0, 255));
    lines.add(new AbstractLine(width, c));
  }
}

void draw() {
  background(16);
  float yOffset = 50;
  for (int i = lines.size()-1; i >= 0; i--){
    AbstractLine al = (AbstractLine)lines.get(i);
    al.draw(0, yOffset, width, yOffset);
    yOffset += random(8, 12);
  }
  noLoop();
}

class AbstractLine {
  float width;
  color c;

  AbstractLine(float _width, color _c) {
    width = _width;
    c = _c;
  }

  void draw(float x1, float y1, float x2, float y2) {
    strokeWeight(width);
    stroke(c);
    line(x1, y1, x2, y2);
  }
}
