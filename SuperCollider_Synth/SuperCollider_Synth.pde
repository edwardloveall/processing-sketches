import oscP5.*;
import netP5.*;


OscP5 oscP5;
int sendToPort;
int receiveAtPort;
String host;
String oscP5event;
int num_nodes = 20;
int start_node = 4000;
int current_node = start_node;

int r = 155;
int g = 100;
int b = 100;

float bx;
float by;
int bs = 10;
boolean bover = false;
boolean locked = false;
float bdifx = 0.0;  
float bdify = 0.0;  


void setup()  
{
  size(300, 300);
  bx = width/2.0;
  by = height/2.0;
  smooth();
  ellipseMode(CENTER_RADIUS);  
  frameRate(25);
  initOsc();
  Setup_Nodes(num_nodes, start_node);
}



void Setup_Nodes(int num, int startin) {
//should setup a number of nodes within Supercollider
  for(int i=start_node; i<startin + num; i++) {
    OscMessage oscMsg = oscP5.newMsg("/s_new");
    oscMsg.add("rand_osc4");
    oscMsg.add(i);
    oscMsg.add(0);
    oscMsg.add(1);
    oscMsg.add("pick");
    oscMsg.add(1);
    // send the osc message
    // via the oscP5 bundle
    oscP5.send(oscMsg);
  }
} 


void oscEvent(OscIn theOscIn) {
  println("recieved");
} 


// setup osc functioniality

void initOsc() {
  receiveAtPort = 12000;
  sendToPort = 57110; // supercollider  
  host = "127.0.0.1";  //change to whatever the IP want to recieve
  oscP5event = "oscEvent";  
  oscP5 = new OscP5(this, host, sendToPort, receiveAtPort, oscP5event);
}

void draw()  
{  
  background(0);

  // Test if the cursor is over the box  
  if (mouseX > bx-bs && mouseX < bx+bs &&  
    mouseY > by-bs && mouseY < by+bs) {
    bover = true;  
    if(!locked) {  
 stroke(255);  
 fill(153);
    }  
  } 
  else {
    stroke(153);
    fill(153);
    bover = false;
  }

  // Draw the box
  ellipse(bx, by, bs, bs);
}

void SoundOscMessage() {
//make sure the current node never exceeds nodes created during setup
if(current_node == (start_node + num_nodes - 1)) {
  current_node = start_node - 1;
  }
  current_node++;
  // Reset the Syth
  OscMessage oscReset = oscP5.newMsg("/n_set");
  oscReset.add(current_node);
  oscReset.add("trig");
  oscReset.add(0);
  // send the osc message
  // via the oscP5 bundle
  oscP5.send(oscReset);
  
  // Trigger a new sound Sound
  OscMessage oscTrig = oscP5.newMsg("/n_set");
  oscTrig.add(current_node);
  oscTrig.add("trig");
  oscTrig.add(1);
  // send the osc message
  // via the oscP5 bundle
  oscP5.send(oscTrig);
}


void mousePressed() {
  if(bover) {  
    locked = true;  
    fill(255, 255, 255);
  } 
  else {
    locked = false;
  }
  bdifx = mouseX-bx;  
  bdify = mouseY-by;  

}

void mouseDragged() {
  if(locked) {
    bx = mouseX-bdifx;  
    by = mouseY-bdify;  

    Object[] xyObj;
    xyObj = new Object[] { 
 new String("4001")    };

    //oscP5.sendMsg("/n_set", xyObj);
    SoundOscMessage();
    // println(bx);
    // println(by);
  }
}

void mouseReleased() {
  locked = false;
}
