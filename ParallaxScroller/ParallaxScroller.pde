Scroller front, middle, back;

void setup() {
  size(640, 480);
  smooth();
  frameRate(30);
  
  back = new Scroller("images/back.png", 1f, 1, 0f, 0f);
  middle = new Scroller("images/middle.png", 3f, 1, 0f, 0f);
  front = new Scroller("images/front.png", 10f, 1, 0f, 0f);
}

void draw() {
  background(255);
  back.draw();
  middle.draw();
  front.draw();
}

class Scroller {
  PImage image1, image2;
  float speed; // pixels per frame
  float xOffset, yOffset;
  int direction;
  
  Scroller (String imageURL, float _speed, int _direction, float _xOffset, float _yOffset) {
    image1 = loadImage(imageURL);
    image2 = loadImage(imageURL); // for overlapping
    
    speed = _speed; // 1 pixel per frame
    direction = _direction; // right to left
    xOffset = _xOffset;
    yOffset = _yOffset;
  }
  
  void draw() {
    xOffset += direction * speed; // update
    
    float imgWidth = image1.width;
    float x = xOffset % imgWidth;
    float y = yOffset;
    
    image(image1, x, yOffset);
    image(image2, x - direction*imgWidth, yOffset);
  }
}