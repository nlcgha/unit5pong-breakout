void gameOver() {
  background(winColor);
  fill(winColor == color(255) ? 0 : 255);
  textAlign(CENTER); textSize(32);
  if (ls>=5) text("LEFT WINS", width/2, height/2 - 20);
  else text("RIGHT WINS", width/2, height/2 - 20);
  textSize(24); text("Click to return to menu", width/2, height/2 + 20);
}

void gameOverClicks() {
  resetGame();
  mode = INTRO;
}
