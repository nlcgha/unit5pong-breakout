//pong
//Nik Leung
//3-4
//6/9/2025
int mode;
final int INTRO=0, GAME=1, PAUSE=2, GAMEOVER=3;
boolean aiEnabled=false, hardMode=false;

// Title animation
float tx, ty, tdx=4, tdy=3;
boolean titleColorToggle=false;
int titleFlashCounter=0;

// Buttons
float bx1=150, by1=350, bx2=150, by2=420;
float bx3=450, by3=350, bx4=450, by4=420, bw=200, bh=50;

// Paddles & Ball
float ly, ry, pr, bxpos, bypos, br;
float bvx, bvy;
int ls, rs;
int delayCounter=0;
color winColor;

void setup() {
  size(800, 600);
  mode = INTRO;
  tx = width/2;
  ty = height/2;
  resetGame();
}

void draw() {
  drawGradient();
  drawCenterLine();
  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == PAUSE) pause();
  else if (mode == GAMEOVER) gameOver();
  else println("eorrorrororor");
}

void drawGradient() {
  for (int y=0; y<height; y++) {
    float t = float(y)/(height-1);
    color c;
    if (t < 0.5) {
      float u = t/0.5;
      c = lerpColor(color(0, 0, 255), color(255, 0, 255), u);
    } else {
      float u = (t-0.5)/0.5;
      c = lerpColor(color(255, 0, 255), color(128, 0, 128), u);
    }
    stroke(c);
    line(0, y, width, y);
  }
  noStroke();
}

void drawCenterLine() {
  stroke(255);
  strokeWeight(2);
  line(width/2, 0, width/2, height);
  noStroke();
}

void drawPauseSymbol() {
  fill(255);
  textAlign(CENTER);
  textSize(32);
  float px = width/2, py = height/2;
  rect(px-10, py-20, 8, 40);
  rect(px+2, py-20, 8, 40);
}
