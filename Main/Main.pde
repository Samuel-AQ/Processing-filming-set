/**
 * @Author: Samuel Arrocha Quevedo
 * @Version: 
 */

//TODO:
//help screen
//element shaper
//fps mode
//not fps mode
//search shapes
//lights

boolean showHelp, showTitle, fpsMode;
String pressedKey;
float viewZoom, xRotation, yRotation;
FilmingSet set;


void setup() {
  size(800, 800, P3D);
  showTitle = false;
  showHelp = false;
  fpsMode = false;
  viewZoom = 0;
  xRotation = 0;
  yRotation = 0;
  set = new FilmingSet();

  createSet();
}

void createSet() {
  // Walls
  PShape wall = createShape(RECT, 0, 0, 200, 200);  

  SetElement verticalWall = new SetElement("Vertical wall", 0, 0, 0, 0, 0, wall);
  SetElement horizontalWall = new SetElement("Horizontal wall", 0, 0, 0, 0, 0, wall);

  set.addElement(verticalWall);
  set.addElement(horizontalWall);

  // Elements
  PShape treeShape = loadShape("../data/shapes/tree/lowpolytree.obj");

  SetElement tree = new SetElement("Tree", 0, 0, 0, 0, 0, treeShape);

  set.addElement(tree);
}

void draw() {
  background(0);
  if (showTitle) showTitleScreen();
  if (!showTitle && showHelp) showHelpScreen();
  if (!showTitle && !showHelp) {
    if (!fpsMode) {
      rotateY(radians(mouseX));
    } else {
    }
    setWalls();

    //shape(set.getElement("Tree"), 0, 0, 200, 200);
  }
}

void setWalls() {
  shape(set.getElement("Vertical wall"), width / 2, height / 2, 700, 600);
  pushMatrix();
  //translate(width / 2, height / 2);
  //rotateX(degrees(30));
  shape(set.getElement("Horizontal wall"), width / 2, height / 2, 700, 600);
  popMatrix();
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
