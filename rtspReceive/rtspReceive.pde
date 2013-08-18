import codeanticode.gsvideo.*;
import processing.core.PApplet;

GSPipeline pipe;

public void setup() {
    size(640,480);
    pipe = new GSPipeline(this, "rtspsrc location=127.0.0.1");
    pipe.play();
}

public void draw() {
    if (pipe.available()) {
        pipe.read();
        image(pipe, 0, 0);
    }
}