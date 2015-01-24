import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;

boolean recording = false;

HE_Mesh mesh;
WB_Render3D render;
PImage igc;
PVector logoPos;

float rotation, rotVelocity;

void setup() {
  size(800, 600, OPENGL);
  HEC_Geodesic creator = new HEC_Geodesic();
  creator.setRadius(2000);
  creator.setB(10);
  creator.setC(0);
  creator.setType(HEC_Geodesic.ICOSAHEDRON);
  mesh=new HE_Mesh(creator);
  render=new WB_Render3D(this);

  rotation = 0f;
  rotVelocity = 0.0001;
  noStroke();
  sphereDetail(10);
  igc = loadImage("igc.png");
  logoPos = new PVector(width / 2 - igc.width / 2,
  height / 2 - igc.height / 2);
}

void draw() {
  background(255);
  pointLight(141, 93, 59, -1200, height * 0.5, 1000);
  lightFalloff(2.0, 0.001, 0.0);
  ambientLight(240, 0, 0);

  pushMatrix();
    translate(width * 0.5, height * 0.5, -2000);
    rotateY(rotation);
    render.drawFaces(mesh);
  popMatrix();
  rotation += rotVelocity;
  noLights();

  pushMatrix();
    image(igc, logoPos.x, logoPos.y);
  popMatrix();

  if (recording) {
    saveFrame("frames/f###.png");
    if (frameCount == 126) {
      exit();
    }
  }
}
