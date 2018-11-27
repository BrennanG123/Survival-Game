int inAmmount;
int initemContaind[] = new int[100];
int tempIn;

//Use to set item value in Inventory to input value
void addToin(int itemID){
  if(checkInFull() == false){
    initemContaind[checkInContains() + 1] = itemID;
    inAmmount++;
  }
}

//Use to set item value in container to 0 at a slot
void removeFromIn(int slot){
  initemContaind[slot] = 0;
  inAmmount--;
}

//Use to find what item is in container at specfic place
int findItemIn(int slot){
  return initemContaind[slot];  
}


int checkInContains(){
  tempIn = inAmmount;
  return tempIn;
}


boolean checkInFull(){
    if(checkInContains() <= 16){
      return false;
    }else{
     return false; 
    } 
}
