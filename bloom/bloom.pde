float noise_scale, noise_increment, noise_counter;
float size;


void setup() {
  size(800, 600);
  noise_scale = 0.01;
  noise_increment = 0.005;
  noise_counter = random(1000);
  size = 10;
  noiseDetail(8);
  noStroke();
}

void draw() {
  background(23);
  for (int i = 0; i < width; i += size) {
    for (int j = 0; j < height; j += size) {
      float noise_val = noise(i * noise_scale + noise_counter,
                              j * noise_scale + noise_counter);
      ellipse(i, j, noise_val * (size * 2), noise_val * (size * 2));
    }
  }

  noise_counter += noise_increment;
}
