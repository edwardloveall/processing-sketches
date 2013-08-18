/*
* Click and drag to create fireflies
* */

/*ArrayList vectorArray;*/

void setup() {
  size(700, 400);
  smooth();
  noStroke();
  
  vectorArray = new ArrayList();
}

void draw() {
  background(16);
  
  for (int i = vectorArray.size() - 1; i >= 0; i--) {
    Firefly theVector = (Firefly)vectorArray.get(i);
    
    // remove the object if it has died;
    if (theVector.alive() && theVector.inBounds()) {
      theVector.update();
      theVector.draw();
    } else {
      vectorArray.remove(i);
      continue;
    }
  }
  
  print(vectorArray.size() + " :: ");
}

void addVector() {
  if (mousePressed) {
    float x = mouseX + random(-20, 20);
    float y = mouseY + random(-20, 20);
    vectorArray.add(new Firefly(x, y, 100));
  }
}

void mouseDragged() { addVector(); }
void mousePressed() { addVector(); }