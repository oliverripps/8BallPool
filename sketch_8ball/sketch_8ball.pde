interface isCollideable{
  boolean transferspeed();
  float shiftangle();
}

class Billiard{
  PImage table;
  
  Billiard(){
  table = loadImage("pooltable.png");
  setTable();
  //INSTANCE VARIABLES RESET
  }
  
  void setTable(){
    //SET UP BALLS
    display();
  }
  
  void display(){
    image(table,0,0);
}
}
