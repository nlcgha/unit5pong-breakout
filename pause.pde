void pause() {
  drawPauseSymbol();
    fill(255);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("paaaaaaused", width/2, height/2);
}

void pauseClicks() {
  mode = GAME;
}
