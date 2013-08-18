import com.cycling74.max.*;
import com.cycling74.processing.*;

MaxProcessingObject maxObj;
float t = 0;
int thickness = 3;

void setup() {
  size(200,200);
  strokeWeight(thickness);
  
  // IMPORTANT!  Limit the framerate to prevent slowdown in Max.
  frameRate(10); 
  // You can probably go much higher than this, 
  // we're just being nice to old computers.
  
  maxObj = MaxProcessingObject.get(this);
  maxObj.declareIO(1,2);
  maxObj.createInfoOutlet(false);
}

void draw() {
  for(int x=0; x<width; x+=thickness) {
    float xn = x*0.0075;
    stroke(200*noise(t,xn,0),200*noise(xn,0,t),200*noise(xn,t,0));
    line(x,0,x,height);   
  }
  t += 0.02;
  
  // the jitter() method takes one argument: the outlet index
  maxObj.jitter(0);
  maxObj.outlet(1, 100+100*sin(t));
}
