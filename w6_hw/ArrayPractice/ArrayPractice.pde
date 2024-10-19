int[] fruitAmts;
String[] fruitNames = {"apple",
  "banana",
  "peach",
  "orange",
  "kiwi",
  "plum",
  "tangerine"};
color[] colors = {color(198, 46, 46), color(249, 175, 0),
  color(255, 227, 227), color(255, 157, 61),
  color(121, 134, 69), color(67, 56, 120),
  color(255, 191, 97)};


void setup() {
  size(1280, 720);
  fruitAmts = new int[fruitNames.length];
  for (int n = 0; n < fruitAmts.length; n++) {
    fruitAmts[n] = int(random(5, 100));
  }
}


float barGap = 140;
float barWidth = 30;
float x = 200;

void mousePressed() {
  for (int n = 0; n < fruitAmts.length; n++) {
    fruitAmts[n] = int(random(5, 100));
  }
}


void draw () {
  background(0);
  strokeWeight(1);
  
  stroke(134);
  line(0,150,1280,150);
  line(0,260,1280, 260);
  line(0,370, 1280, 370);
  line(0,height * 0.7, 1280, height * 0.7);
  

  for (int n = 0; n < fruitNames.length; n++) {
    strokeWeight(barWidth * 2.5);
    stroke(colors[n]);
    strokeCap(SQUARE);
    textAlign(CENTER);
    textSize(24);
    fill(colors[n]);
    line(x + barGap * n, height * 0.7,
      x + barGap * n, height * 0.5 - 2 * fruitAmts[n]);
    text(fruitNames[n],
      x + barGap * n, height * 0.7 + 30);
    text(fruitAmts[n],
      x + barGap * n, height * 0.5 - 2 * fruitAmts[n] - 20);
  }

  int totalFruitAmts = 0;
  for (int amt : fruitAmts) {
    totalFruitAmts += amt;
  }
  fill(255);
  textSize(30);
  textAlign(CENTER);
  text("Total Fruits: " + totalFruitAmts, width /2 , 100);
}
