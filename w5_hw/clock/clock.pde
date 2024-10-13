void setup() {
  size(800, 800);
}

void draw() {
  background(0);
  stroke(143);
  strokeWeight(10);
  fill(9, 16, 87);
  circle(width / 2, height / 2, 700);
  noStroke();
  fill(2, 76, 170);
  circle(width / 2, height / 2, 550);
  fill(2, 50, 180);
  circle(width * 0.35, height * 0.65, 150);
  circle(width * 0.65, height * 0.65, 150);
  circle(width / 2, height * 0.35, 200);

  for (int x = 0; x <60; x+=5) {
    stroke(255);
    strokeWeight(4);
    pushMatrix();
    translate(width / 2, height / 2);
    rotate(radians(6 * x));
    line(0, 310, 0, 330);
    popMatrix();
  }
  for (int x = 0; x < 60; x++) {
    stroke(255);
    strokeWeight(1);
    pushMatrix();
    translate(width / 2, height / 2);
    rotate(radians(6 * x));
    line(0, 310, 0, 330);
    popMatrix();
  }
  //현재 시,분,초 가져오기.
  int h = hour();
  int s = second();
  int m = minute();
  
 //시침.
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(6*h));
  stroke(255);
  strokeWeight(4);
  line(0,0,150,0);
  popMatrix();
  
  //분침
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(6*m));
  stroke(255);
  strokeWeight(2);
  line(0,0,250,0);
  popMatrix();
  
  //초침.
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(6*s));
  stroke(255,0,0);
  strokeWeight(1);
  fill(255,0,0);
  circle(0,0,20);
  line(0,0,300,0);
  popMatrix();
}
