let tileNumX = 16;
let tileNumY = 12;

//void = function
function setup() {
  createCanvas(640, 480); //사이즈
}

function draw() {
  background('black'); //변수는 float, int 다 let,var로 구분 없이 대체 가능
  noStroke();
  fill('cornflowerblue');
  // for (let column = 0; column < width; column += 40) {
  //   for (let row = 0; row < width; row += 40) {
  //     let x = 20 + column;
  //     let y = 20 + row;
  //     let diameter = 30;
  //     circle(x, y, diameter);
  //   }
  // }
  for (let row = 0; row < tileNumY; row++) {
    for (let column = 0; column < tileNumX; column++) {
      let tileW = width / tileNumX;
      let tileH = height / tileNumY;
      let x = tileW * 0.5 + column * tileW;
      let y = tileH * 0.5 + row * tileH;
      ellipse(x, y, tileW, tileH);
    }
  }
}
