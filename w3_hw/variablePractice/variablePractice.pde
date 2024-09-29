float x = random(width);
float y = random(height * 3/4);
float r = random(255);
float g = random(255);
float b = random(255);
float size = random(2, 15);

void setup() {
  size(1280, 720);
  background(0);
  frameRate(10);
  //colorMode(HSB); 
}

void draw() {
  x = random(width);
  y = random(height);
  r = random(40);
  g = random(180);
  b = random(255);
  size = random(2, 15);

  stroke(r, g, b);
  strokeWeight(size);
  line(x, y, x, y + random(2, 15));

  stroke(0);
  fill(255, 235, 85);
  circle(640, height * 3/4 + 20, 170);

  stroke(255, 235, 85);
  strokeWeight(80);
  line(640, height * 3/4, 640, 720);
  line(660, height * 3/4, 660, 720);
  line(620, height * 3/4, 620, 720);
  strokeWeight(30);
  line(680, 660, 760, height * 3/4 - 60);
  line(width - 760, height * 3/4 - 60, width - 680, 660);
}
