PImage bg;
PShape el, heart;
PVector imagePos;
Orbiter orbiters[] = new Orbiter[20];
//HeartOrbiter orbiters[] = new HeartOrbiter[20];
boolean recording = false;

void setup() {
  size(800, 600, P3D);
  colorMode(HSB, 360, 100, 100);
  fill(2, 90, 100);
  frameRate(30);
  smooth(8);
  noStroke();
  ortho(0, width, 0, height);

//  int random = int(random(0, 1000));
//  println(random);
  randomSeed(607); // 62, 403, 417, 44, 607

  bg = loadImage("off_white_bg.png");
  el = loadShape("el.svg");
  heart = loadShape("heart.svg");
  imagePos = new PVector(width / 2 - el.width / 2,
                         height / 2 - el.height / 2);

  for (int i = 0; i < orbiters.length; i++) {
    orbiters[i] = new Orbiter(140);
  }
}

void draw() {
  background(37, 3, 96);
  pushMatrix();
    translate(0, 0, -140);
    image(bg, 0, 0);
  popMatrix();
  shape(el, imagePos.x, imagePos.y, 221, 128);

  translate(width * 0.5, height * 0.5);
  for(Orbiter o: orbiters) {
    o.update();
    o.display();
  }
  if (recording) {
    saveFrame("frames/f###.gif");
    if (frameCount == 126) {
      exit();
    }
  }
}

void mousePressed() {
  setup();
}
