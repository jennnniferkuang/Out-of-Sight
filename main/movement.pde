void running() {
  if (facingRight == true) {
    switch(frame) {
    case 0:
      character.changeImage(walkCycle[0]);
      break;
    case 10:
      character.changeImage(walkCycle[1]);
      break;
    case 20:
      character.changeImage(walkCycle[2]);
      break;
    case 30:
      character.changeImage(walkCycle[3]);
      break;
    }
  }
  
  else if (facingRight == false) {
    switch(frame) {
    case 0:
      character.changeImage(walkCycle[4]);
      break;
    case 10:
      character.changeImage(walkCycle[5]);
      break;
    case 20:
      character.changeImage(walkCycle[6]);
      break;
    case 30:
      character.changeImage(walkCycle[7]);
      break;
    }
  }
}//end of running function


void crouching() {
  if (crouch == true) {
    if (facingRight == true) {
      switch(frame) {
      case 0:
        character.changeImage(crouchCycle[0]);
        break;
      case 20:
        character.changeImage(crouchCycle[1]);
        break;
      }
    }
    
    if (facingRight == false) {
      switch(frame) {
      case 0:
        character.changeImage(crouchCycle[2]);
        break;
      case 20:
        character.changeImage(crouchCycle[3]);
        break;
      }
    }
  }
}//end crouching


void jumping() { // This method was written in collaboration with my teacher.
  character.y += speedY;
  if (jump == true) {
    speedY += 4;
  }
  if (character.x>200 && character.x<540 && jump == true && sceneNum<7)
    onTable = true;
  if (speedY >= 40 && onTable == false) {
    speedY = 0;
    character.y = 334;
    jump = false;
  }
  else if (onTable == true) {
    character.y = 182;
    if (character.x>540 || character.x<200) {
      speedY += 2;
      if (speedY >= 40) {
        speedY = 0;
        character.y = 334;
        jump = false;
        onTable = false;
      }
    }
  }
}//end jumping


void movement() {
  if (move == true) {
  if (facingRight == true)
    character.x += 5; 
  if (facingRight == false)
    character.x -= 5;
  frame++;
    if (frame == 40 && crouch == false) {
      frame = 10;
    } else if (frame == 40 && crouch == true) {
      frame = 0;
    }
  }
  if (crouch == false)
    running();
  crouching();
  jumping();
  
  // LEFT BOUND
  if (1 <= sceneNum && sceneNum <= 7 && character.x <= -15)
    character.x = -15;
      
  // RIGHT BOUND
  if (1 <= sceneNum && sceneNum <= 6 && character.x >= 770)
    character.x = 770;
  
  // EYE PAINTING AND EYES ON FLOOR - game over
  if ((sceneNum == 5 && !crouch && paintingEyeArea.insideArea(character.x, character.y, character.l, character.h)) || (sceneNum == 6 && !onTable && floorEyeArea.insideArea(character.x, character.y, character.l, character.h))){
    sceneNum = 12;
    background.changeImage("background7.jpg");
    currentKey.changeImage(keyArea, "keyWhite.png", 1, 1, 900, 700);
  }
    
  // EMPTY LOOP ROOMS RIGHT BOUND
  if (7 <= sceneNum && sceneNum <= 10 && character.x > 900){
    background.changeImage("background5.jpg");
    character.x = -character.l + 100;
    sceneNum++;
  }
  
  // EMPTY LOOP ROOMS LEFT BOUND
  if (8 <= sceneNum && sceneNum <= 11 && character.x < -character.l){
    character.x = 800;
    sceneNum--;
    if (sceneNum == 10){
      background.changeImage("background5.jpg");
      currentKey.changeImage(keyArea, "keyWhite.png", 1, 1, 900, 700);
    }
  }
  
  // ALL EYES
  if (sceneNum == 11 && !keyClicked){
    currentKey.changeImage(keyArea, "keyWhite.png", 70, 70, 800, 455);
    background.changeImage("background6.jpg");
    if (character.x >= 110)
      character.x = 110;
  }
} // end movement
