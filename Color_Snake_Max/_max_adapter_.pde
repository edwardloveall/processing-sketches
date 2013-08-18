// Automatically added from <Sketchbook>/libraries/maxprocessing/library/_max_adapter_.pde
// This file helps keep everything running smoothly inside Max.
// Don't mess with this unless you really know what you are doing!

import com.cycling74.processing.*;

MaxProcessingObject __adapter_max_object__ = null;

private MaxProcessingObject __get_adapter_max_object__() {
  if(__adapter_max_object__ == null) {
     __adapter_max_object__ = MaxProcessingObject.get(this);
  }
  return __adapter_max_object__;
}

public InputStream createInput(String filename) {
  // make sure data files like fonts and images can be found:
  InputStream in = __get_adapter_max_object__().createInputForSketchResource(filename);
  return (in != null ? in : super.createInput(filename));
}

protected void handleKeyEvent(KeyEvent event) {
  MaxProcessingObject maxObj = __get_adapter_max_object__();
  if(!maxObj.isRunningInMax()) {
  	super.handleKeyEvent(event);
  	return;
  }
  // else alternate version of PApplet's handleKeyEvent()
  // handles exiting fullscreen mode with ESC, window close shortcut (ctrl/cmd+W),
  // and prevents ESC key from killing the sketch
  keyEvent = event;
  key = event.getKeyChar();
  keyCode = event.getKeyCode();

  if (event.getID() == KeyEvent.KEY_PRESSED) {
    if (key == KeyEvent.VK_ESCAPE) {
      maxObj.windowfullscreen(false);
    }
  }

  keyEventMethods.handle(new Object[] { event });

  switch (event.getID()) {
  case KeyEvent.KEY_PRESSED:
    keyPressed = true;
    keyPressed();
    break;
  case KeyEvent.KEY_RELEASED:
    keyPressed = false;
    keyReleased();
    break;
  case KeyEvent.KEY_TYPED:
    keyTyped();
    break;
  }

  if(event.getModifiers() == MENU_SHORTCUT && keyCode == 'W') {
   	maxObj.windowvisible(false);
  }
}


