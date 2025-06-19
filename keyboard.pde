void keyPressed() {
  if (key == 'w' || key == 'W') wKey = true;
  if (key == 's' || key == 'S') sKey = true;
  if (keyCode == UP) upKey = true;
  if (keyCode == DOWN) downKey = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') wKey = false;
  if (key == 's' || key == 'S') sKey = false;
  if (keyCode == UP) upKey = false;
  if (keyCode == DOWN) downKey = false;
}
