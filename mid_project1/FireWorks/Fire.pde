class Fire {
  float[] pos;
  float[] vel;
  float[] size;
  float ang;
  float angVel;
  float hue;
  float bright;
  float radius;
  float speed;
  int totalCircle;

  Fire(float x, float y, float xn, float yn, float speed, float angSpeed) {
    pos = new float[2];
    vel = new float[2];
    size = new float[2];
    pos[0] = x;
    pos[1] = y;
    size[0] = xn;
    size[1] = yn;
    this.speed = speed;  //속도 설정
    radius = 0;  //반지름 설정
    angVel = radians(angSpeed);  //회전 속도
    hue = random(255);  //색상 설정
    bright = random(200);  //밝기 설정
    totalCircle = 40;  //동심원의 원 개수
    
    // 속도와 각도를 랜덤으로 설정하여 원들이 마우스에서 퍼져나가도록 함.
    vel[0] = random(-2, 2);  // X 방향 속도
    vel[1] = random(-2, 2);  // Y 방향 속도
  }

  void update() {
    // 원의 중심에서 일정 각도마다 선들이 퍼져 나가도록
    radius += speed * 0.5;  // 반지름을 증가시켜 선들이 점차 퍼져나가게 함, 속도 증가.
    
    // 원의 위치를 갱신하여 마우스를 기준으로 퍼져나가게 함.
    pos[0] += vel[0];  // X 방향으로 이동
    pos[1] += vel[1];  // Y 방향으로 이동
  }

  void display() {
    push();
    stroke(hue, bright, 255);
    translate(pos[0], pos[1]);  //중심으로 이동
    strokeWeight(1);
    //각도 설정 부분 - chat GPT의 도움을 받아서 작성됨.
    //불꽃놀이처럼 보이게 하기 위해서 랜덤하게 각도가 계산이 되어야 하는 부분을 질문함.
    for (int i = 0; i < totalCircle; i++) {
      float angle = map(i, 0, totalCircle, 0, TWO_PI);  // 각도 분할
      float x = cos(angle) * radius;
      float y = sin(angle) * radius;
      //line(0,0,x,y);
      circle(x, y, random(1, 5));
    }
    pop();
  }

  boolean isOutOfBounds() {
    // 화면 밖으로 나갔는지 확인
    return pos[0] < 0 || pos[0] > width || pos[1] < 0 || pos[1] > height;
  }
}
