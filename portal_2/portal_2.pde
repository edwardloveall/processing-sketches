import java.util.Iterator;

ArrayList<Ring> rings;
Ring outerRing;
boolean recording = false;

void setup() {
  size(800, 600);
  strokeWeight(8);
  noFill();
  frameRate = 30;

  rings = new ArrayList();
  outerRing = new Ring();
}

void draw() {
  background(245, 242, 237);

  if (frameCount % 60 == 0) {
    rings.add(new Ring());
  }

  translate(width/2, height/2);
  outerRing.display();
  Iterator<Ring> rIter = rings.iterator();
  while(rIter.hasNext()) {
    Ring r = rIter.next();
    if (r.isAlive()) {
      r.update();
      r.display();
    } else {
      rIter.remove();
    }
  }

  if (recording) {
    saveFrame("gif/###.gif");
  }
}

void mousePressed() {
  recording = !recording;
}
