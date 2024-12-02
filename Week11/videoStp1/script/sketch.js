let cp;
let canvasW, cansvasH;
let scale;
let cpW, cpH;

function setup() {
  canvasW = 640;
  cansvasH = 480;
  createCanvas(canvasW, cansvasH);

  scale = 0.1;
  cpW = canvasW * scale;
  cpH = cansvasH * scale;
  cp = createCapture(VIDEO);
  cp.size(cpW, cpH);
  cp.hide();
}
// n번이 (x,y)알고 싶을 때
//너비를 알고 있을 때
//x = 6 % 4 = 2(나머지)
//y = 6 / 4 = 1(몫)
//(2,1)-> y * 너비 + x = n번째 = 1 * 4 + 2 = 6번째
function draw() {
  background(0);
  // image(cp, 0, 0, width, height);
  noStroke();
  for (let y = 0; y < cpH; y++) {
    for (let x = 0; x < cpW; x++) {
      let colour = cp.get(x, y);
      let b = brightness(colour);
      let diameter = map(b, 0, 255, 0, 40);
      fill(255);
      circle(10 * x + 5, 10 * y + 5, diameter);
      // fill(colour[0], colour[1], colour[2]);
      // circle(10 * x, 10 * y, 10);
    }
  }
}
