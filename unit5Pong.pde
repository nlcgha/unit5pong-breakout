//pong
//Nik Leung
//3-4
//6/9/2025

import ddf.minim.*;

//boolsnvars
int mode;
final int INTRO=0, GAME=1, PAUSE=2, GAMEOVER=3;
boolean aiEnabled=false, hardMode=false;

//titleanim
float tx, ty, tdx=4, tdy=3;
boolean titleColorToggle=false;
int titleFlashCounter=0;

//buttons
float bx1=150, by1=350, bx2=150, by2=420;
float bx3=450, by3=350, bx4=450, by4=420, bw=200, bh=50;
float speed;

//paddlesnball
float ly, ry, pr, bxpos, bypos, br;
float bvx, bvy;
int ls, rs;
int delayCounter=0;
boolean waitingAfterScore = false;
color winColor;

//paddlemvmt
boolean wKey = false;
boolean sKey = false;
boolean upKey = false;
boolean downKey = false;

Minim minim;
AudioPlayer bounceSound, clickSound;

void setup() {
  size(800, 600);
  minim = new Minim(this);
  bounceSound = minim.loadFile("bounce.mp3", 2048);
  clickSound  = minim.loadFile("click.mp3", 2048);
  mode = INTRO;
  tx = width/2;
  ty = height/2;
  resetGame();
}

void draw() {
  //setup
  drawBnW();
  drawCenterLine();
  //modeframework
  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == PAUSE) pause();
  else if (mode == GAMEOVER) gameOver();
  else println("uhaveerror");
}

//drawingfuncts
void drawBnW() {
  noStroke();
  fill(0);
  rect(0, 0, width/2, height);
  fill(255);
  rect(width/2, 0, width/2, height);
}

void drawCenterLine() {
  stroke(255);
  strokeWeight(3);
  line(width/2, 0, width/2, height);
  noStroke();
}

void drawPauseSymbol() {
  fill(255);
  textAlign(CENTER);
  textSize(32);
  float px = width/2, py = height/2;
  rect(px-10, py-20, 8, 40);
  fill(0);
  rect(px+2, py-20, 8, 40);
}
