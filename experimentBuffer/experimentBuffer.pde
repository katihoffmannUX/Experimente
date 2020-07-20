//cc_tut_buffer
PGraphics buffer;
PGraphics buffer2;

void setup() {
  size(1000, 1000, P2D);
  buffer = createGraphics(width, height, P2D);
  buffer2 = createGraphics(width, height, P2D);
}

void draw() {
  drawBuffer();
 
  
  int cells = 25;
  int spacing = width / cells;
  
  buffer2.beginDraw();
  buffer2.noFill();
  buffer2.stroke(255);
  buffer2.strokeWeight(2);
  for(int y = 0; y < cells; y++) {
    for(int x = 0; x < cells; x++) {
      int wave = floor(sin(radians(frameCount + x*y)) * 300);
      
      int sx = x * spacing + wave*2;
      int sy = y * spacing;
      int sw = spacing;
      int sh = spacing;
      
      int dx = x * spacing+mouseX;
      int dy = y * spacing;
      int dw = spacing/2;
      int dh = spacing*3;
      
      buffer2.copy(buffer, sx, sy, sw, sh, dx, dy, dw, dh);
      buffer2.rect(x * spacing, y * spacing, spacing, spacing);
    }
  }
  buffer2.endDraw();
  
  //image(buffer, 0, 0);
  image(buffer2, 0, 0);
  
  pushMatrix();
  translate(width/2, height - 100);
  fill(255, 0, 0);
  noStroke();
  textSize(75);
  text("Experiment", 0, 0);
  popMatrix();
}


void drawBuffer() {
  buffer.beginDraw();
  buffer.background(0);
  buffer.translate(width/2, height/2);
  buffer.noStroke();
  buffer.fill(255);
  float x = 0;
  float y = -100;
  buffer.textSize(height/2);
  buffer.textAlign(CENTER, CENTER);
  buffer.text("Test", x, y);
  buffer.endDraw();
}


void mouseReleased() {
  saveFrame("data/line-######.png");
}
