
import controlP5.*;
ControlP5 controlP5;
DropdownList shapeList;
DropdownList modifyList;

void gui() {
  controlP5 = new ControlP5(this);
  controlP5.setAutoDraw(false);

  // gui colors
  controlP5.setColorBackground(color(162,153,125));
  controlP5.setColorForeground(color(204,204,0));
  controlP5.setColorLabel(color(0,0,0));
  controlP5.setColorValue(color(0,0,0));
  controlP5.setColorActive(color(224,224,0));

  // view
  controlP5.addSlider("zoom",0,300,20,20,200,15).setDecimalPrecision(0);
  controlP5.addSlider("changeSpeedX",-5,5,20,40,200,15).setLabel("Change X");
  controlP5.addSlider("changeSpeedY",-5,5,20,60,200,15).setLabel("Change Y");
  controlP5.addToggle("autoRotate",20,80,63,15).setLabel("autoRotate (r)");
  controlP5.addToggle("translation",88,80,64,15).setLabel("translation (t)");
  controlP5.addToggle("rotation",157,80,63,15).setLabel("rotation (y)");

  // presentation
  controlP5.addSlider("shapeHue",0,360,20,130,200,15).setLabel("Hue");                      controlP5.controller("shapeHue").setDecimalPrecision(0);
  controlP5.addSlider("shapeSaturation",0,100,20,150,200,15).setLabel("Saturation");        controlP5.controller("shapeSaturation").setDecimalPrecision(0);
  controlP5.addSlider("shapeBrightness",0,100,20,170,200,15).setLabel("Brightness");        controlP5.controller("shapeBrightness").setDecimalPrecision(0);
  controlP5.addSlider("shapeTransparency",0,100,20,190,200,15).setLabel("Transparency");    controlP5.controller("shapeTransparency").setDecimalPrecision(0);
  controlP5.addToggle("facesOn",20,210,63,15).setLabel("Toggle Faces");
  controlP5.addToggle("edgesOn",88,210,64,15).setLabel("Toggle Edges");
  controlP5.addButton("resetView",0,157,210,63,26).setLabel("Reset View");

  // basic shape variables
  controlP5.addSlider("create0",0,50,width-250,20,200,15).setDecimalPrecision(0);
  controlP5.addSlider("create1",0,50,width-250,40,200,15).setDecimalPrecision(0);
  controlP5.addSlider("create2",0,50,width-250,60,200,15).setDecimalPrecision(0);
  controlP5.addSlider("create3",0,50,width-250,80,200,15).setDecimalPrecision(0);

  // ShapeList
  shapeList = controlP5.addDropdownList("myShapeList",width-250,125,96,400);
  shapeList.setBarHeight(20);
  shapeList.setItemHeight(15);
  shapeList.captionLabel().set("Select Shape");
  shapeList.captionLabel().style().marginTop = 6;
  shapeList.captionLabel().style().marginLeft = 3;
  for(int i=0; i<numForLoop; i++) {
    if (numToName(i) != "None") { shapeList.addItem(numToName(i),i); }
  }

  // ModifyList
  modifyList = controlP5.addDropdownList("myModifyList",width-146,125,96,400);
  modifyList.setBarHeight(20);
  modifyList.setItemHeight(15);
  modifyList.captionLabel().set("Select Modifier");
  modifyList.captionLabel().style().marginTop = 6;
  modifyList.captionLabel().style().marginLeft = 3;

  // modifiers
  for(int i=101; i<101 + numForLoop; i++) {
    if (numToName(i) != "None") { modifyList.addItem(numToName(i),i); }
  }

  // ===
  modifyList.addItem(numToName(-1),-1);

  // subdividors
  for(int i=201; i<201 + numForLoop; i++) {
    if (numToName(i) != "None") { modifyList.addItem(numToName(i),i); }
  }

  // saving variables
  controlP5.addToggle("saveNormal",20,height-100,60,15).setLabel("Normal");
  controlP5.addToggle("saveGui",90,height-100,60,15).setLabel("Gui");
  controlP5.addToggle("saveSunflow",160,height-100,60,15).setLabel("Sunflow");
  controlP5.addToggle("saveMask",20,height-70,60,15).setLabel("Mask");
  controlP5.addToggle("preview",90,height-70,60,15);
  controlP5.addToggle("saveContinuous",160,height-70,60,15).setLabel("Continuous");
  controlP5.addButton("save",0,20,height-40,200,20).setLabel("Toggle Saving (after 6 variables are set)");

  // reset button
  controlP5.addButton("reset",0,width-146,height-40,96,20).setLabel("Reset EVERYTHING");

  // ===========================================>
  // some non-gui stuff that needs to run @ setup

  // hemesh Renderer
  render = new WB_Render(this);

  // move origin to center of the screen
  translateX = width/2;
  translateY = height/2;

  // listen to mouseWheel (used for zooming)
  addMouseWheelListener(new java.awt.event.MouseWheelListener() {
    public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) {
      mouseWheel(evt.getWheelRotation());
  }});
}

