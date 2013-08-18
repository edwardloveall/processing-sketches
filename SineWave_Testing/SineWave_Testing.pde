// Example by Krister Olsson

import krister.Ess.*;

AudioStream stream1;
SineWave space;

void setup() {
  size(256,200);

  // start up Ess
  Ess.start(this);

  // create a new AudioStream
  space=new AudioStream();

  // our wave
  space=new SineWave(960,.33);
  
  // start
  space.start();
}

void draw() {
}

void audioStreamWrite(AudioStream theStream) {
  // next wave
  myWave.generate(myStream);

  // adjust our phase
  myWave.phase+=myStream.size;
  myWave.phase%=myStream.sampleRate;
}

// we are done, clean up Ess

public void stop() {
  Ess.stop();
  super.stop();
}
