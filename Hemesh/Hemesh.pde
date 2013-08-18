import processing.opengl.*;
import wblut.hemesh.*;
import wblut.geom.*;

HE_Mesh box;

void setup(){
  size(600,600,OPENGL);
  hint(ENABLE_OPENGL_4X_SMOOTH);
  HEC_Box boxCreator=new HEC_Box(this)
    .setWidth(400).setWidthSegments(10)
    .setHeight(200).setHeightSegments(4)
    .setDepth(200).setDepthSegments(4);
  boxCreator.setCenter(100,100,0).setAxis(1,1,1);
  box=new HE_Mesh(boxCreator);
  HEM_Lattice lattice=new HEM_Lattice().setDepth(10)
  .setWidth(10).setFuse(true).setThresholdAngle(HALF_PI);
  box.modify(lattice);
}

void draw(){
  background(120);
  lights();
  translate(300,300,0);
  rotateY(mouseX*1.0f/width*TWO_PI);
  rotateX(mouseY*1.0f/height*TWO_PI);
  noStroke();
  box.drawFaces();
  stroke(0);
  box.drawEdges();
}