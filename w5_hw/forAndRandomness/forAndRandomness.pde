//1.마우스 위치에 따라 최소 3개에서 최대 16개의 사각 타일로 채운다.

int tileNum;
int randomSeed = 0;
float noiseMult = 0.1;

void setup() {
  size(800, 800);
}

void draw() {
  noiseSeed(randomSeed);
  randomSeed(1);
  background(0);
  tileNum = int(map(mouseX, 0, width, 3, 16 + 1));
  //noiseMult = map(mouseY, 0, height, 0.001, 0.0005);
  noiseMult = pow(10, map(mouseY, 0, height, -1, -4));
  float tileSize = width / float(tileNum);//정수를 소수화 시킴.(나눌 때)
  for (int row = 0; row < tileNum; row++) {
    for (int col = 0; col < tileNum; col++) {
      float rectX = tileSize * col;
      float rectY = tileSize * row;
      float centerX = rectX + tileSize * .5;
      float centerY = rectY + tileSize * .5;
      float noiseVal = noise(centerX *noiseMult, centerY * noiseMult);
      fill(0);
      stroke(255);
      circle(centerX, centerY, tileSize * 0.8);
      pushMatrix();
      translate(centerX, centerY);
      //rotate(radians(360 * randomVal));
      rotate(radians(360 * noiseVal));
      line(0, 0, tileSize * 0.8 * .5, 0);
      fill(255);
      float colorChange = int(map(mouseY, 0, height, 0, 255));
      fill(colorChange, 50, 50);
      float smallCircle = tileSize *0.8 * 0.15;
      circle(tileSize * 0.8 * 0.42, 0, smallCircle);
      popMatrix();
    }
  }
}
