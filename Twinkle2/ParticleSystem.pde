class ParticleSystem {
  ArrayList<Particle> squares;
  
  ParticleSystem () {
    squares = new ArrayList();
  }
  
  void add(PVector location, float pHue) {
    Particle p = new Particle(location, pHue);
    squares.add(p);
  }
  
  void update() {
    Iterator<Particle> particleIterator = squares.iterator();
    while (particleIterator.hasNext()) {
      Particle p = particleIterator.next();
      p.update();
    }
  } // update
}