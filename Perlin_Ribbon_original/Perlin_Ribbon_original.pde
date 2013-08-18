float noiseScale = 0.02f;

void setup(){
 size(600,200);
}

float n = 0.00f;
float d = 0.4f;

void draw() {
  n = n + d;
  background(230,230,210); 
  for (int y = 0; y<40; y++ ) {
   for(int x = 0; x<300; x++ ) { 
    float noiseVal = noise((n + x)*noiseScale, (-n + y)*noiseScale, y*noiseScale); 
    stroke(250 - (noiseVal*150),180,150 - (noiseVal*150)); 
    point(x*2,50 + noiseVal*100);
    } 
  }
} 
