class WhiteBall extends Ball {
  int x, y;
  int c1, c2, c3;
  float speed;
  float angle;
  boolean in;
  int counter;
  int isrecent;


  WhiteBall(int xx, int yy, int r, int g, int b) {
    counter=0;
    x=xx;
    y=yy;
    c1 = r;
    c2 = g;
    c3 = b;
    speed=0;
    angle=0;
    in = false;
    isrecent=0;
    //INSTANCE VARIABLES
  }
  
  int getX(){
    return x;
  }
  
  int getY(){
    return y;
  }
  void infalse(){
    in=false;
  }
  void setIn(boolean b) {
    in = b;
    //tint(255,0);
    replace();
  }
  boolean getIn(){
    return in;
  }
  
  void replace() {
    fill(255, 255, 255);
    circle(mouseX, mouseY, 30);
    
    //mouseClicked();
    //in=false;
    
  }

  boolean transferspeed(float power) {
    speed+=power/4;
    return true;
  }

  boolean transferangle(float ang) {
    angle = ang;
    return true;
  }
  
  boolean isTouching(Ball b){
    return(x/60==b.getx()/60 && y/60==b.gety()/60);
  }
  boolean bounce() {
    if (x<85) {
      if ((y<88 && angle>90 && angle<180) || (y>559 && angle>180 && angle<270)) {
        goin();
      } else {
        angle=180-angle;
      }
      return true;
    }
    if (x>1105) {
      if ((y<88) || (y>559)) {
        goin();
      } else {
        angle=180-angle;
        //angle=(int)(Math.random()*180)+90;
        //CODE INSPIRED BY KAITLYN DUONG^^^^
      }
      return true;
    }
    if (y<72) {
      if (x>578 && x<618) {
        goin();
      } else {
        angle=360-angle;
      }
      return true;
    }
    if (y>560) {
      if (x>578 && x<618) {
        goin();
      } else {
        angle=360-angle;
      }
      return true;
    }
    return false;
  }


  void move() {
    ArrayList<Ball> touching;
    if(isrecent>0){
      touching=null;
      isrecent++;
      if(isrecent>3){
        isrecent=0;
    }
    }
    if(isrecent==0){
    touching=checkTouch();
    if(touching.size()!=0){
      for(Ball i:touching){//make not have duplicate  hits
        float newangle = getAngle(i);
        hit(i,speed,newangle);
        angle=((newangle-180)+angle)/2;//FIXX
        angle=angle%360;
        i.goforward();
        goforward();
        isrecent=1;
      }
    }
    }
   

    x+=cos((float)(Math.toRadians(angle)))*speed;
    y-=sin((float)(Math.toRadians(angle)))*speed;
    if (bounce()) {
      for (int i=0; i<3; i++) {
        x+=cos((float)(Math.toRadians(angle)))*speed;
        y-=sin((float)(Math.toRadians(angle)))*speed;
      }
    }
     if(broken==false){
        for(Ball b:balls){
          b.setx((int)random(800)+100);
          b.sety((int)random(500)+100);
      }
      broken=true;
    }
   if(speed>0){
      speed-=.3;
      if(speed<0){
        speed=0;
    }
   }
    


  }
    ArrayList<Ball> checkTouch(){
    ArrayList<Ball> temp= new ArrayList<Ball>();
    for(Ball b:balls){
      if(isTouching(b)){
        temp.add(b);
      }
    }
    return temp;
  }
  
  float getspeed(){
    return speed;
  }
   
  void hit(Ball i,float speed, float angle){
      i.transferspeed(speed*2);
      i.transferangle(angle);
      //CHECK IF CLOSE TO EDGE{
      speed=speed/4;
      
 }
 
 
 float getAngle(Ball t) {
    float angle = (float) Math.toDegrees(Math.atan2(t.gety() - y, t.getx() - x));

    if(angle < 0){
        angle += 360;
    }

    return angle;
}
  void goin() {
    speed=0;
    angle=0;
    game.removeBall(this);
  }
 
  
  void display() {
    fill(c1, c2, c3);
    circle(x, y, 30);
    text(speed,x,y);
    text(angle,x+10,y-20);
  }
}
