import traer.physics.*; // http://www.cs.princeton.edu/~traer/physics/

ParticleSystem physics;

Particle p1, p2, mouse;
Attraction mousea, mouseb;

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
  p2 = physics.makeParticle(5.0, random(0, width-10), random(0, height-10), 0);
  mouse = physics.makeParticle(100.0, mouseX, mouseY, 0);
  mousea = physics.makeAttraction(mouse, p1, -10.0, 20.0);
  mouseb = physics.makeAttraction(mouse, p2, 15.0, 20.0);
}

//---------------

void draw() {
  float speed = (mouseX/width);
  handleBoundaryCollisions(p1);
  handleBoundaryCollisions(p2);
  mouse.moveTo( mouseX, mouseY, 0 );

  background(0);
  fill(#80ff00);
  ellipse(p1.position().x(), p1.position().y(), 20, 20);
  fill(#0080ff);
  ellipse(p2.position().x(), p2.position().y(), 20, 20);

  if (!mousePressed) {
    mousea.setStrength(-10);
    mouseb.setStrength(15);
  } else {
    mousea.setStrength(15);
    mouseb.setStrength(-10);
  }
  physics.tick();
}

//--------------

void handleBoundaryCollisions( Particle p )
{
  if ( p.position().x() < 0 || p.position().x() > width )
    p.setVelocity( -0.9*p.velocity().x(), p.velocity().y(), 0 );
  if ( p.position().y() < 0 || p.position().y() > height )
    p.setVelocity( p.velocity().x(), -0.9*p.velocity().y(), 0 );
  p.moveTo( constrain( p.position().x(), 0, width ), constrain( p.position().y(), 0, height ), 0 );
}
