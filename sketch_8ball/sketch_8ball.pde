Billiard game;
boolean play;
ArrayList<Ball> balls;
WhiteBall white;
  
interface isCollideable{
  boolean transferspeed(int i);
  boolean transferangle(float f);
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
  Boolean in;
  PImage table;
  int power;
  float whiteAngle;
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
  in=false;
  power=0;
  whiteAngle =0;
  //setTable();
  //INSTANCE VARIABLES RESET
  }
  
  void movestick(){
    power+=5;
  }
  WhiteBall returnWhite(){
    return w;
  }
  void removeBall(WhiteBall b){
    in=true;
  }
  
  ArrayList<Ball> setTable(){
    //SET UP BALLS
    for(int i=0;i<15;i++){
      Ball ba = new Ball(setPos[i*2], setPos[i*2+1], setColor[3*i], setColor[3*i+1], setColor[3*i+2]);
      BallsTodisplay.add(ba);
    }
    WhiteBall wb = new WhiteBall(330, 325, 255, 255, 255);
    //BallsTodisplay.add(wb);
   /* pushMatrix();
    translate(330, 320);
    rotate(radians(90));*/
    //whiteAngle = atan2(mouseY-height/4, mouseX-width/4);
    /*rotate(angle); // <-- Need to figure out how to rotate stick
    fill(165,42,42);
    rect(0 + power,0, 10, 500);
    popMatrix();*/
    w=wb;
    display();
    return BallsTodisplay;

  }
  
    void released(){
    w.transferangle(90); ////////////////////////////////////////////////////////////
    w.transferspeed(power);
    power=0;
    
  }
  
  void display(){
    table.resize(1200,650);
    background(table);
    
    for(Ball i: BallsTodisplay){
      i.display();
    }
    if(!in){
      w.display();
    }
    
    pushMatrix();
    translate(330, 320);
    rotate(radians(-90));
    float angle = atan2(mouseY-320, mouseX-330);
    whiteAngle = angle;
    
    //
    textSize(32);
    text(""+whiteAngle, 10, 30); 
    fill(0, 102, 153);
    //
    rotate(angle); // <-- Need to figure out how to rotate stick
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
    float angle;
    
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
   boolean bounce(){
    if(x<100){
      if(y<90 && angle>90 && angle<180){
        goin();
      }
      else{
      angle=180-angle;
      }
      return true;
    }
    if(x>1112){
      angle=50;
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
     x+=cos((float)(Math.toRadians(angle)))*speed;
     y-=sin((float)(Math.toRadians(angle)))*speed;
     if(bounce()){
       for(int i=0;i<0;i++){
         x+=cos((float)(Math.toRadians(angle)))*speed;
         y+=sin((float)(Math.toRadians(angle)))*speed;
       }
   }
    
  }
  boolean transferspeed(int power){
    speed+=power/2;
    return true;
  }
  boolean transferangle(float ang){
    angle = ang;
    return true;
  }
  
  void goin(){
    c1=255;
    c2=0;
    c3=0;
  }
  }
  
  class WhiteBall extends Ball{
    int x,y;
    int c1, c2, c3;
    int speed;
    float angle;
    
    
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
    
    boolean transferangle(float ang){
    angle = ang;
    return true;
    }
    

  
  boolean bounce(){
    if(x<85){
      if((y<88 && angle>90 && angle<180) || (y>559 && angle>180 && angle<270)){
        goin();
      }
      else{
      angle=180-angle;
      }
      return true;
    }
    if(x>1105){
      if((y<88) || (y>559)){
        goin();
      }
      else{
      angle=180-angle;
      angle=(int)(Math.random()*180)+90;
      //CODE INSPIRED BY KAITLYN DUONG^^^^
      }
      return true;
    }
    if(y<72){
      if(x>578 && x<618){
        goin();
      }
      else{
      angle=360-angle;
      }
      return true;
    }
    if(y>560){
      if(x>578 && x<618){
        goin();
      }
      else{
      angle=360-angle;
      }
      return true;
    }
    return false;
  }
  void move(){
     x+=cos((float)(Math.toRadians(angle)))*speed;
     y-=sin((float)(Math.toRadians(angle)))*speed;
     if(bounce()){
       for(int i=0;i<0;i++){
         x+=cos((float)(Math.toRadians(angle)))*speed;
         y+=sin((float)(Math.toRadians(angle)))*speed;
       }
   }
    
  }
  void goin(){
    speed=0;
    game.removeBall(this);
  }
   void display(){
      fill(c1, c2, c3);
      circle(x,y,30);
    }
  }
