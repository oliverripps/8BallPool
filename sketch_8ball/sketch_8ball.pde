Billiard game;
boolean play;
ArrayList<Ball> balls;
ArrayList<Ball> baggedStripe;
ArrayList<Ball> baggedSolid;
boolean broken;
boolean over;



interface isCollideable {
  boolean isTouching(Ball other);
  boolean transferspeed(float i);
  boolean transferangle(float f);
}

void setup() {
  size(1200, 650);
  Billiard b = new Billiard();
  game=b;
  balls=game.setTable();
  baggedStripe = new ArrayList<Ball>(8);
  baggedSolid = new ArrayList<Ball>(8);
  
  broken=false;
  over=false;
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
 /*void keyPressed(){
   for (int x = balls.size()-1; x >= 0; x--){
    Ball i = balls.get(x);
    i.move();
  }
  game.moveW();
  }
 
   
void draw() {
  if(balls.size()==0){
    over=true;
  }
  
   
    
  if(!over){
    game.display();
  /*for (int x = balls.size()-1; x >= 0; x--){
    Ball i = balls.get(x);
    i.move();
  }
  game.moveW();
  }*/
 
}
}
