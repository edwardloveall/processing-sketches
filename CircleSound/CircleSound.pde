import ddf.minim.*;
import ddf.minim.analysis.*;

ArrayList<Circle> circles;
Minim minim;
AudioPlayer player;
AudioInput in;
FFT fft;

void setup() {
  size(700, 400);
  noStroke();

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
  background(244.00, 241.00, 237.00);
  translate(width/2, height/2);

  // fft.forward(player.mix);
  fft.forward(in.mix);

  float low  = fft.getAvg(0);
  float mid  = fft.getAvg(int(fft.avgSize() * (1/3)));
  float high = fft.getAvg(int(fft.avgSize() * (2/3)));

  float amp = (low + mid + high) / 3;

  for (int i = 0; i < circles.size(); i++) {
    // Circle excited = circles.get(int(random(0, circles.size())));
    Circle excited = circles.get(i);
    excited.excite(amp);
  }

  for (int i = 0; i < circles.size(); i++) {
    Circle c = circles.get(i);

    c.update();
    c.display();
  }
}

void stop() {
  // player.close();
  in.close();
  minim.stop();
  super.stop();
}
