/*
----------begin_max5_patcher----------
315.3ocuREsSCBCE84xWQSeFMzBDh9O3WfYwz0VY0.2RVKQzk42tPAbr4l1r
X7kB2SO8dOmSt6hPj0lNkkfuG+HFg1EgPdnA.zTMhTy6DUbqmFwYJKqTj3wq
Z3NwFMT9zVkvM1FVZwsIwX5czgOrj4S7po2.s0ZnR478iNApk9taV+xM4jCD
MstSYNB4dqQMNOhF5m7pgK2GEMbDGnU.0q8yadZNUm2ADtT7AlhY+jGKxV3w
7ohEd7YC3r528RrGOPmyNuyYWx4VcIvqHwe82QyG30dhjGL.WXH+cIjjOlP3
Tb1uuIvX9TpH+ZRorumRzymRIgYc+vIUZ3z0duAFvONOrl1sh4.eZ8DevBRk
0oAtSafEbnGwYiVJUvRMVqkMl981IIbgs2PUDKPEw9WUDM.EkdkJpuXezmPB
bXgG
-----------end_max5_patcher-----------

Set Out & In to SoundFlower (2ch)

*/


ParticleSystem ps;

import ddf.minim.analysis.*;
import ddf.minim.*;
Minim minim;
AudioInput in;
FFT fftLog;

int[] splitPoints = {50, 5000};

float maxAmp = 1;

void setup() {
  size(700, 400);
  smooth();
  background(16);
  
  noStroke();
  ps = new ParticleSystem();
  
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
  
  fftLog = new FFT(in.bufferSize(), in.sampleRate());
  fftLog.noAverages();
  
  frameRate = 30;
}

void draw() {
  background(15);
  fftLog.forward(in.mix);
  
  // for(int i = 0; i < splitPoints.length-1; i++) {
    int i = (int)random(0, splitPoints.length-1);
    
    float strength = fftLog.calcAvg(splitPoints[i], splitPoints[i+1]);
    // float strength = fftLog.getBand(i);
    
    float x = width * .8;
    float y = random(height * 1/6, height * 5/6);
    
    PVector location = new PVector(width/2, height/2);
    // PVector velocity = new PVector(-1, 0);
    PVector velocity = new PVector(random(-1, 1), random(-1, 1));
    float life = strength / maxAmp;
    if (frameCount != 0) {
      ps.add(location, velocity, life);
    }
    ps.run();
    
    /*
    The two calculations below are to determine what number to divide the overall strength by. it's meant to be a moveing average of the overall amplitude. It raises it self quickly in response to increased amplitude, and lowers it self more slowly for softer sections.
    */
    
    maxAmp = strength > maxAmp ? maxAmp + 1 : maxAmp - 0.01; // needs fixing
    maxAmp = maxAmp < 1 ? maxAmp + 1 : maxAmp;
    
  // }
}

void stop()
{
  in.close();
  minim.stop();
  /*mm.finish();*/
  super.stop();
}