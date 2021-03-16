/**
 * @Author: Samuel Arrocha Quevedo
 * @Version: 
 */
 
 //TODO:
//title screen
//help screen
//element shaper
//fps mode
//not fps mode
//search shapes
//lights

boolean showHelp, showTitle, fpsMode;
String pressedKey;
float viewZoom;
FilmingSet set;

void setup() {
  size(800, 800, P3D);
  showTitle = true;
  showHelp = false;
  fpsMode = false;
  viewZoom = 0;

  createSet();
}

void createSet() {
  
}

void draw() {
  if (showTitle) showTitleScreen();
  if (!showTitle && showHelp) {
    showHelpScreen();
  } else {
    if (!fpsMode) {
    } else {
    }
  }
}

void showHelpScreen() {
}

void showTitleScreen() {
  color black = color(0);
  int imageWidth = 550, imageHeight = 400;
  String title = "Bienvenido a esta simulación\n de set de rodaje";
  String info = "Pulse 'enter' para comenzar";
  PImage systemImage = loadImage("../data/images/title-image.png");
  background(black);
  textAlign(CENTER);
  textSize(50);
  text(title, width / 2, height * 0.1);
  image(systemImage, width * 0.16, height * 0.25, imageWidth, imageHeight);
  textSize(40);
  text(info, width / 2, height * 0.9);
}

void checkKey() {
  switch(pressedKey) {
  case "w":
    break;
  case "d":
    break;
  case "s":
    break;
  case "a":
    break;
  case "e":
    break;
  case "q":
    break;
  case "up":
    break;
  case "right":
    break;
  case "down":
    break;
  case "left":
    break;
  }
}

void keyPressed() {
  if (keyCode == ENTER) showTitle = false;

  if (keyCode == 'C' || keyCode == 'c') fpsMode = !fpsMode;

  if (keyCode == 'R' || keyCode == 'r') {
    camera();
    setup();
  } 

  if (keyCode == 'i' || keyCode == 'I') showHelp = !showHelp;

  // Camera controls
  if (keyCode == 'w' || keyCode == 'W') pressedKey = "w";
  if (keyCode == 'd' || keyCode == 'D') pressedKey = "d";
  if (keyCode == 's' || keyCode == 'S') pressedKey = "s";
  if (keyCode == 'a' || keyCode == 'A') pressedKey = "a";
  if (keyCode == 'e' || keyCode == 'E') pressedKey = "e";
  if (keyCode == 'q' || keyCode == 'Q') pressedKey = "q";
  if (keyCode == UP) pressedKey = "up";
  if (keyCode == DOWN) pressedKey = "down";
  if (keyCode == LEFT) pressedKey = "right";
  if (keyCode == RIGHT) pressedKey = "left";
}

void keyReleased() {
  boolean someCameraKeyIsReleased = keyCode == 'w' || keyCode == 'W' ||
    keyCode == 'd' || keyCode == 'D' ||
    keyCode == 's' || keyCode == 'S' ||
    keyCode == 'a' || keyCode == 'A' ||
    keyCode == 'e' || keyCode == 'E' ||
    keyCode == 'q' || keyCode == 'Q' ||
    keyCode == UP || keyCode == DOWN ||
    keyCode == LEFT || keyCode == RIGHT;

  if (someCameraKeyIsReleased) pressedKey = "";
}

void mouseWheel(MouseEvent event) {
  if (!fpsMode) viewZoom -= event.getCount() * 50;
}
