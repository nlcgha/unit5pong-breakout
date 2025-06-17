void resetGame() {
  pr = 100;
  ly = height/2;
  ry = height/2;
  bxpos = width/2;
  bypos = height/2;
  br = 20;
  bvx = hardMode ? 7 : 5;
  if (random(1) < 0.5) bvx = -bvx;
  bvy = hardMode ? 6 : 4;
  if (random(1) < 0.5) bvy = -bvy;
  ls = 0;
  rs = 0;
}

void resetBall() {
  bxpos = width/2;
  bypos = height/2;
}
