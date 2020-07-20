//cc_tut_vectors
Agent myAgent;

void setup() {
  size(1000, 1000);
  myAgent = new Agent();

}

void draw() {
  background(0);
  
  myAgent.seek(new PVector(mouseY, mouseX));
  myAgent.update();
  myAgent.edges();
  myAgent.show();
}


void mouseReleased() {
  saveFrame("data/line-######.png");
}
