size(298, 298);
background(0);
fill(255);
noStroke();

int sqsize = 10;

for (int x = 1; x < width; x += 11) {
  for (int y = 1; y < height; y += 11) {
    rect(x, y, sqsize, sqsize);
  }
}
