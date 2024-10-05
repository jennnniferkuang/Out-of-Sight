//All images are digitally illustrated by myself.

// store images for quick load
PImage[] walkCycle = new PImage[8];
PImage[] crouchCycle = new PImage[4];

// create images
Image background, painting, currentKey, fade, character;

// create buttons/effect areas
EffectArea keyArea, startButton, helpButton, restartButton, returnMenuButton, doorArea;
EffectArea drawerArea, paintingArea, paintingEyeArea, floorEyeArea;
EffectArea inventoryArea, inventoryBackButton, inventorySearchBar;

// text
PFont title, info;
String[] instructions = new String[] {"Instructions:", "Click on game elements to interact.", "Press 'e' to interact with doors.", "Press 'i' to open inventory.", "Use 'a' and 'd' to move left and right.", "Use 'w' to jump.", "Use 's' to crouch.", "DON'T CROSS THEIR LINE OF SIGHT."};

// inventory
ArrayList<String> inventory = new ArrayList<String>();
String search;
int itemIndex;

// flow
int sceneNum, keyLocation, speedY, frame;
float timer;
boolean facingRight, keyClicked, paintingOpen, drawerOpen, jump, crouch, onTable, move, inventoryOpen;


void resetVariables(){
  // load images
  background = new Image("background_start.jpg", 900, 700, 0, 0);
  painting = new Image("painting1.jpg", 220, 143, 338, 178);
  currentKey = new Image("keyWhite.png", 100, 100, 400, 200);
  fade = new Image("fade.jpg", 900, 700, 0, 0);
  character = new Image(walkCycle[0], 150, 225, 50, 334);
  
  // load buttons/effect areas
  keyArea = new EffectArea(currentKey.x, currentKey.y, currentKey.l, currentKey.h);
  startButton = new EffectArea(273, 562, 352, 105);
  helpButton = new EffectArea(795, 17, 90, 73);
  restartButton = new EffectArea(780, 590, 120, 110);
  returnMenuButton = new EffectArea(800, 24, 81, 71);
  doorArea = new EffectArea(550, 0, 340, 700);
  drawerArea = new EffectArea(400, 390, 90, 30);
  paintingArea = new EffectArea(325, 158, 251, 169);
  paintingEyeArea = new EffectArea(350, 0, 200, 700);
  floorEyeArea = new EffectArea(400, 0, 100, 700);
  inventoryArea = new EffectArea(225, 175, 450, 350);
  inventoryBackButton = new EffectArea(inventoryArea.leftX + 20, inventoryArea.bottomY - 55, 75, 50);
  inventorySearchBar = new EffectArea(inventoryArea.leftX + 25, inventoryArea.topY + 25, inventoryArea.L - 50, 50);
  
  // variables
  sceneNum = 0;
  keyLocation = 0;
  speedY = 0;
  frame = 0;
  timer = 0;
  facingRight = true;
  keyClicked = false;
  paintingOpen = false;
  drawerOpen = false;
  jump = false;
  crouch = false;
  onTable = false;
  move = false;
  
  // inventory
  inventory = new ArrayList<String>();
  inventory.add("diary");
  inventoryOpen = false;
  search = "";
  itemIndex = -2;
  
  // text
  textAlign(LEFT, TOP);
  
} // end resetVariables


void loadWalkCycle(){
  walkCycle[0] = loadImage("GIRL_stationaryR.png");
  walkCycle[1] = loadImage("GIRL_r1R.png");
  walkCycle[2] = loadImage("GIRL_r2R.png");
  walkCycle[3] = loadImage("GIRL_r3R.png");
  walkCycle[4] = loadImage("GIRL_stationaryL.png");
  walkCycle[5] = loadImage("GIRL_r1L.png");
  walkCycle[6] = loadImage("GIRL_r2L.png");
  walkCycle[7] = loadImage("GIRL_r3L.png");
} // end loadWalkCycle


void loadCrouchCycle(){
  crouchCycle[0] = loadImage("GIRL_c2R.png");
  crouchCycle[1] = loadImage("GIRL_c1R.png");
  crouchCycle[2] = loadImage("GIRL_c2L.png");
  crouchCycle[3] = loadImage("GIRL_c1L.png");
} // end loadCrouchCycle
