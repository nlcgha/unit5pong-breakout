void game() {
  if (delayCounter>0) { pause(); delayCounter--; if (delayCounter == 0) mode = GAME; return; }

  // Move paddles
  if (keyPressed && (key=='w'||key=='W')) ly -= 5;
  if (keyPressed && (key=='s'||key=='S')) ly += 5;
  if (!aiEnabled) {
    if (keyPressed && keyCode==UP) ry -= 5;
    if (keyPressed && keyCode==DOWN) ry += 5;
  } else {
    ry += (bypos - ry) * 0.05;
  }
  ly = constrain(ly, pr, height-pr);
  ry = constrain(ry, pr, height-pr);

  // Ball movement
  bxpos += bvx;
  bypos += bvy;
  if (bypos<br || bypos>height-br) bvy = -bvy;

  // Collision left
  float d = dist(bxpos, bypos, 0, ly);
  if (d <= br + pr && bxpos - br <= pr) {
    float dx = bxpos - 0;
    float dy = bypos - ly;
    bvx = dx;
    bvy = dy;
  }
  // Collision right
  d = dist(bxpos, bypos, width, ry);
  if (d <= br + pr && bxpos + br >= width - pr) {
    float dx = bxpos - width;
    float dy = bypos - ry;
    bvx = dx;
    bvy = dy;
  }

  // Score
  if (bxpos<0) { rs++; resetBall(); mode = PAUSE; delayCounter = 60; }
  if (bxpos>width) { ls++; resetBall(); mode = PAUSE; delayCounter = 60; }
  if (ls>=5 || rs>=5) { winColor = (ls>=5 ? color(255) : color(0)); mode = GAMEOVER; }

  // Hard scaling
  if (hardMode && frameCount%300==0) {
    pr -= 10; if (pr < 20) pr = 20;
    br -= 5; if (br < 5) br = 5;
    bvx *= 1.1;
    bvy *= 1.1;
  }

  // Draw paddles
  stroke(0); strokeWeight(2); fill(255);
  circle(0, ly, pr*2);
  stroke(255); strokeWeight(2); fill(0);
  circle(width, ry, pr*2);
  noStroke();

  // Draw ball
  fill(255); circle(bxpos, bypos, br*2);

  // Draw score
  fill(255); textAlign(CENTER); textSize(32);
  text(ls+" - "+rs, width/2, 40);
}

void gameClicks() { mode = PAUSE; }
