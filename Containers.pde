int containsAmmount[][] = new int[100][100];
int containerType[][] = new int[100][100];
int itemContaind[][][] = new int[100][100][50];
int tempCN;

//Use to set item value in a container to input value
void addToContainer(int gx,int gy,int itemID){
  if(checkContainerFull(gx,gy) == false){
    itemContaind[gx][gy][checkContainerContains(gx,gy) + 1] = itemID;
    containsAmmount[gx][gy]++;
  }
}

//Use to set item value in container to 0 at a slot
void removeFromContainer(int gx, int gy, int slot){
  itemContaind[gx][gy][slot] = 0;
  containsAmmount[gx][gy]--;
}

//Use to find what item is in container at specfic place
int findItemContainer(int gx,int gy, int slot){
  return itemContaind[gx][gy][slot];  
}


int checkContainerContains(int gx, int gy){
  tempCN = containsAmmount[gx][gy];
  return tempCN;
}


boolean checkContainerFull(int gx,int gy){
  if(containerType[gx][gy] == 1){
    if(checkContainerContains(gx,gy) <= 16){
      return false;
    }else{
     return false; 
    }
  }else{
   return false; 
  }
  
  
}
