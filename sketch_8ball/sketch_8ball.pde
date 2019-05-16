interface isCollideable{
  boolean transferspeed();
  float shiftangle();
}

void setup(){
  size(1200, 600);
  Billiard b = new Billiard();
  b.setTable();
  }
  
class Billiard{
  PImage table;
  
  Billiard(){
  table = loadImage("pooltable.png");
  //setTable();
  //INSTANCE VARIABLES RESET
  }
  
  void setTable(){
    //SET UP BALLS
    display();
  }
  
  void display(){
    table.resize(1000, 800);
    image(table,0,0);
}
}
