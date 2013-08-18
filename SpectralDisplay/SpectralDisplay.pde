import ddf.minim.analysis.*;
import ddf.minim.*;
 
Minim minim;
AudioInput in;
FFT fftLog;
 
void setup()
{
  size(512, 300);
 
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
  // create an FFT object that has a time-domain buffer the same size as in's sample buffer
  // note that this needs to be a power of two 
  // and that it means the size of the spectrum will be 1024. 
  // see the online tutorial for more info.
  fftLog = new FFT(in.bufferSize(), in.sampleRate());
  // calculate the averages by grouping frequency bands linearly. use 30 averages.
  fftLog.logAverages(22, 3);
  // calculate averages based on a miminum octave width of 22 Hz
  // split each octave into three bands
  // this should result in 30 averages
  rectMode(CORNERS);
}
 
void draw()
{
  background(0);
  // perform a forward FFT on the samples in in's mix buffer
  fftLog.forward(in.mix);
  noStroke();
  fill(255);
  
  // draw the linear averages
  int w = int(width/fftLog.avgSize());
  for(int i = 0; i < fftLog.avgSize(); i++)
  {
    // draw a rectangle for each average, multiply the value by 5 so we can see it better
    rect(i*w, height, i*w + w-1, height - fftLog.getAvg(i)*5);
  }
}
 
void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  // always stop Minim before exiting
  minim.stop();
 
  super.stop();
}