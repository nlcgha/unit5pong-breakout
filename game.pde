void game() {
  if (waitingAfterScore) {
    delayCounter--;
    //drawscreen(countdown)
    stroke(0);
    strokeWeight(3);
    fill(255);
    circle(0, ly, pr*2);
    stroke(255);
    strokeWeight(3);
    fill(0);
    circle(width, ry, pr*2);
    noStroke();
    stroke(0);
    strokeWeight(3);
    fill(255);
    circle(bxpos, bypos, br*2);
    noStroke();
    fill(255, 0, 0);
    textAlign(CENTER);
    textSize(32);
    float count = delayCounter / 60.0;
    text(nf(count, 1, 2), width/2, height/2);
    if (delayCounter <= 0) waitingAfterScore = false;
  }

  //left paddle
  if (wKey) ly -= 5;
  if (sKey) ly += 5;
  //ai detect
  if (!aiEnabled) {
    //right paddle
    if (upKey) ry -= 5;
    if (downKey) ry += 5;
  } else {
    ry += (bypos - ry) * 0.05;
  }
  //stops from going out the screen
  ly = constrain(ly, pr, height-pr);
  ry = constrain(ry, pr, height-pr);

  //ball movement
  bxpos += bvx;
  bypos += bvy;
  //ball bounce
  if (bypos<br || bypos>height-br) {
    bvy = -bvy;
    bounceSound.rewind();
    bounceSound.play();
  }

  //paddle collision (L)
  float d = dist(bxpos, bypos, 0, ly);
  if (d <= br + pr && bxpos - br <= pr) {
    float dx = bxpos - 0;
    float dy = bypos - ly;
    float speed = sqrt(bvx * bvx + bvy * bvy);
    float mag = sqrt(dx * dx + dy * dy);
    if (mag > 0) {
      bvx = (dx / mag) * speed;
      bvy = (dy / mag) * speed;
      bounceSound.rewind();
      bounceSound.play();
    }
  }

  //paddle collision (R)
  d = dist(bxpos, bypos, width, ry);
  if (d <= br + pr && bxpos + br >= width - pr) {
    float dx = bxpos - width;
    float dy = bypos - ry;
    float speed = sqrt(bvx * bvx + bvy * bvy);
    float mag = sqrt(dx * dx + dy * dy);
    if (mag > 0) {
      bvx = (dx / mag) * speed;
      bvy = (dy / mag) * speed;
      bounceSound.rewind();
      bounceSound.play();
    }
  }

  //score (L)
  if (bxpos<0) {
    rs++;
    resetBall();
    delayCounter = 60;
    waitingAfterScore = true;
  }

  //score (R)
  if (bxpos>width) {
    ls++;
    resetBall();
    delayCounter = 60;
    waitingAfterScore = true;
  }

  //win detection
  if (ls>=5 || rs>=5) {
    winColor = (ls>=5 ? color(255) : color(0));
    mode = GAMEOVER;
  }

  //hard mode modifier
  if (hardMode && frameCount % 300 == 0) {
    pr = pr - 10;
    if (pr < 20) pr = 20;
    br = br - 5;
    if (br < 5) br = 5;
    float speed = sqrt(bvx * bvx + bvy * bvy);
    //speed increase
    float newSpeed = speed * 1.1;
    float mag = sqrt(bvx * bvx + bvy * bvy);
    if (mag > 0) {
      bvx = (bvx / mag) * newSpeed;
      bvy = (bvy / mag) * newSpeed;
    }
  }

  //setupscreen
  stroke(0);
  strokeWeight(3);
  fill(255);
  circle(0, ly, pr*2);
  stroke(255);
  strokeWeight(3);
  fill(0);
  circle(width, ry, pr*2);
  noStroke();
  stroke(0);
  strokeWeight(3);
  fill(255);
  circle(bxpos, bypos, br*2);
  noStroke();
  fill(255);
  textAlign(CENTER);
  textSize(32);
  text(ls+" - "+rs, width/2, 40);
}

void gameClicks() {
  mode = PAUSE;
}
