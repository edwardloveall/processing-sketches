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

import ddf.minim.analysis.*;
import ddf.minim.*;
import fullscreen.*;
import processing.video.*;

Minim minim;
AudioInput in;
FFT fftLog;

SoftFullScreen fs;

MovieMaker mm;

int circleSize = 50;

int[] splitPoints = {0, 80, 1000, 5000};

void setup()
{
  size(700, 400);

  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);

  fftLog = new FFT(in.bufferSize(), in.sampleRate());
  fftLog.noAverages();

  fs = new SoftFullScreen(this);

  /*mm = new MovieMaker(this, width, height, "brazil.mov", 30, MovieMaker.JPEG, MovieMaker.LOSSLESS);*/

  smooth();
}

void draw()
{
  background(16);
  fftLog.forward(in.mix);

  for(int i = 0; i < splitPoints.length-1; i++)
  {
    float saturation = fftLog.calcAvg(splitPoints[i], splitPoints[i+1]);

    float bandWidth = width / (splitPoints.length-1);
    float x = (bandWidth * i) + (bandWidth / 2);
    float y = height / 2;
    noStroke();
    fill(255, (float)Math.min(saturation*Math.pow(i+1, 2), 255));
    ellipse(x, y, circleSize, circleSize);

    noFill();
    stroke(255, Math.min(saturation*64, 255));
    arc(x, y, circleSize*1.2, circleSize*1.2, radians((float)Math.min(-saturation*(i+1), 360))-PI/2, radians((float)Math.min(saturation*(i+1), 360))-PI/2);

    if (frameCount % 60 == 0) {
    }
  }
  if (frameCount % 60 == 0) {
  }
  /*mm.addFrame();*/
}

void stop()
{
  in.close();
  minim.stop();
  /*mm.finish();*/
  super.stop();
}
