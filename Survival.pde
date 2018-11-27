boolean isFirstRun;
int loadGridX = 0;
int loadGridY = 5;
int loadBackX;
int loadBackY;
int pixelX;
int pixelY;
int backX;
int backY;
int gridX=5;
int gridY=5;
int moveSpeed = 4;
int x = 0;
int y = 0;
int chunkX;
int chunkY;



int temptiledrawYpe[][] = new int[20][20];
int tiledrawType[][] = new int[100][100];
int tempdrawType;
int drawX;
int drawY;


int chunkXl[] = new int[10];
int chunkXh[] = new int[10];
int chunkYl[] = new int[10];
int chunkYh[] = new int[10];
int loadX;
int loadY;
int tempLoadType;
int tileLoadType[][] = new int[100][100];


PImage pine;


int mousex;
int mousey;


String cText;
String pText = "Console: ";
boolean command=false;

boolean buildMode = false;
int itemBID;

void setup() {
  size(1152, 640); 
  tiledrawType[0][0] = 1;
  tiledrawType[3][3] = 2;
  gridX = loadGridX;
  gridY = loadGridY;
  backX = loadBackX;
  backY = loadBackY;
  pine = loadImage("pine.png");
}
void draw() {
  background(0, 0, 0);
  rect(backX, backY, 50, 50); 
  text(mousex, 400, 400);
  text(mousey, 410, 410);
  tiledraw();
  cameraMove(x, y);
  if (command == true) {
    fill(#FFFFFF);
    rect(0, 0, width, 40);
    fill(0, 0, 0);
    text(pText + "" + cText, 0, 20);
  }
  consoleDraw();
}

void cameraMove(int moveX, int moveY) {
  if (isFirstRun == true) {
  }
  if (moveX == -1) {  
    backX+= moveSpeed;
    pixelX--;
  }
  if (moveX == 1) {
    backX-= moveSpeed;
    pixelX++;
  }
  if (moveY == -1) {
    backY-= moveSpeed;
    pixelY++;
  }
  if (moveY == 1) {
    backY+= moveSpeed;
    pixelY--;
  }
  if (pixelX < 0) {
    gridX--;
    pixelX = 23;
  }
  if (pixelX > 23) {
    gridX++;
    pixelX = 0;
  }
  if (pixelY < 0) {
    gridY--;
    pixelY = 23;
  }
  if (pixelY > 23) {
    gridY++;
    pixelY = 0;
  }
}


void tiledraw() {
  while (drawX<(14) && drawY<(9)) {
    tempdrawType = tiledrawType[drawX+gridX][drawY+gridY];
    //What to draw
    if (tempdrawType == 1) {
      fill(255, 255, 255);
      rect(drawX*96-(pixelX*moveSpeed)-96, drawY*96-(pixelY*moveSpeed)-96, 96, 96);
    } else if (tempdrawType == 2) {
      //pine test
      rect(drawX*96-(pixelX*moveSpeed)-96, drawY*96-(pixelY*moveSpeed)-96, 96, 96);
      image(pine, drawX*96-(pixelX*moveSpeed)-96, drawY*96-(pixelY*moveSpeed)-192);
    }
    //Break of what to draw
    if (drawX == 13) {
      drawX = 0; 
      drawY ++;
    }

    drawX++;
    if (drawX != 13 && drawY != 8) {
    }
  }

  drawX=0;
  drawY=0;
}


void keyPressed() {
  if (command == false) {
    if (key == 'w') {
      y=1;    
    }
    if (key == 's') {
      y=-1;
    }
    if (key == 'a') {
      x=-1;
    }
    if (key == 'd') {
      x=1;
    }
    if (key == 't') {
      command = true;
      keyCode = DELETE;
    }
  }

  if (command == true) {
   
    if (keyCode == BACKSPACE) {
      if (cText.length() > 0) {
        cText = cText.substring(0, cText.length()-1);
      }
    } else if (keyCode == DELETE) {
      cText = "";
    } else if ( keyCode == ENTER) {
      stringCheck();
      command = false;
    } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && keyCode != LEFT && keyCode != RIGHT) {
      cText = cText + key;
    }
  }
}

void keyReleased() {
  if (key == 'w') {
    y=0;
  }
  if (key == 's') {
    y=0;
  }
  if (key == 'a') {
    x=0;
  }
  if (key == 'd') {
    x=0;
  }
}

void tileLoad() {

  while (loadX<(chunkXh[chunkX+1]) && loadY<(chunkYh[chunkY+1])) {
    tempLoadType = tileLoadType[loadX][loadY];

    if (loadX == chunkXh[chunkX+1]) {
      loadX = 0; 
      loadY ++;
    }

    loadX++;
  }

  loadX=0;
  loadY=0;
}


void mousePressed() {
  gridCheck();
  
  if (buildMode == true){
    tiledrawType[mousex][mousey] = itemBID;
  }
}


void stringCheck() {
  if (buildMode == true) {
    if (cText.equals("exit")) {
      buildMode = false;
      pText = "Console: ";
    } else if (isInteger(cText) == true) {
      itemBID = Integer.parseInt(cText);
      pText = "Console/build/" + cText+ ": ";
    } else {
      command = true;
      cText = "Error";
    }
  }
  if (cText.equals("build")) {
    buildMode = true;
    pText = "Console/build: ";
  }
}



boolean isInteger(String s) {
  boolean result = false;
  try {
    Integer.parseInt(s);
    result = true;
  }
  catch(NumberFormatException e) {
  }
  return result;
}


void consoleDraw(){
  if (buildMode == true){
    fill(255,255,255);
    text(itemBID,1000,80);
  }
}