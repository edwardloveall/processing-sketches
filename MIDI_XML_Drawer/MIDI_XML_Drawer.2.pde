//XML Tests

ArrayList x, y;
int frame = 0;
float pointX, pointY;
XMLElement xml;

void setup() {
  size(600, 400);
  background(0);
  stroke(255);
  strokeWeight(2);
  xml = new XMLElement(this, "yellow.xml");
  int numElements = xml.getChildCount();
  
  x = new ArrayList();
  y = new ArrayList();
  
  for (int i = 0; i < numElements; i++) { // first layer (All Data, Format, Track Count, Track, etc...)
    XMLElement kid = xml.getChild(i);
    int numChildren = kid.getChildCount();
    for (int j = 0; j < numChildren; j++) { // second layer (All Events)
      XMLElement events = kid.getChild(j);
      int numEvents = events.getChildCount();
      for(int k = 0; k < numEvents; k++) { // third layer (Single Event)
        XMLElement eventsKid = events.getChild(k);
        if (eventsKid.getContent() != null) { // detect time
          x.add(Integer.parseInt(eventsKid.getContent())*.024f);
        } else {
          y.add(eventsKid.getIntAttribute("Note"));
        }
      }
    }
  }
}

void draw() {
  if (frame < x.size()-1) {
//    point(frame, frame);
    pointX = (Integer) x.get(frame);
    pointY = (Integer) y.get(frame);
    point(pointX, pointY);
  }
  frame++;
}
