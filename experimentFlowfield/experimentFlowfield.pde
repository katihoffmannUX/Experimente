//Orginal: cc_tut_vectors
Flowfield myFlowfield;
ArrayList<Particle> particles;
color[] colors;

void setup() {
  size(800, 800);
  
  colors = new color[2];
  colors[0] = color(252, 247, 127);
  colors[1] = color(60, 151, 163);
  
  myFlowfield = new Flowfield(20);
  myFlowfield.update();
  
  particles = new ArrayList<Particle>();
  for(int i = 0; i < 1000; i++) {
    Particle particle = new Particle();
    particles.add(particle);
  }
  background(0); 
}

void draw() {
  //background(0);
  
  colors[0] = color(252, random(0,255), 127);
  fill(0, 100);
  rect(0,0, width, height);
  myFlowfield.update();
  //myFlowfield.show();
  
  for(Particle particle : particles) {
    particle.follow(myFlowfield);
    particle.update();
    particle.updateColor(colors[0], colors[1]);
    particle.edges();
    particle.show();
  }
  
}


void mouseReleased() {
  saveFrame("data/line-######.png");
}
