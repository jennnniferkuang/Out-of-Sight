void setup(){
  size(900, 700);
  loadWalkCycle();
  loadCrouchCycle();
  resetVariables();
  title = createFont("Papyrus", 50);
  info = createFont("Fangsong", 30);
} // end setup


void draw(){
  drawScene();
} // end draw
