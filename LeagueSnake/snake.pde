import java.util.ArrayList;
int foodX;
int foodY;
int foodCount = 0;
int foodtext = 410;
int direction = UP;
ArrayList<Segment> tail=new ArrayList<Segment>();
class Segment{
int X;
int Y;
Segment (int X, int Y){
  this.X = X;
  this.Y = Y;
}
}
Segment head = new Segment(10, 10);

void setup(){
  size(500,500);
  frameRate(15);
  dropFood();
}
void dropFood(){
  
    foodX = ((int)random(50)*10);
    foodY = ((int)random(50)*10);
}
  
void drawFood(){
  fill(255, 233, 0);
   rect(foodX, foodY, 10, 10);
}
   
void drawSnake(){
  fill(255, 0, 212);
   rect(head.X, head.Y, 10, 10);
   manageTail();
}
  
void draw(){
  background(0, 0, 0);
  fill(255,255,255);
  text("Food Eaten: "+foodCount, foodtext, 10);
  drawSnake();
  move();
  drawFood();
  eat();
  
  if(foodCount >= 10){
    foodtext = 400;
}
}
void keyPressed(){
  if (key == CODED) {
    if (keyCode == UP&&direction != DOWN) {
    direction = UP;
    
    }else if (keyCode == DOWN&&direction != UP) {
    direction = DOWN; 
    }
    else if (keyCode == LEFT&&direction !=RIGHT) {
    direction = LEFT; 
    }
    else if (keyCode == RIGHT&&direction !=LEFT) {
    direction = RIGHT; 
  }
  }
}
void move(){
  switch(direction) {
  case UP: 
   head.Y-=10;
   break;
  case DOWN:
   head.Y+=10;
    break;
  case LEFT:
   head.X-=10;
    break;
  case RIGHT:
   head.X+=10;
    break;

}
 checkBoundaries();
}
void checkBoundaries(){
 if(head.X >= 500){
   head.X = 0;
} else if(head.X <= 0){
 head.X = 500;
}
 if(head.Y >= 500){
   head.Y = 0;
}else if(head.Y <= 0){
 head.Y = 500;
}
}

void eat(){
 if(head.X == foodX&&head.Y == foodY){
  foodCount ++;
  dropFood();
   println(foodCount);
   //manageTail();
   tail.add(new Segment(head.X, head.Y));
   
 
}
}
void drawTail(){
for(int i = 0; i < tail.size(); i++){
rect(tail.get(i).X, tail.get(i).Y, 10, 10);
}
}

void manageTail(){
  checkTailCollision();
  drawTail();
  tail.add(new Segment(head.X, head.Y));
  tail.remove(0);
}

void checkTailCollision(){
for(int i = 0; i < tail.size(); i++){
  if(head.X == tail.get(i).X&&head.Y == tail.get(i).Y){
  foodCount = 1;
  tail=new ArrayList<Segment>();
  tail.add(new Segment(head.X, head.Y));
  
}
}

}