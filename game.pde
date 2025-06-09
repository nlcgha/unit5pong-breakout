void game() {
  background(0);

  circle(leftx, lefty, leftd);
  circle(rightx, righty, rightd);

  circle(ballx, bally, balld);

  if (wKey==true) lefty = lefty +5;
  if (sKey==true) lefty = lefty -5;
  if (upKey==true) righty = righty -5;
  if (downKey==true) righty = righty +5;
}

void gameClicks() {
}
