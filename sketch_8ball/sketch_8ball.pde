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
  int[] setColor = new int[]{255,255,0, 0,0,255, 255,0,0, 128,0,128, 255,165,0, 50,205,50, 128, 0, 32,
                             255,255,0, 0,0,255, 255,0,0, 128,0,128, 255,165,0, 50,205,50, 128, 0, 32,
                             0, 0, 0};
                           
                        
                           
    
  Billiard(){
  table = loadImage("pooltable.png");
  //setTable();
  //INSTANCE VARIABLES RESET
  }
  
  void setTable(){
    //SET UP BALLS
    for(int i=0;i<15;i++){
      Ball ba = new Ball(setPos[i*2], setPos[i*2+1], setColor[3*i], setColor[3*i+1], setColor[3*i+2]);
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
    int c1, c2, c3;
    Ball(int xx, int yy, int r, int g, int b){
      x=xx;
      y=yy;
      c1 = r;
      c2 = g;
      c3 = b;
      //INSTANCE VARIABLES
    }
    
    void display(){
      for (int i =0; i<15; i++){
         fill(c1, c2, c3);
      circle(x,y,30);}
    }
    void move(){
      x--;
    }
  }
