import prosvg.*;

float[] x;
float[] y;

float v1X, v1Y;
float v2X, v2Y;

//float pointX, pointY;
XMLElement xml;

void setup() {
  size(600, 400, "prosvg.SVGKdl");
  background(0);
  stroke(255);
  strokeWeight(2);
  smooth();
  noFill();
  frameRate(24);
  background(0);
  v1Y = height/2.0;
  
  xml = new XMLElement(this, "xml/Piano 1.xml");
  int numElements = xml.getChildCount();
  
  for (int i = 0; i < numElements; i++) { // first layer (All Data, Format, Track Count, Track, etc...)
    XMLElement kid = xml.getChild(i);
    int numChildren = kid.getChildCount();
    
    x = new float[numChildren];
    y = new float[numChildren];
    println(numChildren);
    
    for (int j = 0; j < numChildren; j++) { // second layer (All Events)
      XMLElement events = kid.getChild(j);
      int numEvents = events.getChildCount();
      for(int k = 0; k < numEvents; k++) { // third layer (Single Event)
        XMLElement eventsKid = events.getChild(k);
        if (eventsKid.getContent() != null) { // detect time
          try {
            x[j] = Integer.parseInt(eventsKid.getContent())*.024f; // .024f, the f casts to float
          }
          catch (NumberFormatException nfe) {}
        } else {
          y[j] = height-(eventsKid.getIntAttribute("Note")-50)*10;
        }
      }
    }
  }
  v1X = x[0];
  v1Y = y[0];
  
  noLoop();
}

void draw() {
  for (int frame = 0; frame < x.length-1; frame++) {
    v2X = x[frame+1]; // set end points to the next coordinate
    v2Y = y[frame+1];
    float distance = v2X-v1X; // find the horizontal distance between the two
    float twoThirds = distance*(2.0/3.0); // two thirds of that distance
    float c1X = v1X+twoThirds, c1Y = v1Y; // make control points go two thirds of the way to the next point
    float c2X = v2X-twoThirds, c2Y = v2Y;
    beginShape(); // start the line plotting
    vertex(v1X, v1Y);
    bezierVertex(c1X, c1Y, c2X, c2Y, v2X, v2Y);
    endShape(); // end the line plotting
    v1X = v2X; v1Y = v2Y; // set the old end points to the new start points
  }
  saveFrame("minimum.svg");
}
