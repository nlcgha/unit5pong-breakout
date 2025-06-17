void intro() {
  // Flashing title
  if (titleFlashCounter == 0) {
    titleColorToggle = !titleColorToggle;
    titleFlashCounter = 30;
  }
  titleFlashCounter--;
  fill(titleColorToggle ? 255 : 0);
  textSize(64);
  float tw = textWidth("PONG");
  tx += tdx; ty += tdy;
  if (tx < 0 || tx + tw > width) tdx = -tdx;
  if (ty < 0 || ty + 64 > height) tdy = -tdy;
  textAlign(LEFT, TOP);
  text("PONG", tx, ty);

  // Buttons
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
    aiEnabled = true; hardMode = false; start();
  } else if (mouseX>bx2 && mouseX<bx2+bw && mouseY>by2 && mouseY<by2+bh) {
    aiEnabled = true; hardMode = true; start();
  } else if (mouseX>bx3 && mouseX<bx3+bw && mouseY>by3 && mouseY<by3+bh) {
    aiEnabled = false; hardMode = false; start();
  } else if (mouseX>bx4 && mouseX<bx4+bw && mouseY>by4 && mouseY<by4+bh) {
    aiEnabled = false; hardMode = true; start();
  }
}
