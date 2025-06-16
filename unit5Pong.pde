//pong
//Nik Leung
//3-4
//6/9/2025
float introX, introY;
float introVX = 4;
float introVY = 3;
float introTextSize = 64;

float button1X = 300;
float button1Y = 460;
float button2X = 300;
float button2Y = 530;
float buttonW = 200;
float buttonH = 50;

int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

boolean isSinglePlayer = false;

float leftx, lefty, leftd;
float rightx, righty, rightd;
float ballx, bally, balld;
float ballVX = 5;
float ballVY = 4;

float[] trailX = new float[30];
float[] trailY = new float[30];
int trailLength = 0;

boolean wKey, sKey, upKey, downKey;

int leftScore = 0;
int rightScore = 0;
color winColor;
boolean gameEnded = false;

void setup() {
  size(800, 600);
  mode = INTRO;
  leftx = 0;
  lefty = height/2;
  leftd = 200;
  rightx = width;
  righty = height/2;
  rightd = 200;
  ballx = width/2;
  bally = height/2;
  balld = 20;
  introX = width/2;
  introY = height/2;
  wKey = sKey = upKey = downKey = false;
}

void draw() {
  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == PAUSE) pause();
  else if (mode == GAMEOVER) gameOver();
  else println("errorrrrrrr");
}
