import processing.sound.*;

PImage pacman = new PImage();
PImage map = new PImage();
PImage ghost1 = new PImage();
PImage ghost2 = new PImage();
PImage ghost3 = new PImage();
PImage gameover = new PImage();
PImage circle = new PImage();

int[][] arr = new int[600][600];

int x = 0;
//Starting positions of pacman and the ghosts
int pacX = 20;
int pacY = 275;
int pacSpeedY = 0;
int pacSpeedX = -15;
int startY, endY, startX, endX;
int ghost1X= 300;
int ghost1Y= 300;
int ghost2X= 300;
int ghost2Y= 300;
int ghost3X= 300;
int ghost3Y= 300;
int ghostSpeedX = -15;
int score =0;

SoundFile sound;

boolean checkMovement(char key) {
  boolean checkMove = true;

  //Different hitboxes for different keys pressed
  //(to make sure boolean checkMove does not stay false and the pac man can move)
  if (key == 'd') {
    startY = pacY+10;
    endY = pacY+15;
    startX = pacX+35;
    endX = pacX+40;
  }

  if (key == 'w') {
    startY = pacY-10;
    endY = pacY-5;
    startX = pacX+10;
    endX = pacX+15;
  }

  if (key == 'a') {
    startY = pacY+10;
    endY = pacY+15;
    startX = pacX-10;
    endX = pacX-5;
  }

  if (key == 's') {
    startY = pacY+35;
    endY = pacY+40;
    startX = pacX+15;
    endX = pacX+20;
  }
  for (int py = startY; py <  endY; py++) {
    for (int px = startX; px < endX; px++) {
      int loc = px + py*width;
      
      //Another way of checking color for collision
      //The functions red(), green(), and blue() pull out the 3 color components from a pixel.
      //float r = red(pixels[loc]);
      //float g = green(pixels[loc]);
      //float b = blue(pixels[loc]);

      //current issue is that this code doesn't allow the pacman to move
      //when there is a pellet in the way
      color currentCol = get(px, py);
      color wallCol = get(0, 0);
      //detect collision
      if (currentCol != wallCol) {
        checkMove = false;
      }

      // Creates the checking pixel
      pixels[loc] =  color(0, 255, 0);
    }
  }
  updatePixels();
  return checkMove;
}

void setup() {
  size(600, 720);
  pacman = loadImage( "carl.jpg" );
  pacman.resize(30, 30);
  map = loadImage( "map1.png" );
  ghost1 = loadImage("laptop.png");
  ghost1.resize(50, 50);
  ghost2 = loadImage("laptop.png");
  ghost2.resize(50, 50);
  ghost3 = loadImage("laptop.png");
  ghost3.resize(50, 50);
  gameover = loadImage("gameover.png");
  gameover.resize(600, 720);
  circle = loadImage("circle.png");
  circle.resize(5, 5);
  frameRate(13);

  sound = new SoundFile(this, "background.wav");
  sound.amp(0.7);
  sound.loop();

  for (int i=1; i<600; i+=45) {
    for (int j=1; j<600; j+=45) {
      arr[i][j] = 0;
    }
  }
}

