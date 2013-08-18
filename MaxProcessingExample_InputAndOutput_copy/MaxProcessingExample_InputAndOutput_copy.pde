
import com.cycling74.processing.MaxProcessingObject;
import com.cycling74.max.Atom;
import java.util.Arrays;

MaxProcessingObject maxObj;
PFont font;
String message;

void setup() {
  size(600,300);
  
  font = loadFont("Courier-16.vlw");
  textFont(font, 16);

  maxObj = MaxProcessingObject.get(this);
  maxObj.declareIO(3,3);
  maxObj.createInfoOutlet(false);
  
  message = "object arguments: " + Arrays.toString(maxObj.getArgs());
}

void draw() {
  background(0);
  fill(255);
  text(message, 20, height/2-20);
}


//------------------------------
// Send data to Max
void mousePressed() {
 maxObj.outlet(0, "mousePress", new int[]{mouseX,mouseY});
}
void mouseDragged() {
 maxObj.outlet(0, "mouseDrag", new int[]{mouseX,mouseY});
}
void mouseReleased() {
 maxObj.outlet(0, "mouseRelease", new int[]{mouseX,mouseY});
}  


//------------------------------
// Receive data from Max

void bang() {
  message = "inlet: " + maxObj.getInlet();
  message += "\nmethod: bang()";  
}
void inlet(int value) {
  message = "inlet: " + maxObj.getInlet();
  message += "\nmethod: inlet(int)";
  message += "\nparameter: " + value;  
}
void inlet(float value) {
  message = "inlet: " + maxObj.getInlet();
  message += "\nmethod: inlet(float)";
  message += "\nparameter: " + value;  
}
void inlet(int[] values) {
  message = "inlet: " + maxObj.getInlet();
  message += "\nmethod: inlet(int[])";
  message += "\nparameters: " + Arrays.toString(values);
}
void inlet(float[] values) {
  message = "inlet: " + maxObj.getInlet();
  message += "\nmethod: inlet(float[])";
  message += "\nparameters: " + Arrays.toString(values);
}
void message(String[] values) {
  message = "inlet: " + maxObj.getInlet();
  message += "\nmethod: message(String[])";
  message += "\nparameters: " + Arrays.toString(values);
}

//Other methods you can define:
//
//void loadbang() {
//  maxObj.post("Sketch received loadbang()");
//}
//void save() {
//  maxObj.post("Sketch received save()");
//}
//void notifyDeleted() {
//  maxObj.post("Sketch received notifyDeleted()");
//}
