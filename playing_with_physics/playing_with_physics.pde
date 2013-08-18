import traer.physics.*; // http://www.cs.princeton.edu/~traer/physics/

ParticleSystem physics;

Particle p1, p2, p3, mouse;
Attraction a1, a2, a3, mousea;

void setup() {
  frameRate(30);
  size(400, 400);
  noStroke();
  smooth();
  fill(255);
  ellipseMode(CENTER);
  
  physics = new ParticleSystem(0.0, 0.1);
  
  p1 = physics.makeParticle(5.0, random(0, width-10), random(0, height-10), 0);
  p2 = physics.makeParticle(5.0, random(0, width-10), random(0, height-10), 0);
  p3 = physics.makeParticle(5.0, random(0, width-10), random(0, height-10), 0);
  mouse = physics.makeParticle(5.0, mouseX, mouseY, 0);
  a1 = physics.makeAttraction(p1, p2, 100.0, 20.0);
  a2 = physics.makeAttraction(p2, p3, 100.0, 20.0);
  a3 = physics.makeAttraction(p3, p1, 100.0, 20.0);
  mousea = physics.makeAttraction(mouse, p1, -200.0, 20.0);
}

void draw() {
  float speed = (mouseX/width);
  background(0);
  handleBoundaryCollisions( p1 );
  mouse.moveTo( mouseX, mouseY, 0 );
  ellipse(p1.position().x(), p1.position().y(), 20, 20);
  ellipse(p2.position().x(), p2.position().y(), 20, 20);
  ellipse(p3.position().x(), p3.position().y(), 20, 20);
  
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
