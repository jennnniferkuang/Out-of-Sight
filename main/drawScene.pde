void drawScene(){
  image(background.image, background.x, background.y, background.l, background.h);
  
  if (sceneNum == -1)
    drawInstructions();
  
  if (keyClicked)
    image(currentKey.image, currentKey.x, currentKey.y, currentKey.l, currentKey.h);
  
  // draw painting
  if (!paintingOpen && ((1 <= sceneNum && sceneNum <= 3) || (5 <= sceneNum && sceneNum <= 6)))
    image(painting.image, painting.x, painting.y);
    
  // key behind painting
  if (paintingOpen && 1 <= sceneNum && sceneNum <= 2)
    image(currentKey.image, currentKey.x, currentKey.y, currentKey.l, currentKey.h);
  
  // cover drawer
  if (drawerOpen) {
    fill(0);
    noStroke();
    rect(400, 390, 90, 30);
    
    // key in drawer
    if (!keyClicked && 3 <= sceneNum && sceneNum <= 4)
      image(currentKey.image, currentKey.x, currentKey.y, currentKey.l, currentKey.h);
  }
  
  if (5 <= sceneNum && sceneNum <= 11)
    image(currentKey.image, currentKey.x, currentKey.y, currentKey.l, currentKey.h);
  
  // draw character
  if (1 <= sceneNum && sceneNum <= 11){
    image(character.image, character.x, character.y, character.l, character.h);
    movement();
  }
    
  if (sceneNum == 12){
    timer += 0.1;
    if (timer >= 10) {
      sceneNum++;
      background.changeImage("background_dead.jpg");
    }
  }
  
  if (inventoryOpen && 1 <= sceneNum && sceneNum <= 11)
    drawInventory();
  
} // end drawScene


void drawInstructions(){
  fill(234);
  textFont(title);
  text(instructions[0], 35, 70);
  textFont(info);
  for (int i = 1; i < instructions.length; i++)
    text(instructions[i], 35, 150 + (45 * (i-1)));
} // end drawInstructions


void drawInventory(){
  textFont(info);
  
  fill(234);
  rect(inventoryArea.leftX, inventoryArea.topY, inventoryArea.L, inventoryArea.H);
  
  fill(0);
  rect(inventorySearchBar.leftX, inventorySearchBar.topY, inventorySearchBar.L, inventorySearchBar.H);
  
  fill(234);
  textAlign(CENTER, CENTER);
  textSize(30);
  if (search == "")
    text("Search item", 450, inventorySearchBar.topY + 25);
  else
    text(search, 450, inventorySearchBar.topY + 25);
  
  fill(0);
  textSize(20);
  textAlign(LEFT, TOP);
  if (itemIndex != -2){
    if (itemIndex == -1)
      text("Item not found. Try again.", inventorySearchBar.leftX, inventorySearchBar.topY + 75);
    
    else if (search.equalsIgnoreCase("diary"))
      diary();
    
    else if (search.equalsIgnoreCase("key"))
      text("A very familiar, very plain key. Where have you seen it before?", inventorySearchBar.leftX, inventorySearchBar.topY + 75, inventorySearchBar.L, 400);
  }
  
  else{
    for(int i = 0; i < inventory.size(); i++)
      text(inventory.get(i), inventorySearchBar.leftX, (inventorySearchBar.topY + 75 + (i*30)));
  }
  
  // back button
  text("Back", inventoryBackButton.leftX + 5, inventoryBackButton.topY + 5);
  
} // end drawInventory


void diary(){
  float x = inventorySearchBar.leftX, y = inventorySearchBar.topY + 75;
  float l = inventorySearchBar.L, h = 400;
  if (sceneNum == 1)
    text("Dear diary,\nToday they bought me a new dress. I spin for them as they clap and sing praises. Thank you. Thank you.", x, y, l, h);
  else if (sceneNum == 2)
    text("Dear diary,\nToday I found a wounded bird on my doorstep. I took it inside. It is a beautiful thing.", x, y, l, h);
  else if (sceneNum == 3)
    text("Dear diary,\nThey like to watch me feed the bird. They watch as I clean its cage. I did it wrong. I need to do better.", x, y, l, h);
  else if (sceneNum == 4)
    text("Dear diary,\nThe bird's eyes are pitch black. Its wing is healed. Sometimes I hear them beating against the cage.", x, y, l, h);
  else if (sceneNum == 5)
    text("Dear diary,\nIt does not try to fly anymore. It sits on its perch and follows me with its eyes. I think it wants to leave.", x, y, l, h);
  else if (sceneNum == 6)
    text("Dear diary,\nIt is my fault. It ⬜⬜ my fault. ⬜⬜ ⬜⬜ my fault. ⬜⬜ ⬜⬜ ⬜⬜ fault. ⬜⬜ ⬜⬜ ⬜⬜ ⬜⬜⬜⬜⬜", x, y, l, h);
  else if (sceneNum == 7)
    text("Dear diary,\nThe clock is so loud. THEIR voices are so loud. THEY are always watching.", x, y, l, h);
  else if (sceneNum == 8)
    text("THEY took my door off its hinges. When I lie in bed at night, THEY are in the hallway. When I close my eyes, THEY are on the inside of my eyelids.", x, y, l, h);
  else if (sceneNum == 9)
    text("I remember my ⬜⬜⬜⬜. My ⬜⬜⬜⬜ is ⬜⬜⬜⬜⬜⬜⬜⬜⬜. Will THEY take my ⬜⬜⬜⬜ too?", x, y, l, h);
  else if (sceneNum == 10)
    text("⬜⬜⬜⬜⬜ ⬜⬜ ⬜⬜⬜ ⬜⬜⬜⬜ ⬜⬜ ⬜⬜⬜, ⬜⬜⬜⬜ ⬜⬜ ⬜⬜⬜ ⬜⬜⬜⬜ ⬜⬜ ⬜⬜⬜⬜⬜. ⬜⬜⬜⬜⬜⬜⬜⬜ ⬜⬜ ⬜⬜⬜ ⬜⬜⬜⬜, ⬜⬜⬜⬜⬜⬜⬜ ⬜⬜⬜⬜⬜ ⬜⬜⬜.", x, y, l, h);
  else if (sceneNum == 11){
    for (int i = 0; i < 7; i++)
      text("LOOK AWAY LOOK AWAY LOOK AWAY LOOK AWAY", x, (y + (i*25)));
  }
  else
    text("", 0, 0);
} // end diary
