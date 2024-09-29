void setup() {
  size(640, 480);
  background(124, 245, 255);
};

void draw() {
  rectMode(CENTER);

  //땅
  fill(110, 194, 7);
  rect(320, 500, 640, 220);

  //우물
  stroke(0);
  fill(127);
  rect(320, 458, 300, 240);
  fill(127);
  ellipse(320, 345, 300, 100);
  fill(124, 245, 255);
  ellipse(320, 345, 240, 80);

  //캐릭터 얼굴
  strokeWeight(4);
  fill(mouseX, mouseY, 100);
  //fill(143, 209, 79);
  ellipse(320, 280, 240, 180);
  noStroke();
  circle(240, 200, 80);
  circle(400, 200, 80);
  //홍조
  fill(255, 131, 67);
  ellipse(240, 280, 50, 40);
  ellipse(400, 280, 50, 40);
  //입
  stroke(0);
  fill(255, 30, 30);
  ellipse(320, 310, 40, 50);
  //눈
  fill(255);
  noStroke();
  circle(240, 200, 55);
  circle(400, 200, 55);
  //눈동자
  //눈동자의 움직임을 눈 안으로 한정시키는 코드에 제한이 있어 CHAT GPT를 참고했습니다.
  fill(0);
  //#두 개의 눈의 중심위치를 설정
  float eye1X = 240;
  float eye1Y = 200;
  float eye2X = 400;
  float eye2Y = 200;

  float pupilSize = 30;//#눈동자의 크키
  float maxPupilDist = 15;//#눈동자가 움직일 수 있는 최대 거리

  // 첫 번째 눈동자 위치 계산
  //#각 눈의 중심에서 마우스까지의 거리 계산 후, 거리의 크기를 dist()함수로 측정
  float dx1 = mouseX - eye1X;
  float dy1 = mouseY - eye1Y;
  float distance1 = min(dist(eye1X, eye1Y, mouseX, mouseY), maxPupilDist);
  //#atan2 함수를 통해 눈 중심 간의 각도를 계산 
  float angle1 = atan2(dy1, dx1);
  //#계산된 거리와 각도만큼 이동한 새 위치를 cos(), sin()함수로 측정
  float pupilX1 = eye1X + cos(angle1) * distance1;
  float pupilY1 = eye1Y + sin(angle1) * distance1;

  // 두 번째 눈동자 위치 계산
  float dx2 = mouseX - eye2X;
  float dy2 = mouseY - eye2Y;
  float distance2 = min(dist(eye2X, eye2Y, mouseX, mouseY), maxPupilDist);
  float angle2 = atan2(dy2, dx2);
  float pupilX2 = eye2X + cos(angle2) * distance2;
  float pupilY2 = eye2Y + sin(angle2) * distance2;

  // 눈동자 그리기
  noStroke();
  circle(pupilX1, pupilY1, pupilSize);
  circle(pupilX2, pupilY2, pupilSize);

  //구름
  noStroke();
  fill(255);
  circle(30, 50, 60);
  circle(70, 50, 90);
  circle(110, 50, 60);
  circle(400, 40, 50);
  circle(440, 40, 80);
  circle(480, 40, 50);
  //태양
  fill(250, 188, 63);
  circle(600, 40, 200);
};
