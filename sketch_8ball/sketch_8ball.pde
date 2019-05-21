Billiard game;

interface isCollideable{
  boolean transferspeed();
  float shiftangle();
}

void setup(){
  size(1200, 650);
  Billiard b = new Billiard();
  game=b;
  b.setTable();
  }
  
void mouseDragged(){
  game.movestick();
  }
void mouseReleased(){
  game.released();
}
void draw(){
  game.display();
}
class Billiard{
  PImage table;
  int power;
  ArrayList<Ball> BallsTodisplay = new ArrayList<Ball>();
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
  power=0;
  //setTable();
  //INSTANCE VARIABLES RESET
  }
  
  void movestick(){
    power+=5;
  }
  
  void released(){
    power=0;
  }
    
  void setTable(){
    //SET UP BALLS
    for(int i=0;i<15;i++){
      Ball ba = new Ball(setPos[i*2], setPos[i*2+1], setColor[3*i], setColor[3*i+1], setColor[3*i+2]);
      BallsTodisplay.add(ba);
    }
    Ball wb = new Ball(330, 325, 255, 255, 255);
    BallsTodisplay.add(wb);
    
    display();
    pushMatrix();
    translate(315, 320);
    rotate(radians(90));
   // rotate(radians(tan(mouseY/(mouseX+2))));  <-- Need to figure out how to rotate stick
    fill(165,42,42);
    rect(0-power,0, 10, 500);
    popMatrix();
  }
  
  void display(){
    table.resize(1200,650);
    background(table);
    for(Ball i: BallsTodisplay){
      i.display();
    }
    pushMatrix();
    translate(315, 320);
    rotate(radians(90));
   // rotate(radians(tan(mouseY/(mouseX+2))));  <-- Need to figure out how to rotate stick
    fill(165,42,42);
    rect(0,0+power, 10, 500);
    popMatrix();
    fill
    rect(400,30,-power,20);
    
    
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
  class WhiteBall{
    WhiteBall(){
      super();
    }
  }
