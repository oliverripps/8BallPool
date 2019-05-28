Billiard game;
boolean play;
ArrayList<Ball> balls;
boolean broken;



interface isCollideable {
  boolean isTouching(Ball other);
  boolean transferspeed(int i);
  boolean transferangle(float f);
}

void setup() {
  size(1200, 650);
  Billiard b = new Billiard();
  game=b;
  balls=game.setTable();
  broken=false;
}

void mouseClicked() {
  game.click(mouseX, mouseY);
  }
  
void mouseDragged() {
  game.movestick();
  play=true;
}


void mouseReleased() {
  game.released();
  //startHit();
}
void draw() {
  game.display();
  
  for (Ball i : balls) {
    i.move();
  }
  game.moveW();
}
