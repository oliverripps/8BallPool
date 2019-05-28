class Billiard {
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

  int[] setColor = new int[]{255, 255, 0, 0, 0, 255, 255, 0, 0, 128, 0, 128, 255, 165, 0, 50, 205, 50, 128, 0, 32, 
    255, 255, 0, 0, 0, 255, 255, 0, 0, 128, 0, 128, 255, 165, 0, 50, 205, 50, 128, 0, 32, 
    0, 0, 0};

  Billiard() {
    table = loadImage("pooltable.png");
    in=false;
    power=0;
    whiteAngle =0;
    //setTable();
    //INSTANCE VARIABLES RESET
  }

  void moveW(){
    w.move();
  }
  
  void click(int mousex, int mousey){
    if(w.getIn()){
    WhiteBall b = new WhiteBall(mousex, mousey, 255, 255, 255);
    w = b;
    balls.add(b);
    in = false;
  }
  }
  
  void movestick() {
    power+=5;
  }
  WhiteBall returnWhite() {
    return w;
  }
  void removeBall(WhiteBall b) {
    in=true;
    b.setIn();
  }
  /* void replace(){
   if (in){
   WhiteBall(mouseX, mouseY, 0, 0, 0);
   
   }*/


  ArrayList<Ball> setTable() {
    //SET UP BALLS
    for (int i=0; i<15; i++) {
      Ball ba = new Ball(setPos[i*2], setPos[i*2+1], setColor[3*i], setColor[3*i+1], setColor[3*i+2]);
      BallsTodisplay.add(ba);
    }
    WhiteBall wb = new WhiteBall(330, 325, 255, 255, 255);
    w=wb;
    //white = wb;
    display();
    return BallsTodisplay;
  }

  void released() {
    w.transferangle(180 - degrees(whiteAngle)); 
    w.transferspeed(power);
    power=0;
  }

  void display() {
    table.resize(1200, 650);
    background(table);

    for (Ball i : BallsTodisplay) {
      i.display();
    }
    if (!in) {
      w.display();
    }

    pushMatrix();
    translate(w.getX(), w.getY());
    rotate(radians(-90));
    float angle = atan2(mouseY-320, mouseX-330);
    whiteAngle = angle;

    //
    textSize(32);
    text(""+degrees(whiteAngle), 10, 30); 
    fill(0, 102, 153);
    //
    rotate(angle); // <-- Need to figure out how to rotate stick
    fill(165, 42, 42);
    rect(0, 0+power, 10, 500);
    popMatrix();
    if (power!=0) {
      if (power>200) {
        power=200;
      }
      if (power<=200 && power>150) {
        fill(0, 160, 0);
      }
      if (power<150 && power>100) {
        fill(255, 255, 0);
      }
      if (power<100 && power>50) {
        fill(255, 140, 0);
      }
      if (power<50 && power>00) {
        fill(255, 0, 0);
      }



      rect(400, 20, -power, 20);
    }
  }
}
