void intro() {
  if (titleFlashCounter == 0) {
    titleColorToggle = !titleColorToggle;
    titleFlashCounter = 30;
  }
  titleFlashCounter--;
  fill(titleColorToggle ? 255 : 0);
  textSize(64);
  float tw = textWidth("PONG");
  //movement
  tx += tdx;
  ty += tdy;
  //bouncing
  if (tx < 0 || tx + tw > width) {
    tdx = -tdx;
    clickSound.rewind();
    clickSound.play();
  }
  if (ty < 0 || ty + 64 > height) {
    tdy = -tdy;
    clickSound.rewind();
    clickSound.play();
  }
  textAlign(LEFT, TOP);
  text("PONG", tx, ty);

  textAlign(CENTER, CENTER);
  textSize(20);

  fill(100);
  rect(bx1, by1, bw, bh);
  fill(255);
  text("1P EASY", bx1 + bw/2, by1 + bh/2);

  fill(100);
  rect(bx2, by2, bw, bh);
  fill(255);
  text("1P HARD", bx2 + bw/2, by2 + bh/2);

  fill(100);
  rect(bx3, by3, bw, bh);
  fill(255);
  text("2P EASY", bx3 + bw/2, by3 + bh/2);

  fill(100);
  rect(bx4, by4, bw, bh);
  fill(255);
  text("2P HARD", bx4 + bw/2, by4 + bh/2);
}

void introClicks() {
  if (mouseX>bx1 && mouseX<bx1+bw && mouseY>by1 && mouseY<by1+bh) {
    clickSound.rewind();
    clickSound.play();
    aiEnabled = true;
    hardMode = false;
    resetGame();
    mode = GAME;
  }
  if (mouseX>bx2 && mouseX<bx2+bw && mouseY>by2 && mouseY<by2+bh) {
    clickSound.rewind();
    clickSound.play();
    aiEnabled = true;
    hardMode = true;
    resetGame();
    mode = GAME;
  }
  if (mouseX>bx3 && mouseX<bx3+bw && mouseY>by3 && mouseY<by3+bh) {
    clickSound.rewind();
    clickSound.play();
    aiEnabled = false;
    hardMode = false;
    resetGame();
    mode = GAME;
  }
  if (mouseX>bx4 && mouseX<bx4+bw && mouseY>by4 && mouseY<by4+bh) {
    clickSound.rewind();
    clickSound.play();
    aiEnabled = false;
    hardMode = true;
    resetGame();
    mode = GAME;
  }
}
