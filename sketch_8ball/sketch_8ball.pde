Billiard game;
boolean play;
ArrayList<Ball> balls;
WhiteBall white;
  
interface isCollideable{
  boolean transferspeed(int i);
  float shiftangle(float f);
}

void setup(){
  size(1200, 650);
  Billiard b = new Billiard();
  game=b;
  balls=game.setTable();
  white=game.returnWhite();
  }

void mouseDragged(){
  game.movestick();
  play=true;
  }
void mouseReleased(){
  game.released();
  //startHit();
}
void draw(){
  game.display();
  for(Ball i:balls){
    i.move();
}
  white.move();
}
class Billiard{
  PImage table;
  int power;
  WhiteBall w;
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
  WhiteBall returnWhite(){
    return w;
  }
    
  ArrayList<Ball> setTable(){
    //SET UP BALLS
    for(int i=0;i<15;i++){
      Ball ba = new Ball(setPos[i*2], setPos[i*2+1], setColor[3*i], setColor[3*i+1], setColor[3*i+2]);
      BallsTodisplay.add(ba);
    }
    WhiteBall wb = new WhiteBall(330, 325, 255, 255, 255);
    //BallsTodisplay.add(wb);
    pushMatrix();
    translate(315, 320);
    rotate(radians(90));
   // rotate(radians(tan(mouseY/(mouseX+2))));  <-- Need to figure out how to rotate stick
    fill(165,42,42);
    rect(0-power,0, 10, 500);
    popMatrix();
    w=wb;
    display();
    return BallsTodisplay;

  }
  
    void released(){
    w.transferspeed(power);
    power=0;
  }
  
  void display(){
    table.resize(1200,650);
    background(table);
    for(Ball i: BallsTodisplay){
      i.display();
    }
    w.display();
    pushMatrix();
    translate(315, 320);
    rotate(radians(90));
   // rotate(radians(tan(mouseY/(mouseX+2))));  <-- Need to figure out how to rotate stick
    fill(165,42,42);
    rect(0,0+power, 10, 500);
    popMatrix();
    if(power!=0){
      if(power>200){
        power=200;
      }
      if(power<=200 && power>150){
        fill(0,160,0);
      }
      if(power<150 && power>100){
        fill(255,255,0);
      }
      if(power<100 && power>50){
        fill(255,140,0);
      }
      if(power<50 && power>00){
        fill(255,0,0);
      }
      
      
      
    rect(400,20,-power,20);
    }
    
}
}

  class Ball implements isCollideable{
    int x,y;
    int c1, c2, c3;
    int speed;
    int angle;
    
    Ball(int xx, int yy, int r, int g, int b){
      x=xx;
      y=yy;
      c1 = r;
      c2 = g;
      c3 = b;
      speed=0;
      angle=0;
      //INSTANCE VARIABLES
    }
    Ball(){
    }
    
    void display(){
      fill(c1, c2, c3);
      circle(x,y,30);
    }
   void move(){
     x+=cos(angle)*speed;
     y+=sin(angle)*speed;
   }
  boolean transferspeed(int power){
    speed+=power/2;
    return true;
  }
  float shiftangle(float oldangle){
    return oldangle;
    //JUST SO NO ERROR
  }
  }
  
  class WhiteBall extends Ball{
    int x,y;
    int c1, c2, c3;
    int speed;
    int angle;
    
    
    WhiteBall(int xx, int yy, int r, int g, int b){
      x=xx;
      y=yy;
      c1 = r;
      c2 = g;
      c3 = b;
      speed=0;
      angle=0;
      //INSTANCE VARIABLES
    }
   
    
    boolean transferspeed(int power){
    speed+=power/4;
    return true;
    
    }
  float shiftangle(float oldangle){
    return oldangle;
    //JUST SO NO ERROR
  }
  
  boolean bounce(){
    if(x<78){
      angle=180-angle;
      return true;
    }
    if(x>1112){
      angle=45;
      angle=180-angle;
      return true;
    }
    if(y<78){
      angle=360-angle;
      return true;
    }
    if(y>565){
      angle=360-angle;
      return true;
    }
    return false;
  }
  void move(){
     x+=cos((float)(Math.toRadians(float(angle))))*speed;
     y-=sin((float)(Math.toRadians(float(angle))))*speed;
     if(bounce()){
       for(int i=0;i<0;i++){
         x+=cos((float)(Math.toRadians(float(angle))))*speed;
         y+=sin((float)(Math.toRadians(float(angle))))*speed;
       }
   }
  }
   void display(){
      fill(c1, c2, c3);
      circle(x,y,30);
    }
  }
