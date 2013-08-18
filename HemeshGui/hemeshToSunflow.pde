
import java.awt.Color;

float [] verticesHemeshOneDim;
int [] facesHemeshOneDim;

// convert hemeshShape into sunflow-ready arrays
void hemeshToSunflow() {

  // for accurate rendering the rotatation is processed into the shape (temporarily)
  myShape.rotateAboutAxis(radians(rotationY), 0,0,0, 0,1,0); // Rotation around Y axis
  myShape.rotateAboutAxis(radians(rotationX), 0,0,0, 1,0,0); // Rotation around X axis

  myShape.validate(false,true);
  myShape.triangulateFaces();

  float [][] verticesHemesh = myShape.getVerticesAsFloat();
  verticesHemeshOneDim = new float[verticesHemesh.length * 3];

  int [][] facesHemesh = myShape.getFacesAsInt();
  facesHemeshOneDim = new int[facesHemesh.length * 3];

  int hemeshCounter = 0;

  for (int y=0; y<verticesHemesh.length; y++) {
    for (int x=0; x<3; x++) {
      // for accurate rendering of the x & y position the translate values are processed into the sunflow coordinates
      if      (x==0) { verticesHemeshOneDim[hemeshCounter] =  verticesHemesh[y][x] + (translateX-width/2) / actualZoom; }
      else if (x==1) { verticesHemeshOneDim[hemeshCounter] = -verticesHemesh[y][x] - (translateY-height/2) / actualZoom; }
      else           { verticesHemeshOneDim[hemeshCounter] =  verticesHemesh[y][x]; }
      hemeshCounter++;
    }
  }

  hemeshCounter = 0;

  for (int y=0; y<facesHemesh.length; y++) {
    for (int x=0; x<3; x++) {
      facesHemeshOneDim[hemeshCounter] = facesHemesh[y][x];
      hemeshCounter++;
    }
  }
}

// render shape in sunflow
void sunflow() {
  SunflowAPIAPI sunflow = new SunflowAPIAPI();
  sunflow.setWidth(int(sceneWidth*sunflowMultiply));
  sunflow.setHeight(int(sceneHeight*sunflowMultiply));
  int samples;

  if (preview) { sunflow.setAaMin(-2); sunflow.setAaMax(0); samples = 16; }
  else {
    if (saveContinuous) {
      sunflow.setAaMin(0); sunflow.setAaMax(2); samples = 16;
    } else {
      sunflow.setAaMin(1); sunflow.setAaMax(2); samples = 24;
    }
  }

  sunflow.setThinlensCamera("thinLensCamera", 50f, (float)sceneWidth/sceneHeight);
  sunflow.setCameraPosition(0, 0, 31.5);
  sunflow.setCameraTarget(0, 0, 0);

  sunflow.setShinyDiffuseShader("myShinyShader", new Color(shapecolor), .25f);
  sunflow.drawMesh("myHemesh", verticesHemeshOneDim, facesHemeshOneDim, actualZoom/20, 0,0,0);

  if (saveContinuous) {
    if (saveMask) {
      sunflow.render(sketchPath + "/output/mask/Mask_" + nf(frameCount,4) + ".png");
    }
    if (saveSunflow) {
      sunflow.setSunSkyLight("mySunSkyLight", new Vector3(0,1,0), new Vector3(1,0,0), new Vector3(-0.15, 0.2, -0.2), new Color(bgcolor), samples, 1.2, true);
      sunflow.setAmbientOcclusionEngine(new Color(255), new Color(0), samples, 7.5);
      sunflow.render(sketchPath + "/output/sunflow/Sunflow_" + nf(frameCount,4) + ".png");
    }
  } else {
    if (saveMask) {
      sunflow.render(sketchPath + "/output/screenshots/" + timestamp + " (sunMask).png");
    }
    if (saveSunflow) {
      sunflow.setSunSkyLight("mySunSkyLight", new Vector3(0,1,0), new Vector3(1,0,0), new Vector3(-0.15, 0.2, -0.2), new Color(bgcolor), samples, 1.2, true);
      sunflow.setAmbientOcclusionEngine(new Color(255), new Color(0), samples, 7.5);
      sunflow.render(sketchPath + "/output/screenshots/" + timestamp + " (sunflow).png");
    }
  }

  createHemesh(); // to reset the shape's rotation (which was internalised into the shape temporarily for sunflow rendering)
}

