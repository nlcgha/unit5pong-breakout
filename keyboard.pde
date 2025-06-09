void keyPressed() {
  if (key=='w'||key=='W') {
    sKey=true;
  }
  if (key=='s'||key=='S') {
    wKey=true;
  }
  if (keyCode==UP) upKey = true;
  if(keyCode==DOWN) downKey = true;
}

void keyReleased() {
    if (key=='w'||key=='W') {
    sKey=false;
  }
  if (key=='s'||key=='S') {
    wKey=false;
  }
    if (keyCode==UP) upKey = false;
  if(keyCode==DOWN) downKey = false;
}
