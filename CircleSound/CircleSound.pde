import ddf.minim.*;
import ddf.minim.analysis.*;

/*
To get sound:
You need an aggragate audio device with devices in this order:
* Soundflower (2ch)
* Built-in Output

Select that as both your input and output
Then, open SoundflowerBed and choose built in output as your 2ch source
Master volume is controlled through Built-in output
*/

ArrayList<Circle> circles;
Minim minim;
AudioInput in;
FFT fft;
boolean DEBUG = false;

void setup() {
  size(700, 400);
  noStroke();
  rectMode(CORNERS);
  colorMode(HSB, 360, 100, 100, 255);

  circles = new ArrayList<Circle>();

  for (int i = 0; i < 100; i++) {
    circles.add(new Circle());
  }

  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
  fft = new FFT(in.bufferSize(), in.sampleRate());
  fft.logAverages(100, 1);
}

void draw() {
  background(34, 3, 95);
  changeSomething();
  doSomething();
}

void changeSomething() {
  fft.forward(in.mix);
  float amp = (fft.getAvg(0) + fft.getAvg(1)) / 2;

  for (int i = 0; i < circles.size(); i++) {
    Circle excited = circles.get(int(random(0, circles.size())));
    // Circle excited = circles.get(i);
    excited.excite(amp * 1.5);
  }
}

void doSomething() {
  pushMatrix();
    translate(width/2, height/2);

    for (int i = 0; i < circles.size(); i++) {
      Circle c = circles.get(i);

      c.update();
      c.display();
    }
  popMatrix();

  if (DEBUG == true) {
    int count = fft.avgSize();
    float barWidth = width / count;

    for (int i = 0; i < count; i++) {
      float amp = fft.getAvg(i);
      int barTop = height - int(amp * 10);
      fill(0, amp * 100);
      rect(barWidth * i, barTop, barWidth * (i + 1), height);
    }
  }
}

void stop() {
  in.close();
  minim.stop();
  super.stop();
}
