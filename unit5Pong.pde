//pong
//Nik Leung
//3-4
//6/9/2025

int mode;
final int INTRO =1;
final int GAME =2;
final int PAUSE=3;
final int GAMEOVER=4;

//paddles
float leftx, lefty, leftd, rightx, righty, rightd;
//ball
float ballx, bally, balld;

boolean wKey, sKey, upKey, downKey;

void setup() {
  size(800, 600);
  mode=GAME;

  leftx=0;
  lefty=height/2;
  leftd=200;

  rightx=width;
  righty =height/2;
  rightd=200;

  ballx =width/2;
  bally=height/2;
  balld=100;
  
  wKey = sKey = upKey = downKey = false;
}

void draw() {
  if (mode==INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameOver();
  } else println("error no mode fix");
}
