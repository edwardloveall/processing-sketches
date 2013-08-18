class ParticleSystem {
  ArrayList<Particle> particles;
  
  ParticleSystem () {
    particles = new ArrayList();
  }
  
  void add(PVector location, PVector velocity, float life) {
//    println(location + ", " + velocity + ", " + life);
    particles.add(new Particle(location, velocity, life));
  }
  
  void update() {
    Iterator<Particle> particleIterator = particles.iterator();
    while (particleIterator.hasNext()) {
      Particle p = particleIterator.next();
      if (p.alive() && p.inBounds()) {
        p.update();
      } else {
        particleIterator.remove();
      }
    }
  }
  
  void applyForces() {
      Iterator<Particle> particleIterator = particles.iterator();
      while (particleIterator.hasNext()) {
        Particle p = particleIterator.next();
        
        Iterator<PVector> forceList = forces.iterator();
        while (forceList.hasNext()) {
          PVector f = forceList.next();
          p.applyForce(f);
        } // while (forceList.hasNext())
      } // while (particleIterator.hasNext())
    } // void applyForces(PVector force)
    
    void removeForces() {
      Iterator<Particle> particleIterator = particles.iterator();
      while (particleIterator.hasNext()) {
        Particle p = particleIterator.next();
        
        Iterator<PVector> forceList = forces.iterator();
        while (forceList.hasNext()) {
          PVector f = forceList.next();
          p.removeForce(f);
        } // while (forceList.hasNext())
      } // while (particleIterator.hasNext())
    } // void removeForces(PVector force)
  
  void draw() {
    Iterator<Particle> particleIterator = particles.iterator();
    while (particleIterator.hasNext()) {
      Particle p = particleIterator.next();
      p.draw();
    }
  }
  
  void run() {
    update();
    draw();
  }
  
  void explode(int strength) {
    for (int i = 0; i < strength; i++) {
      PVector location = new PVector((float)mouseX, (float)mouseY);
      PVector velocity = new PVector(random(-1, 1), random(-1, 1));
      float life = random(0, 0.7);
      
      add(location, velocity, life);
    }
  }
}
