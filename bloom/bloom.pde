float noise_scale, noise_increment, noise_size_counter, noise_color_counter;
float size;

void setup() {
  size(800, 600);
  noise_scale = 0.01;
  noise_increment = 0.005;
  noise_size_counter = random(1000);
  noise_color_counter = random(-1000);
  size = 15;
  noiseDetail(8);
  strokeWeight(2);
  noStroke();
  colorMode(HSB, 360, 100, 100, 1);
  frameRate(30);
}

void draw() {
  background(16, 0, 10);
  for (int i = 0; i < width; i += size) {
    for (int j = 0; j < height; j += size) {
      float noise_color_value = noise(i * noise_scale + noise_color_counter,
                              j * noise_scale + noise_color_counter);
      float noise_pos_value = noise(i * noise_scale + noise_size_counter,
                              j * noise_scale + noise_size_counter);

      fill(map(noise_color_value, 0.2, 0.8, 0, 30), 80, 80);
      ellipse(i + size / 2, j + size / 2,
              noise_pos_value * (size * 1.5),
              noise_pos_value * (size * 1.5));
    }
  }

  noise_size_counter += noise_increment;
  noise_color_counter -= noise_increment;
  // saveFrame("/Users/edwardloveall/Desktop/gif/frame-######.png");
}