void draw() {

  background(0);
  textSize(80);
  text("Score: " + score, 50, 700);

  image(map, x, 0);

  //placing the food pellets
  for (int i=1; i<600; i+=45) {
    for (int j=1; j<600; j+=45) {
      if (map.get(i, j)==color(0, 0, 0)) {
        arr[i][j] = 1;
        fill(255, 255, 0);
        ellipse(i, j, 10, 10);
      }
    }
  }

  //eat pellets and track score
  //not fully working
  for (int x = pacX-10; x < pacX+10; x++) {
    for (int y = pacY-10; y < pacY+10; y++) {
      if (arr[x][y] == 1) {
        score++;
        arr[x][y] = 0;
        fill(255, 0, 0);
        ellipse(x, y, 10, 10);
      }
    }
  }

  image(pacman, pacX, pacY);
  image(ghost1, ghost1X, ghost1Y);
  image(ghost2, ghost2X, ghost2Y);
  image(ghost3, ghost3X, ghost3Y);
  loadPixels();

  // Continuous movement when pressed
  if (keyPressed == true) {
    
    if (keyCode == UP || key == 'w') {
      key = 'w';
      boolean check = checkMovement(key);
      if (check) pacY += -10;
    }
    if (keyCode == DOWN || key == 's') {
      key = 's';
      boolean check = checkMovement(key);
      if (check)pacY += 10;
    }
    if (keyCode == LEFT || key == 'a') {
      key = 'a';
      boolean check = checkMovement(key);
      if (check) pacX += -10;
      //check to make sure the pacman doesn't go out of canvas
      if (pacX < 0) pacX = 20;
    }
    if (keyCode == RIGHT || key == 'd') {
      key = 'd';
      boolean check = checkMovement(key);
      if (check) pacX += 10;
      //check to make sure the pacman doesn't go out of canvas      
      if (pacX > 550) pacX = 550;
    }
  }


  //creating random movement for the ghost1
  int rand1 = int(random(0, 1000));
  if (rand1<250) {
    boolean checkMove = checkMovementGhost('w', ghost1X, ghost1Y, ghostSpeedX);
    if (checkMove) ghost1Y += -10;
  } else if (rand1>250 && rand1 <500) {
    boolean checkMove = checkMovementGhost('d', ghost1X, ghost1Y, ghostSpeedX);
    if (checkMove) ghost1X += +10;
  } else if (rand1>500 && rand1 <750) {
    boolean checkMove = checkMovementGhost('a', ghost1X, ghost1Y, ghostSpeedX);
    if (checkMove) ghost1X += -10;
  } else if (rand1>750 && rand1 <1000) {
    boolean checkMove = checkMovementGhost('s', ghost1X, ghost1Y, ghostSpeedX);
    if (checkMove) ghost1X += +10;
  }

  //creating random movement for the ghost2
  int rand2 = int(random(0, 1000));
  if (rand2<250) {
    boolean checkMove = checkMovementGhost('w', ghost2X, ghost2Y, ghostSpeedX);
    if (checkMove) ghost2Y += -20;
  } else if (rand2>250 && rand2 <500) {
    boolean checkMove = checkMovementGhost('z', ghost2X, ghost2Y, ghostSpeedX);
    if (checkMove) ghost2Y += +20;
  } else if (rand2>500 && rand2 <750) {
    boolean checkMove = checkMovementGhost('a', ghost2X, ghost2Y, ghostSpeedX);
    if (checkMove) ghost2X += -20;
  } else if (rand2>750 && rand2 <1000) {
    boolean checkMove = checkMovementGhost('s', ghost2X, ghost2Y, ghostSpeedX);
    if (checkMove) ghost2X += +20;
  }

  //creating random movement for the ghost3
  int rand3 = int(random(0, 1000));
  if (rand3<250) {
    boolean checkMove = checkMovementGhost('w', ghost3X, ghost3Y, ghostSpeedX);
    if (checkMove) ghost3Y += -20;
  } else if (rand3>250 && rand3 <500) {
    boolean checkMove = checkMovementGhost('z', ghost3X, ghost3Y, ghostSpeedX);
    if (checkMove) ghost3Y += +20;
  } else if (rand3>500 && rand3 <750) {
    boolean checkMove = checkMovementGhost('a', ghost3X, ghost3Y, ghostSpeedX);
    if (checkMove) ghost3X += -20;
  } else if (rand3>750 && rand3 <1000) {
    boolean checkMove = checkMovementGhost('s', ghost3X, ghost3Y, ghostSpeedX);
    if (checkMove) ghost3X += +20;
  }


  //game over if overlapping with a ghost
  if (abs(ghost1X-pacX)<30 && abs(pacY-ghost1Y)<30
    ||abs(ghost2X-pacX)<30 && abs(pacY-ghost2Y)<30
    ||abs(ghost3X-pacX)<30 && abs(pacY-ghost3Y)<30) {
    image(gameover, 0, 0, 600, 720);
    noLoop();
  }
}
