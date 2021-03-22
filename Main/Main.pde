/**
 * @Author: Samuel Arrocha Quevedo
 * @Version: 22-03-2021
 */

import peasy.*;

boolean showHelp, showTitle;
String lightMode;
float xRotation, yRotation;
FilmingSet set;
PeasyCam camera;

void setup() {
  size(800, 800, P3D);
  showTitle = true;
  showHelp = false;
  lightMode = "noLights";
  xRotation = 360;
  yRotation = 201;
  set = new FilmingSet();
  camera = new PeasyCam(this, 378, 350, 500, 250);

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

  SetElement backgroundWall = new SetElement("Background wall", width * 0.875, height * 0.05, 0, 450, 0, verticalWallShape, forestTexture);
  SetElement rightWall = new SetElement("Right wall", width * 0.005, height * 0.05, -500, 629, 270, verticalWallShape, forestTexture);
  SetElement leftWall = new SetElement("Left wall", width * 1.75, height * 0.05, -500, 450, 90, verticalWallShape, forestTexture);
  SetElement horizontalWall = new SetElement("Horizontal wall", width * 0.875, height * 0.63, -500, 0, 0, horizontalWallShape, groundTexture);
  SetElement baseGround = new SetElement("Base ground", width * 0.875, height * 0.65, -500, 360, 453, baseGroundShape);
  SetElement rightTree = new SetElement("Right tree", width * 0.4, height * 0.61, -250, 100, 50, treeShape);
  SetElement leftTree = new SetElement("Left tree", width * 1.35, height * 0.61, -250, 100, 120, treeShape);
  SetElement cat = new SetElement("Cat", width * 1.5, height * 0.61, -700, 450, 475, catShape);
  SetElement statue = new SetElement("Statue", width * 0.9, height * 0.61, -600, 80, 0, statueShape);
  SetElement studioLight = new SetElement("Studio light", width * 0.2, height * 0.61, -950, 180, 0, studioLightShape);

  // Set creation
  set.addElement(backgroundWall);
  set.addElement(rightWall);
  set.addElement(leftWall);
  set.addElement(horizontalWall);
  set.addElement(baseGround);
  set.addElement(rightTree);
  set.addElement(leftTree);
  set.addElement(cat);
  set.addElement(statue);
  set.addElement(studioLight);
}

void draw() {
  background(0);
  if (showTitle) showTitleScreen();
  if (!showTitle && showHelp) {
    camera = new PeasyCam(this, 378, 350, 500, 250);
    camera.setActive(false); 
    showHelpScreen();
  }
  if (!showTitle && !showHelp) {
    camera.setActive(true);

    textSize(20);
    textAlign(CENTER);
    text("Press 'H' to see the help", width * 0.465, height - 30);

    setLights();

    // Filming set
    translate(width * 1.125, height * 0.4, -1450);
    rotateY(radians(yRotation));
    rotateX(radians(xRotation));
    setWalls();
    setElements();
  }
  saveFrame("../data/frames/######-f.jpg");
}

void setWalls() {
  set.getElement("Base ground").createElement(2000, 10, color(50));
  set.getElement("Background wall").createElement(1400, 2);
  set.getElement("Right wall").createElement(1000, 2);
  set.getElement("Left wall").createElement(1000, 2);
  set.getElement("Horizontal wall").createElement(1400, 2);
}

void setElements() {
  set.getElement("Cat").createElement();
  set.getElement("Statue").createElement();
  set.getElement("Studio light").createElement(color(0));
  set.getElement("Right tree").createElement();
  set.getElement("Left tree").createElement();
}

void setLights() {
  switch(lightMode) {
  case "morning":
    lights();
    break;
  case "afternoon":
    pointLight(204, 153, 0, mouseX, mouseY, 1000);
    lightSpecular(100, 100, 100);
    directionalLight(0.8, 0.8, 0.8, 0, 0, -1);
    break;
  case "night":
    spotLight(255, 255, 255, width * 0.5, height * 0.4, -500, 0, 1, -1, PI * 0.4, 2);
    spotLight(255, 255, 255, width * 1.5, height * 0.05, 500, 0, 1, -1, PI * 0.2, 2);
    break;
  case "noLights":
    camera.setActive(false);
    textSize(50);
    textAlign(CENTER);
    text("Press 'Y' to bring the morning", width * 0.48, height / 2);

    ambientLight(0, 0, 0);
    break;
  }
}

void showHelpScreen() {
  float middleX = width * 0.465;
  String controlsTitle = "Studio controls";
  String cameraTitle = "Camera controls";
  String controls = "Press 'Y' to bring the morning \n" +
    "Press 'U' to bring the afternoon\n" +
    "Press 'I' to bring the night\n" +
    "Press 'O' to bring the darkness\n" +
    "Press 'H' to open or exit the help\n" +
    "Press 'R' to reset the application";
  String cameraControls = "Left click and drag to rotate de camera\n" +
    "Mouse wheel to zoom in and out\n" +
    "Right click and vertical drag to modify zoom\n" +
    "Double left click to reset the camera";

  textAlign(CENTER);

  textSize(50);
  text(controlsTitle, middleX, height * 0.05);
  text(cameraTitle, middleX, height * 0.57);

  textSize(30);
  text(controls, middleX, height * 0.15);
  text(cameraControls, middleX, height * 0.67);
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
  text(title, width * 0.48, height * 0.1);
  image(systemImage, width * 0.14, height * 0.25, imageWidth, imageHeight);
  textSize(40);
  text(info, width * 0.48, height * 0.9);
}

void keyPressed() {
  if (keyCode == ENTER) showTitle = false;

  if (keyCode == 'R' || keyCode == 'r') setup();

  if (keyCode == 'h' || keyCode == 'H') showHelp = !showHelp;

  // Lights control
  if (keyCode == 'y' || keyCode == 'Y') lightMode = "morning";
  if (keyCode == 'u' || keyCode == 'U') lightMode = "afternoon";
  if (keyCode == 'i' || keyCode == 'I') lightMode = "night";
  if (keyCode == 'o' || keyCode == 'O') lightMode = "noLights";
}
