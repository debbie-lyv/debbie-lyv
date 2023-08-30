boolean checkMovementGhost(char key, int ghostX, int ghostY, int ghostSpeedX) {
  boolean checkMove = true;
  startY = ghostY-4;
  endY = ghostY-1;
  startX = ghostX+15;
  endX = ghostX+20;
  if (key == 'z') {
    startY = ghostY+32;
    endY = ghostY+35;
    startX = ghostX+15;
    endX = ghostX+20;
  }
  
  if (key == 'a') {
    startY = ghostY+10;
    endY = ghostY+12;
    startX = ghostX-5;
    endX = ghostX-2;
  }
  
  if (key == 's') {
    startY = ghostY+15;
    endY = ghostY+17;
    startX = ghostX+35;
    endX = ghostX+38;
  }
      for (int py = startY; py <  endY; py++) {
    for (int px = startX; px < endX; px++) {
      int loc = px + py*width;
      
      // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
      float r = red(pixels[loc]);
      float g = green(pixels[loc]);
      float b = blue(pixels[loc]);
      //detect collision with a black pixel
      if (!(r<= 20 &&  g <= 20 && b <= 20)) {
        ghostSpeedX = 0;
        checkMove = false;
    }      
      // Set the display pixel to the image pixel          
    }
  }
  updatePixels();
  return checkMove;
}
