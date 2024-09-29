void setup() {
  size(640, 360);
  rectMode(CENTER);
}

void draw() {
  background(0);

  //if (mouseX > width / 3 * 2) {
  //} else if (mouseX > width / 3) {
  //} else {
  //}

  if (mouseY < height / 4) {
    circle(width * .5, height * 1/4 - 50, 60);
  } else if (mouseY < height / 2) {
    square(width * .5, height * .5 - 50, 60);
  } else if (mouseY < height / 4 * 3) {
    line(width * .5, height / 4 * 2, 
      width * .5 + 80, height / 4 * 3);
  } else {rect(width * .5, height * 3/4 + 40, 80, 40 );
  }

  stroke(127);
  strokeWeight(4);
  
line(0, height / 4, width, height / 4);

line(0, height / 4 * 2, width, height / 4 * 2); 

line(0, height / 4 * 3, width, height / 4 * 3); 
}
