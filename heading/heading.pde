size(200, 200);
PVector a = new PVector(10, 0); // 0 degrees
float nintyDegrees = (PI/2); // 90 degrees

float start = a.heading();
float stop = a.heading() + nintyDegrees;

arc(width/2, height/2, 50, 50, start, stop);

println(degrees(start)); // 0.0
println(degrees(stop));  // 90.0 or PI/2
