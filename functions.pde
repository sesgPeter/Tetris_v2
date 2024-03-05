//checks if the tetrimino collides
//with anything
boolean collision(PVector[] tetrimino){
  for (int i = 0; i < tetrimino.length; i++){
    PVector mino = tetrimino[i];
    
    //collides with screen edges
    //we allow the minos to be above the screen
    if (round(mino.x) < 0 || round(mino.x) > 9 ||
        round(mino.y) > 19){
          return true;
    }
    //collides with garbage
    if (mino.y >= 0 && garbage[round(mino.x)][round(mino.y)] == true) {
      return true;
    }
  }
  return false;
}

//creates a new piece, and places it above
//the screen
PVector[] createNewPiece(){
  
  PVector[] pTetrimino;
  
  PVector[] newP = new PVector[4]; 
  
  //TETRINARY EXPRESSION//
  //we need another why to pick tetriminos
  //when we have more then two.
  int chosenPiece = (int)random(4);
  switch(chosenPiece){
    case 0:
      pTetrimino = OPiece;
      break;
    case 1:
      pTetrimino = IPiece;
      break;
    case 2:
      pTetrimino = SPiece;
      break;
      case 3:
      pTetrimino = LPiece;
      break;
    default:
      pTetrimino = OPiece;
      break;
  }
  
  //we move the piece, to where we want to spawn
  //it. It's importent that translation and the
  //tetrimino[] are in synch for rotation to function
  translation = new PVector(0,-5);
  
  //we use the copy function to make sure that
  //we don't change the original tetrimino.
  newP[0] = pTetrimino[0].copy().add(translation); 
  newP[1] = pTetrimino[1].copy().add(translation); 
  newP[2] = pTetrimino[2].copy().add(translation); 
  newP[3] = pTetrimino[3].copy().add(translation); 
  
  return newP;
}
