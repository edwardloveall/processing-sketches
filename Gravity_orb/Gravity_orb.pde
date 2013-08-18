import traer.physics.*; //http://www.cs.princeton.edu/~traer/physics/

ParticleSystem physics;

Particle p1, mouse;
Attraction mousea;

void setup() {
  background(0);
  frameRate(30);
  size(400, 400);
  noStroke();
  smooth();
  fill(255);
  ellipseMode(CENTER);

  physics = new ParticleSystem(0.0, 0.1);

  p1 = physics.makeParticle(5.0, random(0, width-10), random(0, height-10), 0);
  mouse = physics.makeParticle(100.0, mouseX, mouseY, 0);
  mousea = physics.makeAttraction(mouse, p1, -10.0, 20.0);
}

void draw() {
  background(0, 30);
  float speed = (mouseX/width);
  handleBoundaryCollisions(p1);
  mouse.moveTo( mouseX, mouseY, 0 );
  ellipse(p1.position().x(), p1.position().y(), 20, 20);
  if (!mousePressed) {
    mousea.setStrength(-10);
  } else {
    mousea.setStrength(10);
  }
  physics.tick();
}

void handleBoundaryCollisions( Particle p1 )
{
  if ( p1.position().x() < 0 || p1.position().x() > width )
    p1.setVelocity( -0.9*p1.velocity().x(), p1.velocity().y(), 0 );
  if ( p1.position().y() < 0 || p1.position().y() > height )
    p1.setVelocity( p1.velocity().x(), -0.9*p1.velocity().y(), 0 );
  p1.moveTo( constrain( p1.position().x(), 0, width ), constrain( p1.position().y(), 0, height ), 0 );
}
