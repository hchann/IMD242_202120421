int randomSeed = int(random(10000000));
color[] bgColors =  {color(11, 25, 44), color(119, 205, 255), color(255, 143, 71)};
color bgColor;

void setup() {
  size(800, 800);
  bgColor = bgColors[int(random(bgColors.length))];
}

void mousePressed() {
  randomSeed = int(random(10000000));
  println(randomSeed);
  bgColor = bgColors[int(random(bgColors.length))];
}

void draw() {
  randomSeed(randomSeed);
  background(bgColor);

  noStroke();
  fill(255);
  circle(30, 50, 60);
  circle(70, 50, 90);
  circle(110, 50, 60);
  circle(400, 40, 50);
  circle(440, 40, 80);
  circle(480, 40, 50);
  
  stroke(0);
  strokeWeight(3);

  for (int n = 0; n < 5; n++) {
    float xPos = random(width * 0.2, width * 0.8);
    apart(random(height * .5),
      random(3, 6),
      30,
      random(30, 60), xPos);
  }
}

void apart(float apartH, float windowCount,
  float spacing,
  float windowW,
  float xPos) {
  float windowH = 50;
  float h = apartH * 2;
  float w = width * .5;

  fill(143);
  strokeWeight(3);
  //noStroke();

  pushMatrix();
  translate(xPos, height);

  //아파트 본체
  rect(-w * .25, -h * .7, w * .5, h + 100);

  float totalwindowH = (h * 0.5 - 100)
    -(spacing *  (windowCount - 1));
  float startY = -h * 0.6 + (h * 0.5 - totalwindowH) / 2;

  //창문
  fill(119, 205, 255);
  for (int i = 0; i < windowCount; i++) {
    float yLocation = startY + (windowH + spacing) * i;

    rect(-w * 0.2, yLocation, windowW, windowH);
    rect(w * 0.2 - windowW, yLocation, windowW, windowH);
  }
  ;

  popMatrix();
  //popMatrix();
}
