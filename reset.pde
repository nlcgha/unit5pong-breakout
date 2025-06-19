void resetGame() {
  pr = 100;
  ly = height/2;
  ry = height/2;
  resetBall();
  br = 20;
  ls = 0;
  rs = 0;
  delayCounter = 0;
  waitingAfterScore = false;
}

void resetBall() {
  bxpos = width / 2;
  bypos = height / 2;

  if (hardMode) {
    speed = 6.0;
  } else {
    speed = 4.0;
  }

  if (random(1) < 0.5) {
    bvx = speed * 2;
  } else {
    bvx = -speed * 2;
  }

  if (random(1) < 0.5) {
    bvy = speed;
  } else {
    bvy = -speed;
  }
}
