//w8의 particle 예제 부분의 코드를 기본 베이스로 시작함.
//Jason Labbe작가의 "happy sandbox"라는 작품의 영감을 받음.


ArrayList<Fire> fires;
int maxFires = 400;  // 최대 fire 객체 개수 제한.

void setup() {
  fullScreen();
  fires = new ArrayList<Fire>();
  colorMode(HSB, 255);//색상을 HSB모드로 설정하고 범위를 0~255까지로 설정.
  textSize(32);
}

void mousePressed() {
  // 마우스를 눌렀을 때 Fire 객체 생성
  NFires(mouseX, mouseY);
}

void NFires(float x, float y) {
  int cnt = 10;  // 클릭 한 번에 생성되는 Fire 객체의 개수.
  // cnt 만큼 fire 객체 추가, 단 최대 개수는 maxFires로 제한.
  for (int n = 0; n < cnt && fires.size() < maxFires; n++) {
    //fire 객체가 마우스 위치에서 랜덤한 방향과 속도로 퍼지게 함.
    Fire aNewFire = new Fire(x, y, 20, 40, 10, 5);  // 속도 증가.
    fires.add(aNewFire);
  }
}

void draw() {
  background(0);
  for (int idx = fires.size() - 1; idx >= 0; idx--) { 
    Fire aFire = fires.get(idx);
    aFire.update();  
    aFire.display();  

    // Fire객체들이 화면 밖으로 나가면 삭제.
    if (aFire.isOutOfBounds()) {
      fires.remove(idx);
    }
  }

  text("Fires:" + fires.size(), 10, 30);// 화면 좌측 상단 ArrayList의 현재 크기 표시.
}
