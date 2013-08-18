class ParticleSystem {
  ArrayList particles;
  
  ParticleSystem () {
    particles = new ArrayList();
  }
  
  void add(Particle p) {
    /*particles.add(new Particle(location, size));*/
    particles.add(p);
  }
  
  void update() {
    Iterator<Particle> particlesIterator = particles.iterator();
    
    while (particlesIterator.hasNext()) {
      Particle p = particlesIterator.next();
      if (p.inBounds()) {
        p.update();
        p.draw();
      } else {
        particlesIterator.remove();
      }
    }
  }
}
