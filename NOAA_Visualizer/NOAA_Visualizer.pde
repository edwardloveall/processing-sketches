XMLElement xml;

void setup() {
  xml = new XMLElement(this, "http://forecast.weather.gov/MapClick.php?lat=42.35830&lon=-71.06030&FcstType=digitalDWML");
  int level0Elements = xml.getChildCount();
  println(level0Elements);
  XMLElement level1Data = xml.getChild(1);
  
}
