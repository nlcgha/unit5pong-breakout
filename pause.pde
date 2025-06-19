void pause() {
  drawPauseSymbol();
  fill(100);
  rect(width/2 - 100, height - 100, 200, 50);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("RETURN TO MENU", width/2, height - 75);
}

void pauseClicks() {
  if (mouseX > width/2 - 100 && mouseX < width/2 + 100 &&
    mouseY > height - 100 && mouseY < height - 50) {
    clickSound.rewind();
    clickSound.play();
    mode = INTRO;
  } else {
    mode = GAME;
  }
}
