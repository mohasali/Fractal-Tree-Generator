int totalBranches = 1;
float branchAngle = PI*0/360;
float size;
color strokeColor;
float circleX=0;
boolean pressed = false;

void setup() {
  size(800, 800);
  strokeWeight(4);
}

void draw() {
  background(255);
  stroke(0);
  slider();
  button(500,700,color(255,145,0));
  button(300,700,color(255,0,0));
  branchTree(400, 500, 150, -HALF_PI, totalBranches);
  
}

void mousePressed() {
      if(mouseY > 585 && mouseY < 615 ){
      pressed = true;
    }
    else if(mouseX > 430 && mouseX < 570 && mouseY > 670 && mouseY < 730){
      strokeColor = color(random(255),random(255),random(255));
    }
    else if(mouseX > 230 && mouseX < 370 && mouseY > 670 && mouseY < 730){
      totalBranches = 1;
    }
    else{
        totalBranches++;

    }
  
}
void mouseReleased(){
  pressed = false;
}


void slider(){
  fill(200);
  rect(400,600,800,30);
  fill(255);
  circle(circleX,600,30);
  if(pressed){
      circleX = mouseX;
      if(circleX>800){circleX=800;}
      if(circleX<0){circleX=0;}
  }
  branchAngle = PI*(circleX/800);

}

void button(int x,int y,color c){
  rectMode(CENTER);
  fill(c);
  rect(x,y,70,30);
}

void branchTree(float x, float y, float branchLength, float angle, int depth) {
  if (depth == 0) {
    return;
  }

  float x2 = x + cos(angle) * branchLength;
  float y2 = y + sin(angle) * branchLength;
  stroke(strokeColor);
  line(x, y, x2, y2);

  float leftAngle = angle - branchAngle;
  float rightAngle = angle + branchAngle;

  branchTree(x2, y2, branchLength * 0.7, leftAngle, depth - 1);
  branchTree(x2, y2, branchLength * 0.7, rightAngle, depth - 1);
}
