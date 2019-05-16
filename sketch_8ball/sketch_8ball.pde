interface isCollideable{
  boolean transferspeed();
  float shiftangle();
}

void setup(){
  size(1200, 650);
  Billiard b = new Billiard();
  b.setTable();
  }
  
  
class Billiard{
  PImage table;
  ArrayList<Ball> BallsToDisplay = new ArrayList<Ball>();
  Billiard(){
  table = loadImage("pooltable.png");
  //setTable();
  //INSTANCE VARIABLES RESET
  }
  
  void setTable(){
    //SET UP BALLS
    for(int i=0;i<13;i++){
      Ball ba = new Ball();
      BallsToDisplay.add(ba);
    }
    display();
  }
  
  void display(){
    table.resize(1200,650);
    background(table);
    for(Ball i: BallsToDisplay){
      i.display();
    }
    
}
}

  class Ball{
    int x,y;
    Ball(){
      x=870;
      y=324;
      //INSTANCE VARIABLES
    }
    
    void display(){
      circle(x,y,30);
    }
    void move(){
      x--;
    }
  }
