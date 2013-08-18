// Libraries
import oscP5.*;
import netP5.*;

OscP5 oscP5;

ArrayList rings;
final int RINGS = 5;

boolean shift = false;

/*int[] ringSizes new int[RINGS];*/
/*int[] ringStrokes = new int[RINGS];*/

void setup() {
  smooth();
  size(640, 400);
  stroke(255);
  strokeWeight(30);
  noFill();
  strokeCap(SQUARE);
  /*noLoop();*/

  rings = new ArrayList();

  float[] ringSizes = {50, 80, 125, 175, 210};
  float[] ringStrokes = {15, 20, 20, 30, 5};

  for (int i = 0; i < RINGS; i++) {
    rings.add(new ArcCircle(
                (int)random(2, 15), // segments
                0, // arcNeighborDistance
                1, // width
                random(-0.2, 0.2), // rotation Speed
                color(random(50, 255)), // color
                ringSizes[i], // radius
                ringStrokes[i]) // strokeWeight
              );
  }

  oscP5 = new OscP5(this, 8500);
}

void draw() {
  background(16);
  for (int i = 0; i < rings.size(); i++) {
    ArcCircle ring = (ArcCircle)rings.get(i);
    if (mousePressed && (mouseButton == LEFT)) {
      shift ^= true;
    } else {
      ring.arcWidth = (float)mouseX/width;
    }
    ring.arcNeighborDistance = (float)mouseY/height;
    ring.update();
    ring.draw();

    if (shift) {
      switch (i) {
        case 0:
          ring.radius += sin(frameCount/100f)*0.1*(i+1);
          break;
        case 1:
          ring.radius += sin(frameCount/150f)*0.1*(i+1);
          break;
        case 2:
          ring.radius += cos(frameCount/136f)*0.1*(i+1);
          break;
        case 3:
          ring.radius += cos(frameCount/182f)*0.1*(i+1);
          break;
        case 4:
          ring.radius += sin(frameCount/90f)*0.1*(i+1);
          break;
      }
    }
  }
}

class ArcCircle
{
  int segments;
  float arcNeighborDistance;
  float arcWidth;
  float rotVector;
  color arcColor;
  float radius;
  float strokeSize;

  float segWidth;
  float rotation;
  private float arcStart, arcEnd;

  ArcCircle(int _segments, float _arcNeighborDistance, float _arcWidth, float _rotVector, color _arcColor, float _radius, float _strokeSize) {
    segments = _segments;
    arcNeighborDistance = _arcNeighborDistance;
    arcWidth = _arcWidth;
    rotVector = _rotVector;
    arcColor = _arcColor;
    radius = _radius;
    strokeSize = _strokeSize;
    segWidth = 360f / segments;
    rotation = 0;
  }

  void update() {
    stroke(arcColor);
    rotation += rotVector;
    arcStart = segWidth * (1 - arcNeighborDistance);
    arcEnd = segWidth * arcWidth;
  }

  void draw() {
    for (int i = 0; i < segments; i++) {
      strokeWeight(strokeSize);
      stroke(arcColor);
      arc(width/2, height/2, radius, radius, radians(i*arcStart + rotation), radians(i*arcStart + arcEnd + rotation));
    }
  }

  void debug() {
    println("segments: " + segments);
    println("arcNeighborDistance: " + arcNeighborDistance);
    println("arcWidth: " + arcWidth);
    println("rotVector: " + rotVector);
    println("radius: " + radius);
    println("segWidth: " + segWidth);
    println("rotation: " + rotation);
    println("arcStart: " + arcStart);
    println("arcEnd: " + arcEnd);
  }
}

void oscEvent(OscMessage msg) {
  if (msg.checkAddrPattern("/ed/lock/width")) {
    for (int i = 0; i < rings.size(); i++) {
      ArcCircle ring = (ArcCircle)rings.get(i);
      ring.arcWidth = msg.get(0).floatValue();
      println(msg.get(0).floatValue());
    }
  } else if (msg.checkAddrPattern("/ed/lock/space")) {
    for (int i = 0; i < rings.size(); i++) {
      ArcCircle ring = (ArcCircle)rings.get(i);
      ring.arcNeighborDistance = 1 - msg.get(0).floatValue();
    }
  } else if (msg.checkAddrPattern("/ed/lock/shift")) {
    shift = msg.get(0).intValue() > 63 ? true : false;
  }
}
