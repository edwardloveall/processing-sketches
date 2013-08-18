import oscP5.*;
import netP5.*;

OscP5 oscSender;
NetAddress oscAddress;

void setup() {
  size(100, 100);
  background(0);
  noLoop();
  smooth();
  
  oscSender = new OscP5(this, 8888);
  oscAddress = new NetAddress("127.0.0.1", 8888);
}

void draw() { // jitter fill format: plane <plane>, <list of values>
  ellipse(50, 50, 50, 50);
  loadPixels();
  for (int j = 2; j>=0; j--) {
    OscMessage pixelMessage = new OscMessage("/plane");
    
    for (int i = 0; i<pixels.length; i++) {

      int collumn = i % width;
      int row = floor(i / width);

      pixelMessage.add("plane");
      pixelMessage.add(j + ","); // plane color
      pixelMessage.add(row); // y

      pixelMessage.add(pixels[i] >> 8 * j & 0xff); // red, green, blue
    }
    oscSender.send(pixelMessage, oscAddress);
  }
}

