class Ball implements isCollideable {
  int counter;
  int x, y;
  //boolean isblack;
  int c1, c2, c3;
  float speed;
  float angle;
  boolean solid;
  int number;
  int collidenumber;
  int isrecent;
  //boolean in;


  Ball(int xx, int yy, int r, int g, int b, boolean s, int num, int cn) {
    counter=0;
    x=xx;
    y=yy;
    c1 = r;
    c2 = g;
    c3 = b;
    speed=0;
    angle=0;
    solid = s;
    number = num;
    collidenumber = cn;
    isrecent = 0;

    /*if(c1==0  && c2==0 && c3==0){
     isblack=true;
     }
     else{
     isblack=false;
     }*/
    //INSTANCE VARIABLES
  }
  Ball() {
  }

  int getx() {
    return x;
  }
  int gety() {
    return y;
  }

  /*boolean isblack(){
   return isblack;
   }*/
  void setx(int n) {
    x=n;
  }
  void sety(int n) {
    y=n;
  }

  float getspeed() {
    return speed;
  }

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

  void display() {
    if (solid) {
      stroke(0, 0, 0);
      fill(c1, c2, c3);
      circle(x, y, 30);
      ellipseMode(CENTER);  // Set ellipseMode to CENTER
      fill(255);  // Set fill to white
      circle(x, y, 13);  // Draw white ellipse using CENTER mode
      fill(0, 0, 0);
      textSize(12);
      text(number, x-4, y+5);
    } else {
      stroke(0, 0, 0);
      fill(255, 255, 255);
      circle(x, y, 30);
      fill(c1, c2, c3);
      rect(x-12.5, y-7.5, 26, 15);
      stroke(c1, c2, c3);
      polygon(x-8.7, y+.4, 5.4, 20);
      polygon(x+8.9, y+.4, 5.4, 20);
      rect(x-12, y-5, 24, 10);
      fill(255, 255, 255);
      circle(x, y, 13);
      fill(0, 0, 0);
      textSize(12);
      text(number, x-4, y+5);
    }
   // text(collidenumber, x+20, y);
  }


  /*boolean isin(){
   return in;
   }*/
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

  void goin() {
    speed=0;
    balls.remove(this);
    if (solid) {
      baggedSolid.add(this);
    } else {
      baggedStripe.add(this);
    }
    //in=true;
  }

  boolean isTouching(Ball b) {
    return(x/60==b.getx()/60 && y/60==b.gety()/60);
  }


  boolean anytouches() {
    for (Ball b : balls) {
      if (this.isTouching(b)) {
        return true;
      }
    }
    return false;
  }

 /* void move() {
    ArrayList<Ball> touching;
    touching=checkTouch();
     if(touching.size()!=0){
     for(Ball i:touching){//make not have duplicate  hits
     hit(i,speed,angle);
     }
     }
    x+=cos((float)(Math.toRadians(angle)))*speed;
    y-=sin((float)(Math.toRadians(angle)))*speed;
    if (bounce()) {
      goforward();
    }
    if (x<80) {
      x=90;
    }
    if (x>1110) {
      x=1100;
    }
    if (y<68) {
      y=75;
    }
    if (y>565) {
      y=555;
    }
    if (speed>0) {
      speed-=.3;
      if (speed<0) {
        speed=0;
      }
    }
  }*/

void move() {
    ArrayList<Ball> touching;
    if (isrecent>0) {
      touching=null;
      isrecent++;
      if (isrecent>3) {
        isrecent=0;
      }
    }
    if (isrecent==0) {
      touching=checkTouch();
      if (touching.size()!=0) {
        for (Ball i : touching) {//make not have duplicate  hits
          float newangle = getAngle(i);
          hit(i, speed, newangle);
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
    if (speed>0) {
      speed-=.3;
      if (speed<0) {
        speed=0;
      }
    }
  }
  
  float getAngle(Ball t) {
    float angle = (float) Math.toDegrees(Math.atan2(t.gety() - y, t.getx() - x));

    if (angle < 0) {
      angle += 360;
    }

    return angle;
  }

  void hit(Ball i, float speed, float angle) {
    i.transferspeed(speed/5);
    i.transferangle(angle);
    i.goforward();
    //speed-=speed/5;
    angle+=180;
  }


  ArrayList<Ball> checkTouch() {
    ArrayList<Ball> temp= new ArrayList<Ball>();
    for (int x = collidenumber; x < balls.size(); x++ ) {
      if (isTouching(balls.get(x))) {
        temp.add(balls.get(x));
      }
    }
    
    String listString = "";
    for (Ball b : temp)
    {
      listString += b.collidenumber + "\t";
    }
    textSize(15);
    fill(255,0,0);
    text(listString, x+20, y+10);
    
    return temp;
  }

  void goforward() {
    for (int i=0; i<0; i++) {
      x+=cos((float)(angle))*speed;
      y-=sin((float)(angle))*speed;
    }
  }

  boolean transferspeed(float power) {
    speed+=power/2;
    return true;
  }
  boolean transferangle(float ang) {
    angle = ang;
    return true;
  }
}
