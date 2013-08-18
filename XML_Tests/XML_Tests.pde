//XML Tests

XMLElement xml;

void setup() {
  size(200, 200);
  // xml = new XMLElement(this, "test.xml");
  xml = new XMLElement(this, "yellow.xml");
  int numElements = xml.getChildCount();
  
  println(numElements);
  
  // for (int i = 0; i < numElements; i++) {
  //   XMLElement kid = xml.getChild(i);
  //   int id = kid.getIntAttribute("id");
  //   String cap = kid.getStringAttribute("caption");
  //   String content = kid.getContent();
  //   println(id + " : " + cap + " : " + content);
  // }
  
  for (int i = 0; i < numElements; i++) { // first layer
    XMLElement kid = xml.getChild(i);
    int numChildren = kid.getChildCount();
    for (int j = 0; j < numChildren; j++) { // second layer
      XMLElement kidKid = kid.getChild(j);
      String content = kidKid.getName();
      println(content);
    }
  }
  exit();
  
}
