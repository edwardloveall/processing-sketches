XMLElement xml;

void setup() {
  xml = new XMLElement(this, "data.xml");
  background(0);
  smooth();
  size(700, 400);
  noStroke();
  
  float total = 0;
  float start = 0;
  float end;
  
  int numGraphs = xml.getChildCount();
  
  for(int i = 0; i < numGraphs; i++) {
    XMLElement graph = xml.getChild(i);
    int numData = graph.getChildCount();
    for(int j = 0; j < numData; j++) {
      XMLElement data = graph.getChild(j);
      end = TWO_PI*(data.getIntAttribute("value")*.01);
      total += data.getIntAttribute("value")*.01;
      println(start + " : " + end);
      fill((int)random(50, 255));
      arc(width/2, height/2, 300, 300, start, end+start);
      start += end;
    }
    println(total);
  }
}