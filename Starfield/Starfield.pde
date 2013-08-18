// Starfield Simulation
//
// A simple star field animation based on the information from 
// http://freespace.virgin.net/hugo.elias/graphics/x_stars.htm.
//
// Press mouse button to speed up!
//
// Created 2011 by Martin Höller
// http://www.openprocessing.org/sketch/26514

final int NumStars = 1500;

Star[] stars;

void setup()
{
  size(800, 600);
  background(0);
  noStroke();
  smooth();
  colorMode(HSB);
  textSize(32);
  frameRate(30);
  
  // create stars  
  stars = new Star[NumStars];
  
  for(int index = 0; index < NumStars; index++)
  {
    stars[index] = new Star();
  }
}


void draw()
{
  background(0);
  
  
  for(int index = 0; index < NumStars; index++)
  {
    stars[index].update();
    stars[index].display();
  }
}
