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
  pressedKey = "";
  viewZoom = -1400;
  xRotation = 360;
  yRotation = 587;
  set = new FilmingSet();

  createSet();
}

void createSet() {
  // Set elements
  PShape verticalWallShape = createShape(BOX, 1000, 50, 1000);  
  PShape horizontalWallShape = createShape(BOX, 1000, 50, 1000);
  PShape baseGroundShape = createShape(BOX, 1500, 50, 2000);
  PShape treeShape = loadShape("../data/shapes/tree/10445_Oak_Tree_v1_max2010_iteration-1.obj");
  PShape catShape  = loadShape("../data/shapes/cat/12221_Cat_v1_l3.obj");
  PShape statueShape  = loadShape("../data/shapes/statue/12328_Statue_v1_L2.obj");
  PShape studioLightShape = loadShape("../data/shapes/studio_light/Obj/Streetlight_HighRes.obj");
  
  PImage groundTexture = loadImage("../data/textures/ground_texture.jpg");
  PImage forestTexture = loadImage("../data/textures/forest_texture.jpg");

  SetElement verticalWall = new SetElement("Vertical wall", 0, 0, 0, 0, 0, verticalWallShape, forestTexture);
  SetElement horizontalWall = new SetElement("Horizontal wall", 0, 0, 0, 0, 0, horizontalWallShape, groundTexture);
  SetElement baseGround = new SetElement("Base ground", 0, 0, 0, 0, 0, baseGroundShape);
  SetElement tree = new SetElement("Tree", 0, 0, 0, 0, 0, treeShape);
  SetElement cat = new SetElement("Cat", 0, 0, 0, 0, 0, catShape);
  SetElement statue = new SetElement("Statue", 0, 0, 0, 0, 0, statueShape);
  SetElement studioLight = new SetElement("Studio light", 0, 0, 0, 0, 0, studioLightShape);

  // Set creation
  set.addElement(verticalWall);
  set.addElement(horizontalWall);
  set.addElement(baseGround);
  set.addElement(tree);
  set.addElement(cat);
  set.addElement(statue);
  set.addElement(studioLight);
}

void draw() {
  background(0);
  if (showTitle) showTitleScreen();
  if (!showTitle && showHelp) showHelpScreen();
  if (!showTitle && !showHelp) {
    checkKey();
    if (!fpsMode) {
    } else {
      camera();
    }

    translate(width / 2 + 500, height * 0.4, viewZoom);
    rotateY(radians(yRotation));
    rotateX(radians(xRotation));
    setWalls();
    setElements();
  }
  println(mouseX + " " + mouseY);
}

void setWalls() {
  // GROUND
  pushMatrix();
  translate(width / 2 + 300, height * 0.65, -500);
  set.getElement("Base ground").setFill(color(50));
  shape(set.getElement("Base ground"), 0, 0, 2000, 10);
  popMatrix();
  
  // VERTICAL WALLS
  
  // Background
  pushMatrix();
  rotateX(radians(450));
  shape(set.getElement("Vertical wall"), width / 2 + 300, height * 0.4, 1400, 2);
  popMatrix();
  
  // Right wall
  pushMatrix();
  translate(width * 0.005, 0, -150);
  rotateY(radians(629));
  rotateX(radians(270));
  shape(set.getElement("Vertical wall"), 0, 0, 1000, 2);
  popMatrix();
  
  // Left wall
  pushMatrix();
  translate(width * 1.75, 0, -150);
  rotateY(radians(450));
  rotateX(radians(90));
  shape(set.getElement("Vertical wall"), 0, 0, 1000, 2);
  popMatrix();

  // HORIZONTAL WALLS
  pushMatrix();
  translate(width / 2 + 300, height * 0.62, -150);
  shape(set.getElement("Horizontal wall"), 0, 0, 1400, 2);
  popMatrix();
}

void setElements() {
  // Cat position
  pushMatrix();
  translate(width * 1.2, height * 0.61, -150);
  rotateY(radians(471));
  rotateX(radians(453));
  shape(set.getElement("Cat"));
  popMatrix();

  // Statue position
  pushMatrix();
  translate(width * 0.85, height * 0.61, -50);
  rotateY(radians(367));
  rotateX(radians(453));
  shape(set.getElement("Statue"));
  popMatrix();

  // Trees position
  pushMatrix();
  translate(width * 0.4, height * 0.61, -50);
  rotateY(radians(615));
  rotateX(radians(453));
  shape(set.getElement("Tree"));
  popMatrix();
  
  pushMatrix();
  translate(width * 1.35, height * 0.61, -50);
  rotateY(radians(328));
  rotateX(radians(453));
  shape(set.getElement("Tree"));
  popMatrix();
  
  // Studio lights
  pushMatrix();
  translate(width * 1.6, height * 0.61, -500);
  rotateY(radians(211));
  rotateX(radians(538));
  set.getElement("Studio light").setFill(color(0));
  shape(set.getElement("Studio light"));
  popMatrix();
  
  pushMatrix();
  translate(width * 0.2, height * 0.61, -500);
  rotateY(radians(693));
  rotateX(radians(538));
  set.getElement("Studio light").setFill(color(0));
  shape(set.getElement("Studio light"));
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
  if (fpsMode) {
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
  } else {
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
      xRotation--;
      break;
    case "right":
      yRotation++;
      break;
    case "down":
      xRotation++;
      break;
    case "left":
      yRotation--;
      break;
    }
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
