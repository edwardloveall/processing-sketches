
void viewport() {
  if (translation) {
    if (mouseX > 2*width/3)  { translateXchange = changeSpeedX; } else if (mouseX < width/3)  { translateXchange = -changeSpeedX; } else { translateXchange = 0; }
    if (mouseY > 2*height/3) { translateYchange = changeSpeedY; } else if (mouseY < height/3) { translateYchange = -changeSpeedY; } else { translateYchange = 0; }
  } else {
    translateXchange = 0;
    translateYchange = 0;
  }

  if (rotation) {
    if (mouseX > 2*width/3)  { rotationYchange = changeSpeedY;  } else if (mouseX < width/3)  { rotationYchange = -changeSpeedY; } else { rotationYchange = 0; }
    if (mouseY > 2*height/3) { rotationXchange = -changeSpeedX; } else if (mouseY < height/3) { rotationXchange = changeSpeedX;  } else { rotationXchange = 0; }
  } else {
    rotationXchange = 0;
    rotationYchange = 0;
  }

  translateX += translateXchange;
  translateY += translateYchange;
  translate(translateX,translateY);

  if (autoRotate) {
    rotationX += changeSpeedX/2;
    rotationY -= changeSpeedY/2;
  } else {
    rotationX += rotationXchange;
    rotationY += rotationYchange;
  }
  rotateX(radians(rotationX));
  rotateY(radians(rotationY));

  if (abs(actualZoom - zoom) > 1)   { actualZoom = 0.99 * actualZoom + 0.01 * zoom; }
  scale(actualZoom);
}