// zooming with the mouseWheel
void mouseWheel(int delta) {
  if      (delta > 0) { if (zoom > 20) { controlP5.controller("zoom").setValue(zoom - 10); } else { controlP5.controller("zoom").setValue(zoom - 1); } }
  else if (delta < 0) { if (zoom >= 20) { controlP5.controller("zoom").setValue(zoom + 10); } else { controlP5.controller("zoom").setValue(zoom + 1); } }
}

void reset() {

  // view
  controlP5.controller("zoom").setValue(20);
  controlP5.controller("changeSpeedX").setValue(1.5);
  controlP5.controller("changeSpeedY").setValue(1.5);
  controlP5.controller("autoRotate").setValue(1);
  controlP5.controller("translation").setValue(0);
  controlP5.controller("rotation").setValue(0);
  translateX = width/2;
  translateY = height/2;
  rotationX = 0;
  rotationY = 0;
  actualZoom = 20;

  // presentation
  controlP5.controller("shapeHue").setValue(57);
  controlP5.controller("shapeSaturation").setValue(100);
  controlP5.controller("shapeBrightness").setValue(96);
  controlP5.controller("shapeTransparency").setValue(100);
  controlP5.controller("facesOn").setValue(1);
  controlP5.controller("edgesOn").setValue(1);

  // basic shape variables
  creator = 2;
  controlP5.controller("create0").setValue(4);
  controlP5.controller("create1").setValue(4);
  controlP5.controller("create2").setValue(4);
  controlP5.controller("create3").setValue(4);

  // saving variables
  controlP5.controller("saveNormal").setValue(0);
  controlP5.controller("saveGui").setValue(0);
  controlP5.controller("saveSunflow").setValue(0);
  controlP5.controller("saveMask").setValue(0);
  controlP5.controller("preview").setValue(1);
  controlP5.controller("saveContinuous").setValue(0);

  // ShapeList + ModifyList
  shapeList.captionLabel().set("Select Shape");
  modifyList.captionLabel().set("Select Modifier");

  // remove the gui elements for all modifiers
  for (int i=0; i<modifiers.size(); i++) {
    controlP5.remove("remove" + i);
    for (int j=0; j<5; j++) {
      controlP5.remove(i+"v"+j);
    }
  }

  // remove all modifiers
  modifiers.clear();

  // start up again
  createHemesh();
}

// reset the view & color, but leave shape & modifiers intact
void resetView() {

  // view
  controlP5.controller("zoom").setValue(20);
  controlP5.controller("changeSpeedX").setValue(1.5);
  controlP5.controller("changeSpeedY").setValue(1.5);
  controlP5.controller("autoRotate").setValue(1);
  controlP5.controller("translation").setValue(0);
  controlP5.controller("rotation").setValue(0);
  translateX = width/2;
  translateY = height/2;
  rotationX = 0;
  rotationY = 0;
  actualZoom = 20;

  // presentation
  controlP5.controller("shapeHue").setValue(57);
  controlP5.controller("shapeSaturation").setValue(100);
  controlP5.controller("shapeBrightness").setValue(96);
  controlP5.controller("shapeTransparency").setValue(100);
  controlP5.controller("facesOn").setValue(1);
  controlP5.controller("edgesOn").setValue(1);
}

// toggle saving function (with console feedback)
void save() {
  if (saveOn) {
    saveOn = false;
    println("Saving stopped");
  } else {
    drawControlP5 = true;
    timestamp = year() + nf(month(),2) + nf(day(),2) + "-"  + nf(hour(),2) + nf(minute(),2) + nf(second(),2);
    saveOn = true;
    print("\nSaving started (" + timestamp +")");
    if (saveNormal) { print(" | Normal"); }
    if (saveGui) { print(" | Gui"); }
    if (saveSunflow) { print(" | Sunflow"); }
    if (saveMask) { print(" | Mask"); }
    print("\n");
  }
}

