void mousePressed() {
  // START SCREEN
  if (sceneNum == 0) {
    if (startButton.insideArea(mouseX, mouseY, 1, 1)) {
      sceneNum = 1;
      background.changeImage("background1.jpg");
    }
    if (helpButton.insideArea(mouseX, mouseY, 1, 1)){
      sceneNum = -1;
      background.changeImage("background_help.jpg");
    }
  }
  
  // INVENTORY
  else if (inventoryOpen){
    if (inventoryBackButton.insideArea(mouseX, mouseY, 1, 1)){
      search = "";
      itemIndex = -2;
      inventoryOpen = false;
    }
    else if (inventorySearchBar.insideArea(mouseX, mouseY, 1, 1)){
      search = "";
      itemIndex = -2;
    }
  }
  
  // GET KEY
  else if ((keyArea.insideArea(mouseX, mouseY, 1, 1)) && ((paintingOpen && 1 <= sceneNum && sceneNum <= 2) || (drawerOpen && 3 <= sceneNum && sceneNum <= 4) || ((5 <= sceneNum && sceneNum <= 6) || sceneNum == 11))){
    keyClicked = true;
    inventory.add("key");
    if (sceneNum == 11)
      currentKey.changeImage(keyArea, "keyBlack.png", 1, 1, 900, 700);
    else
      currentKey.changeImage(keyArea, "keyBlack.png", 100, 100, 790, 590);
  }
  
  // PAINTING
  else if (!paintingOpen && 1 <= sceneNum && sceneNum <= 3 && paintingArea.insideArea(mouseX, mouseY, 1, 1))
    paintingOpen = true;
  
  // DRAWER
  else if (!drawerOpen && 1 <= sceneNum && sceneNum <= 6 && drawerArea.insideArea(mouseX, mouseY, 1, 1))
    drawerOpen = true;
  
  // DEATH SCREEN
  else if (restartButton.insideArea(mouseX, mouseY, 1, 1) && sceneNum == 13)
    resetVariables();
  
  // HELP SCREEN
  else if (returnMenuButton.insideArea(mouseX, mouseY, 1, 1) && sceneNum == -1){
    println("back");
    resetVariables();
  }

}//end mousePressed


void keyPressed() {
  // IN INVENTORY - freeze scene
  if (inventoryOpen){
    if (keyCode == ENTER){
      itemIndex = binarySearch(inventory, search);
    }
    else if (keyCode == BACKSPACE && !search.equals(""))
      search = search.substring(0, search.length() - 1);
    
    else if (key != CODED && keyCode != BACKSPACE)
      search = search + key;
  }
  
  // NOT IN INVENTORY
  else{
    if (key == 'i' && 1 <= sceneNum && sceneNum <= 11)
      inventoryOpen = true;
    
    if (key == 'd') { // right
      facingRight = true;
      move = true;
    } 
    
    else if (key == 'a') { // left
      facingRight = false;
      move = true;
      if (sceneNum == 11 && keyClicked){
        sceneNum = 12;
        background.changeImage("background7.jpg");
      }
    } 
    
    else if (keyClicked && key == 'e' && doorArea.insideArea(character.x, character.y, character.l, character.h)) { // open door
      sceneNum++;
      character.x = 50;
      keyClicked = false;
      inventory.remove(binarySearch(inventory, "key"));
      paintingOpen = false;
      drawerOpen = false;
      
      if (1 <= sceneNum && sceneNum <= 2){ // normal
        background.changeImage("background2.jpg");
        currentKey.changeImage(keyArea, "keyWhite.png", 100, 100, 400, 200);
      }
      
      else if (3 <= sceneNum && sceneNum <= 4) // key in drawer
        currentKey.changeImage(keyArea, "keyWhite.png", 30, 30, 430, 390);
      
      else if (sceneNum == 5){ // eye painting
        currentKey.changeImage(keyArea, "keyWhite.png", 60, 60, 350, 445);
        painting.changeImage("painting2.jpg");
      }
      
      else if (sceneNum == 6){ // eyes on floor
        background.changeImage("background3.jpg");
        currentKey.changeImage(keyArea, "keyWhite.png", 60, 60, 20, 80);
        painting.changeImage("painting3.jpg");
      }
      
      else if (sceneNum == 7){ // no key
        background.changeImage("background4.jpg");
        currentKey.changeImage(keyArea, "keyWhite.png", 1, 1, 900, 700);
      }
    }
    
    if (key == 'w') {
      if (jump == false) {
        jump = true;
        speedY = -40;
        crouch = false;
      }
    }
      
    else if (key == 's')
      crouch = !crouch;
  }
} // end keyPressed


void keyReleased() {
  frame = 0;
  if (key == 'd' || key == 'a')
    move = false;
} // end keyReleased
