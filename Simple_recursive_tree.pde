/* Simple Tree made with
   Recursion by Alex Rosen */
   
int bgx = 255; // for bg colour

void setup() {
  stroke(0);
  smooth();
  frameRate(30);
  size(400, 400);
  background(0, 200, 192);
  colorMode(HSB, 360, 100, 100); 
}

void branch(int len, int x1, int y1, int x2) {
  /* recursiveLen is used to redefine
  len. branch(len) in a brach(len) gives
  an errror because the argument is
  defined as len. */
  int recursiveLen = len;
  int recursivex1 = x1;
  int recursivey1 = y1;
  int recursivex2 = x2;

  line(0, 0, 0, -len); // draws trunk
  translate(0, -len); // changes 0, -len to the coordinates of the bottom of the trunk

    if (len>4) { 
      /*pushes and pops are methods of
      adding or removing data from a stack*/
      push();
      rotate(PI/4); // PI/4 is the angle the new line is made off of relative to the previous line
      branch(int (recursiveLen*0.67), recursivex1, recursivey1, recursivex2);
      pop();
      push();
      rotate(-PI/4);
      branch(int (recursiveLen*0.67), recursivex1, recursivey1, recursivex2);
      pop();
    }
}

void draw() {
  bgx--;
  if(bgx==0)bgx=360;
  background(bgx, 255, 255); // changes bg colour
  
  textSize(32);
  text("epic recursive tree", width/8, height/4.5);
  fill(0, 102, 153, 51);
  
  translate(200, height);
  branch(100, 0, 0, 0);
  branch(-100, 400, 0, 0);
  
}
