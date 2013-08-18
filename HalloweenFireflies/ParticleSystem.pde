class ParticleSystem {
  ArrayList particles;

  ParticleSystem () {
    particles = new ArrayList();
  }

  void add(Firefly f) {
    particles.add(f);
  }

  void update() {
    Iterator<Firefly> particlesIterator = particles.iterator();

    while (particlesIterator.hasNext()) {
      Firefly f = particlesIterator.next();
      if (f.inBounds() && f.alive()) {
        f.update();
        f.draw();
      } else {
        particlesIterator.remove();
      }
    }
  } // update

  void debug() {
    println("Total Particles: " + particles.size());
  } // debug
}
