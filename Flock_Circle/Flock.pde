class Flock {
  ArrayList fishies;

  Flock(int count) {
    fishies = new ArrayList();

    for(int i = 0; i < count; i++) {
      float angle = random(0, 360);
      float radius = width/4;

      Fishy fish = new Fishy(angle, radius);

      fishies.add(fish);
    }
  }

  void update() {
    Iterator<Fishy> fishyIterator = fishies.iterator();

    while (fishyIterator.hasNext()) {
      Fishy f = fishyIterator.next();
      f.update();
      f.draw();
    }
  }
}