// command & control center ;-)
void controlEvent(ControlEvent theEvent) {
  if (theEvent.isGroup()) {

    // when a shape is selected
    if (theEvent.group().name() == "myShapeList") {
      creator = int(theEvent.group().value());
      createHemesh();

    // when a modifier is selected
    } else if (theEvent.group().name() == "myModifyList" && int(theEvent.group().value()) > 0) {
      int selected = int(theEvent.group().value());
      modifiers.add( new Modifier(modifiers.size(),selected,numToFloats(selected)) );
      createHemesh();
    }

  } else if (theEvent.isController()) {

    // when a remove button is pressed
    if (theEvent.controller().name().startsWith("remove")) {
      modifiers.remove(theEvent.controller().id());
      controlP5.remove("remove" + theEvent.controller().id());
      for (int i=0; i<5; i++) {
        controlP5.remove(theEvent.controller().id()+"v"+i);
      }
      createHemesh();
    }

    for (int i=0; i<5; i++) {

      // forward modify values from controlP5 into seperate classes
      if (theEvent.controller().name().endsWith("v" + i)) {
        Modifier m = (Modifier) modifiers.get(theEvent.controller().id());
        for (int j=0; j<5; j++) {
          if (i==j) { m.values[j] = theEvent.value(); }
        }
        createHemesh();
      }

      // force createHemesh after changes in create variables
      if (theEvent.name().matches("create" + i)) {
        createHemesh();
      }
    }
  }
}

// some useful keyboard actions
void keyPressed() {

  // toggle autoRotate, translation & rotation
  if (key == 'r') { if (autoRotate == false)  { controlP5.controller("autoRotate").setValue(1);  } else { controlP5.controller("autoRotate").setValue(0);  } }
  if (key == 't') { if (translation == false) { controlP5.controller("translation").setValue(1); } else { controlP5.controller("translation").setValue(0); } }
  if (key == 'y') { if (rotation == false)    { controlP5.controller("rotation").setValue(1);    } else { controlP5.controller("rotation").setValue(0);    } }

  // toggle the controlP5 gui
  if (key == '5') { drawControlP5 = !drawControlP5; }

  // set X & Y speed of translation & rotation to zero
  if (key == '0') { controlP5.controller("changeSpeedX").setValue(0); controlP5.controller("changeSpeedY").setValue(0); }

  // toggle saving manually
  if (key == 'a') { save(); }

  // toggle sunflow manually
  if (key == 's') { if (saveSunflow) { controlP5.controller("saveSunflow").setValue(0); } else { controlP5.controller("saveSunflow").setValue(1); } }

  // save a single screenshot
  if (key == 'z') {
    timestamp = year() + nf(month(),2) + nf(day(),2) + "-"  + nf(hour(),2) + nf(minute(),2) + nf(second(),2);
    save("output/screenshots/" + timestamp + ".png");
  }

  // preview quality sunflow render (+ gui screenshot)
  if (key == 'x') {
    controlP5.controller("autoRotate").setValue(0);
    controlP5.controller("saveContinuous").setValue(0);
    controlP5.controller("saveGui").setValue(1);
    controlP5.controller("preview").setValue(1);
    controlP5.controller("saveSunflow").setValue(1);
    save();
  }

  // high quality sunflow render (+ gui screenshot)
  if (key == 'c') {
    controlP5.controller("autoRotate").setValue(0);
    controlP5.controller("saveContinuous").setValue(0);
    controlP5.controller("saveGui").setValue(1);
    controlP5.controller("preview").setValue(0);
    controlP5.controller("saveSunflow").setValue(1);
    save();
  }

  // export shape to a STL file
  if (key == 'l') {
    timestamp = year() + nf(month(),2) + nf(day(),2) + "-"  + nf(hour(),2) + nf(minute(),2) + nf(second(),2);
    String path = sketchPath + "/output/stl/" + timestamp + ".stl";
    HET_Export exporter = new HET_Export();
    exporter.saveToSTL(myShape, path, 1);
    println("STL exported");
  }

  // decrease sunflow multiplication factor by 0.5 (key: <)
  if (key == ',') {
    if(sunflowMultiply >= 1) { sunflowMultiply -= 0.5; }
    println("Sunflow render output: " + int(sceneWidth*sunflowMultiply) + " x " + int(sceneHeight*sunflowMultiply));
  }

  // increase sunflow multiplication factor by 0.5 (key: >)
  if (key == '.') {
    sunflowMultiply += 0.5; println("Sunflow render output: " + int(sceneWidth*sunflowMultiply) + " x " + int(sceneHeight*sunflowMultiply));
  }
}

