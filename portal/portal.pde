import java.util.Iterator;

ArrayList<Particle> particles;
float gravity = 0.01;
int maxCount = 50;
float[][] randoms = new float[maxCount][2];
int counter;
boolean recording = false;

void setup() {
  size(800, 600);
  rectMode(CENTER);
  strokeWeight(8);
  background(16);
  frameRate = 30;

  particles = new ArrayList();
  counter = 0;

  for(int i = 0; i < maxCount; i++) {
    float angle = random(0, 360);
    float radius = random(100, 200);
    randoms[i][0] = angle;
    randoms[i][1] = radius;
  }
}

void draw() {
  background(245, 242, 237);
  if (frameCount % 5 == 0) {
    particles.add(new Particle(counter % maxCount));
    counter++;
    println(counter);
  }

  translate(width/2, height/2);
  noFill();
  stroke(59, 62, 66);
  ellipse(0, 0, 200, 200);
  Iterator<Particle> pIter = particles.iterator();
  while(pIter.hasNext()) {
    Particle p = pIter.next();
    if (p.isAlive()) {
      p.update();
      p.display();
    } else {
      pIter.remove();
    }
  }
  if (recording) {
    saveFrame("gif/###.gif");
  }
}

void mousePressed() {
  recording = !recording;
}
