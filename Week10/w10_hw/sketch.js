let colours = ['#257180', '#F2E5BF', '#FD8B51', '#CB6040'];
let gravity = [0, 0.1];
let friction = 0.99;
let cnt = 0;
let mousePos = [0, 0];

let confetties = [];

function setup() {
  createCanvas(800, 800);
}

function gen(x, y, n) {
  for (let idx = 0; idx < n; idx++) {
    let randomW = random(4, 20);
    let randomH = random(4, 20);
    let randomForce = random(1, 10);
    let randomAngForce = random(-30, 30);
    let newConfetti = new Confetti(
      x,
      y,
      randomW,
      randomH,
      random(colours),
      randomForce,
      randomAngForce
    );
    confetties.push(newConfetti);
  }
}

function mousePressed() {
  cnt = 0;
  mousePos = [mouseX, mouseY];
}

function mouseReleased() {
  console.log('gen:' + cnt);
  gen(mousePos[0], mousePos[1], cnt);
}

function keyPressed() {
  if (key == 'p' || key == 'P') {
    console.log('confetties: ' + confetties.length);
  }
}

function draw() {
  if (mouseIsPressed) {
    cnt++;
  }
  background(255);
  for (let idx = confetties.length - 1; idx >= 0; idx--) {
    let aConfetti = confetties[idx];
    aConfetti.update(gravity, friction);
    if (aConfetti.isOutOfScreen()) {
      confetties.splice(idx, 1);
    }
  }
  for (let idx = 0; idx < confetties.length; idx++) confetties[idx].display();
}

class Confetti {
  constructor(x, y, w, h, colour, force, angForce) {
    this.pos = createVector(x, y);
    this.vel = createVector(0, 0);
    this.size = createVector(w, h);
    this.colour = colour;
    this.init(x, y, w, h, colour, force, angForce);
  }

  init(x, y, w, h, colour, force, angForce) {
    this.pos.set(x, y);
    this.size.set(w, h);
    this.colour = colour;

    let randomDir = radians(random(360));
    this.vel.set(force * cos(randomDir), force * sin(randomDir));

    this.ang = radians(random(360));
    this.angVel = radians(angForce);
  }

  update(force, friction) {
    this.vel.add(createVector(force[0], force[1]));
    this.pos.add(this.vel);
    this.vel.mult(friction);

    this.ang += this.angVel;
    this.angVel *= friction;
  }

  display() {
    push();
    rectMode(CENTER);
    translate(this.pos.x, this.pos.y);
    rotate(this.ang);
    noStroke();
    fill(this.colour);
    rect(0, 0, this.size.x, this.size.y);
    pop();
  }

  getDiagonal() {
    let sumSquare = pow(this.size.x * 0.5, 2) + pow(this.size.y * 0.5, 2);
    return sqrt(sumSquare);
  }

  isOutOfScreen() {
    return (
      this.pos.x < -this.getDiagonal() ||
      this.pos.x > width + this.getDiagonal() ||
      this.pos.y < -this.getDiagonal() ||
      this.pos.y > height + this.getDiagonal()
    );
  }
}
