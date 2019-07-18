int ob1 =50;
void setup(){
  size(600, 600);
}

void draw(){
  background(232, 171, 37);
  rect(270, 300, 50, 50);
  rect(34, ob1, 34, 67);
}
void keyPressed(){
  if (key==CODED) {
    if (keyCode == UP){
      camUP();
    }
    if (keyCode == DOWN){
      camDOWN();
    }
    if (keyCode == RIGHT){
      camRIGHT();
    }
  }
}

void camUP(){
ob1 = ob1+50;
}
void camDOWN(){
ob1 = ob1-50;
}
void camRIGHT(){
ob1 = ob1-50;
}
void camLEFT(){
ob1 = ob1-50;
}