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

//processing에서는 pixel[0] = [R,G,B,A]로 되지만
//p5.js에서는 pixel[n + 0]
//pixel[n + 1]
//pixel[n + 2]
//pixel[n + 3]

function draw() {
  background(255, 0, 0);
  cp.loadPixels();
  for (let idx = 0; idx < cp.pixels.length / 4; idx++) {
    let r = cp.pixels[4 * idx];
    let g = cp.pixels[4 * idx + 1];
    let b = cp.pixels[4 * idx + 2];
    let a = cp.pixels[4 * idx + 3];
    let br = brightness([r, g, b]);
    let dia = map(br, 0, 255, 0, 20);
    let x = idx % cpW;
    let y = floor(idx / cpW);
    fill(255);
    circle(10 * x + 5, 10 * y + 5, dia);
  }
}
