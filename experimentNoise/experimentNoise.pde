//cc_tut_noise
float x;
float y;
float radius = 100;
float radiusTwo = 100;
float xoff = 0;
float yoff = 100;
color c;
color cTwo;
color cThree;
color cFour;

void setup() {
  size(700, 700);
  y = height/2;
  x = width/2;
  c = color(255, 255, 255);
  
  noiseSeed(66666);
}

void draw() {
  background(0);
  
  x = map(noise(xoff), 0, 1, 0, width);
  y = map(noise(yoff), 0, 1, 0, height);
  radius = map(noise(xoff), 0, 1, 1, 250);
  radiusTwo = map(noise(xoff), 0, 1, 1, random(50,100));
  c = color(100, 100, 255, map(noise(xoff), 0, 1, 0, 255));
  cTwo = color(100, 255, 100, map(noise(xoff), 0, 1, 0, 255));
  cThree = color(255, 100, 100, map(noise(xoff), 0, 1, 0, 255));
  cFour = color( map(noise(xoff), 0, 1, 0, 255));
  
  xoff = xoff + 0.03;
  yoff = yoff + 0.03;
  
  fill(cFour);
  circle(mouseY, mouseX, radiusTwo);
  fill(c);
  stroke(100,100,255);
  strokeWeight(noise(5));
  circle(x, y, radius);
  circle(x+10, y+10, radius);
  fill(cTwo);
  circle(y, x, radius);
  fill(cTwo);
  circle(y+10, x+10, radius);
  fill(cThree);
  circle(mouseX, mouseY, radiusTwo);
}


void mouseReleased() {
  saveFrame("data/line-######.png");
}
