class ParticleSystem {
  ArrayList<Spark> sparks;
  
  ParticleSystem() {
    sparks = new ArrayList();
  }
  
  void add() {
    sparks.add(new Spark());
  }
  
  void draw() {
    Iterator<Spark> sparksIter = sparks.iterator();
    while (sparksIter.hasNext()) {
      Spark s = sparksIter.next();
      if(s.inBounds() && s.alive()) {
        s.update();
        s.draw();
      } else {
        sparksIter.remove();
      }
    }
  }
}
