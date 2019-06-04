class Billiard {
  Boolean in;
  PImage table;
  float power;
  float whiteAngle;
  WhiteBall w;
  ArrayList<Ball> BallsToDisplay = new ArrayList<Ball>();
  Ball eight;
  int isrecent;
  ArrayList<ArrayList<Ball>> touches;


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
    isrecent=0;
    //setTable();
    //INSTANCE VARIABLES RESET
  }

  void moveW() {
    w.move();
  }


  void click(int mousex, int mousey) {
    if (w.getIn()) {
      WhiteBall b = new WhiteBall(mousex, mousey, 255, 255, 255);
      w = b;
      balls.add(w);
      w.setIn(false);
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
    BallsToDisplay.remove(b);
    b.setIn(true);
  }
  /* void replace(){
   if (in){
   WhiteBall(mouseX, mouseY, 0, 0, 0);
   
   }*/


  ArrayList<Ball> setTable() {
    //SET UP BALLS
    boolean s = true;
    for (int i=0; i<15; i++) {
      Ball ba = new Ball(setPos[i*2], setPos[i*2+1], setColor[3*i], setColor[3*i+1], setColor[3*i+2], s, (i+2)/2, i);
      BallsToDisplay.add(ba);
      s = !s;
    }
    WhiteBall wb = new WhiteBall(330, 325, 255, 255, 255);
    w=wb;
    //white = wb;
    display();
    /*for(Ball b:balls){
     if(b.isblack()){
     eight=b;
     }
     }*/
    return BallsToDisplay;
  }

  void released() {
    w.transferangle(180 - degrees(whiteAngle)); 
    w.transferspeed(power*.8);
    power=0;
  }

  /*boolean eightin(){
   return eight.isin();
   }*/

  void polygon(float x, float y, float radius, int npoints) {  //Copied from processing.org
    float angle = TWO_PI / npoints;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius;
      float sy = y + sin(a) * radius;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }

  void puttedBallDisplay() {
    int[] collidenumsSolid = new int[baggedSolid.size()];
    int[] collidenumsStripe = new int[baggedStripe.size()];
    for (int i = 0; i < baggedSolid.size(); i++) {
      collidenumsSolid[i] = baggedSolid.get(i).getCollideNumber();
     /* for(int j =0; j<collidenumsSolid.length; j++){
        textSize(12);
        text(collidenumsSolid[j], 700+20*j, 500);
    }*/
    }
    for (int i = 0; i < baggedStripe.size(); i++) {
      collidenumsStripe[i] = baggedStripe.get(i).getCollideNumber();
     /* for(int j =0; j<collidenumsStripe.length; j++){
        textSize(12);
        text(collidenumsStripe[j], 500+20*j, 500);
    }*/
    }
    quicksort(collidenumsStripe);
    quicksort(collidenumsSolid);
    for (int x =0; x < collidenumsSolid.length; x++){
      int cn = collidenumsSolid[x];
      int xcor = 200+(30*x);
      int ycor = 630;
      stroke(0, 0, 0);
      fill(setColor[3*cn], setColor[3*cn+1], setColor[3*cn+2]);
      circle(xcor, ycor, 30);
      ellipseMode(CENTER);  
      fill(255);  
      circle(xcor, ycor, 13);  
      fill(0, 0, 0);
      textSize(12);
      text((cn+2)/2, xcor-4, ycor+5);
      }
      
    
    for (int x =0; x <collidenumsStripe.length; x++){
      int cn = collidenumsStripe[x];
      int xcor = 800+(30*x);
      int ycor = 630;
      stroke(0, 0, 0);
      fill(255, 255, 255);
      circle(xcor, ycor, 30);
      fill(setColor[3*cn], setColor[3*cn+1], setColor[3*cn+2]);
      rect(xcor-12.5, ycor-7.5, 26, 15);
      stroke(setColor[3*cn], setColor[3*cn+1], setColor[3*cn+2]);
      polygon(xcor-8.7, ycor+.4, 5.4, 20);
      polygon(xcor+8.9, ycor+.4, 5.4, 20);
      rect(xcor-12, ycor-5, 24, 10);
      fill(255, 255, 255);
      circle(xcor, ycor, 13);
      fill(0, 0, 0);
      textSize(12);
      text((cn+2)/2, xcor-4, ycor+5);
      // text(collidenumber, x+20, y);
    }
  }



  void display() {
    //if(!eightin()){
    table.resize(1200, 650);
    background(table);

    for (Ball i : BallsToDisplay) {
      i.display();
    }
    if (!in) {
      w.display();
    }

    pushMatrix();
    translate(w.getX(), w.getY());
    rotate(radians(-90));
    float angle = atan2(mouseY-w.getY(), mouseX-w.getX());
    whiteAngle = angle;

    //
    textSize(32);
    //text(""+degrees(whiteAngle), 10, 30); 
    fill(0, 102, 153);
    //
    rotate(angle); //
    fill(165, 42, 42);
    if (w.getspeed()==0 && w.getIn()==false) {
      rect(-5.5, power, 10, 500);

      //rotate(angle);
      stroke(255);
      line(0, 0, 0, -300);
    } 
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
    puttedBallDisplay();




    /*if (isrecent>0) {
     touches=null;
     isrecent++;
     if (isrecent>3) {
     isrecent=0;
     }
     }
     if (isrecent==0) {
     touches=makeTouches();
     if (touches.size()!=0) {
     for(int l=0;l<touches.size();l++){
     for(int i=1;i<getmax(touches);i++){
     float newangle = touches.get(l).get(0).getAngle(touches.get(l).get(i));
     float a=((newangle-180)+angle)/2;
     a=a%360;
     hit(touches.get(l).get(i),touches.get(l).get(0).getspeed(), 
     newangle,touches.get(l).get(0),touches.get(l).get(0).getspeed(),a);
     }
     isrecent=1;
     }
     }*/
  }



  //text(baggedStripe.size(), 20, 10);


  /*else{
   over=true;
   }*/
  /*
  void hit(Ball i, float speed, float angle, Ball b, float s2, float a2) {
   i.transferspeed(speed*2);
   i.transferangle(angle);
   //CHECK IF CLOSE TO EDGE{
   speed=speed/4;
   i.goforward();
   b.goforward();
   }
   
   
   ArrayList<ArrayList<Ball>> makeTouches(){
   ArrayList<ArrayList<Ball>> t = new ArrayList<ArrayList<Ball>>();
   for(int i=0;i<balls.size();i++){
   ArrayList<Ball> temp= new ArrayList<Ball>();
   temp.add(balls.get(i));
   t.add(temp);
   }
   for(int i=0;i<t.size();i++){
   addtouches(t.get(i));
   }
   for(int i=0;i<t.size();i++){
   if(t.get(i).size()<getmax(t)){
   while(t.get(i).size()<getmax(t)){
   t.get(i).set(t.get(i).size(),null);
   }
   }
   }
   return t;
   }
   
   ArrayList<Ball> addtouches(ArrayList<Ball> b){
   //ONLY IF MOVING
   
   for(int i=0;i<balls.size();i++){
   if(b.get(0).isTouching(balls.get(i))){
   b.add(balls.get(i));
   }
   }
   return b;
   }
   
   int getmax(ArrayList<ArrayList<Ball>> big){
   int temp=0;
   for(ArrayList<Ball> f:big){
   if(f.size()>temp){
   temp=f.size();
   }
   }
   return temp;
   }
  /*ArrayList<ArrayList<Ball>> fixduplicates(ArrayList<ArrayList<Ball>> big){
   for(int i=0;i<big.size();i++){
   if(big.get(i).size()<getmax(big)){
   while(big.get(i).size()<getmax(big)){
   big.get(i).set(big.get(i).size(),null);
   }
   }
   }
   for(int i=0;i<big.size();i++){
   for(int l=1;l<big.get(i).size();l++){
   Ball temp=big.get(i).get(0);
   for(ArrayList<Ball> ab:big){
   for(int i=1;i<ab.size();i++){
   Ball temp=ab.get(i)
   
   }
   }*/
}
