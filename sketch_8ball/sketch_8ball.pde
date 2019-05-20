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
  int[] setPos = new int[]{870, 325, 
                           896, 310, 896, 340,
                           922, 295, 922, 325, 922, 355,
                           948, 280, 948, 310, 948, 340, 948, 370,
                           974, 265, 974, 295, 974, 325, 974, 355, 974, 385 };
                           
    
  Billiard(){
  table = loadImage("pooltable.png");
  //setTable();
  //INSTANCE VARIABLES RESET
  }
  
  void setTable(){
    //SET UP BALLS
    for(int i=0;i<15;i++){
      Ball ba = new Ball(setPos[i*2], setPos[i*2+1]);
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
    Ball(int xx, int yy){
      x=xx;
      y=yy;
      //INSTANCE VARIABLES
    }
    
    void display(){
      circle(x,y,30);
    }
    void move(){
      x--;
    }
  }
