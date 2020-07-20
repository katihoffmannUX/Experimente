import processing.pdf.*;
//cc_tut_tilling_01

// global variable for cell size
int size = 20;

// global variable for probability
float probability = 0.5; // change this value to increase or decrease the probability of rotating clock or counter-clock wise

void setup() {
  // define canvas size in pixel
  size(500, 500);
  
  // call function once on startup
  generatePattern();
}

// event that gets fired whenever the mouse button is released
void mouseReleased() {
  // generate new pattern
  generatePattern();
  // save current frame to project folder
  saveFrame("data/line-######.png");
}

void draw() {

}


void generatePattern() {
  // clear background with black color
 
  background(255);
 
  
  // generate new cell size with a random value between 15 - 100
  size = floor(random(20, 100));
  // nested for-loop for each X and Y value for evey cell
  for(int x = 0; x < height; x+=size) {
    for(int y = 0; y < width; y+=size) {
 
      pushMatrix();
      // move the canvas to a new origin
      // -> new origin is the center of each cell
      translate(x+size/2, y+size/2);
      
      // draw each cell (white transparent with opactiy)
      noFill();
      //fill(y,10,x);
      stroke(217, 217,217,30);
     // noStroke();
      rect(-size/2, -size/2, size, size);
      
      // decide on the rotation by random value
      // rotate the canvas by either PI/4 or -PI/4
      if(random(1) < probability) {
        rotate(PI/5);
      }
      else if(random(2) < 0.1){
        rotate(PI/2);
      }
      else {
        rotate(-PI/5);
      }
      // draw horizontal line 
      //stroke(x,x,0);
      strokeWeight(random(3));
      stroke(0,0,random(255));
      //stroke(0,0,x);
      if(random(2) < 0.1){
      line(-size, 0, size, 0);
    }
      else if(random(2) < 0.7){
        line(-size*2, 0, size*2, 0);
        //line(-size/2, 0, size/2, 0);
      }
      else if(random(2) < 0.2){
        rect(-size*2, 0, size*2, 20);
        //line(-size/2, 0, size/2, 0);
      }
       else if(random(2) < 0.08){
         fill(0,0,random(255),100);
         noStroke();
        ellipse(-size*2, 0, size/2, size/2);
        //line(-size/2, 0, size/2, 0);
      }
      
      popMatrix();
    }
  }

}
