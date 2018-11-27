String[] tileSave = new String[500];//Set to number of tiles


//settings[0] = "300"; Example of how to change settign, make sure to make settings a string
  int tx;
  int ty;
  int tc = 0;
void loadTiles(){
  
  String[] tempTiles = loadStrings("tileMap.txt");
  while (tx<(14) && ty<(9)) {
    
    tiledrawType[tx][ty]=Integer.parseInt(tempTiles[tc]);
    tc++;
    
    if (tx == 13) {
      tx = 0; 
      ty ++;
    }

    tx++;
    if (tx != 13 && ty != 8) {
    }
  }

  tx=0;
  ty=0;
  tc=0;
  
}


void saveDefaultBack(){    
  while (tx<(14) && ty<(9)) {
    
    tileSave[tc] = str(tiledrawType[tx][ty]);
    tc++;
    
    if (tx == 13) {
      tx = 0; 
      ty ++;
    }

    tx++;
    if (tx != 13 && ty != 8) {
    }
  }
  saveStrings("settings.txt", );
  tx=0;
  ty=0;
  tc=0;
}

void loadDefualtMap(){
  
}


void saveTiles(){//save changes to map
  //saveStrings("settings.txt", settings); 
}