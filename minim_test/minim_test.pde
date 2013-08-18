import ddf.minim.*;

Minim sounds;
AudioSnippet nn60;
AudioSnippet nn64;
AudioSnippet nn67;
AudioSnippet nn72;
AudioSnippet nn59;
AudioSnippet nn48;
AudioSnippet nn65;
AudioSnippet nn57;
AudioSnippet nn53;

int rand;

sounds = new Minim(this);

//nn60 = sounds.loadSnippet("60.mp3");
//nn64 = sounds.loadSnippet("64.mp3");
//nn67 = sounds.loadSnippet("67.mp3");
//nn72 = sounds.loadSnippet("72.mp3");
//nn59 = sounds.loadSnippet("59.mp3");
//nn48 = sounds.loadSnippet("48.mp3");
//nn65 = sounds.loadSnippet("65.mp3");
//nn57 = sounds.loadSnippet("57.mp3");
//nn53 = sounds.loadSnippet("53.mp3");

//int[] notelist0 = { 
//  nn60, nn64, nn67, nn72, nn59, nn48 };
//  
//int[] notelist1 = { 
//  nn60, nn65, nn67, nn72, nn57, nn53 };
  
void setup() {
  size(300, 300);
  background(0);
  noLoop();
}

void draw() {
  rand = int(random(9));
  background(rand*28);
}

void mousePressed() {
  redraw();
}

void stop() {
  nn60.close();
  nn64.close();
  nn67.close();
  nn72.close();
  nn59.close();
  nn48.close();
  nn65.close();
  nn57.close();
  nn53.close();
  
  sounds.stop();
  super.stop();
}
