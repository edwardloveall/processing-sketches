class DashCircle {
  float thickness, direction, rotation, raidius;
  int sections;
  color coloration;

  DashCircle(float _thickness, int _sections, color _coloration, float _radius) {
    thickness = _thickness;
    sections = _sections;
    color = _coloration;
    rotation = 0;
  }

  void update() {
    rotation += direction;
  }

  void display() {
    strokeWeight(thickness);
    stroke(coloration);
    arc();
  }
}
