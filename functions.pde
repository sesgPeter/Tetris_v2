//checks if the tetrimino collides
//with anything
boolean collision(PVector[] tetrimino){
  for (int i = 0; i < tetrimino.length; i++){
    PVector mino = tetrimino[i];
    
    //collides with screen edges
    //we allow the minos to be above the screen
    if (round(mino.x) <= 0 && round(mino.x) > 10 &&
        round(mino.x) > 20){
          return true;
    }
    
    //collides with garbage
    if (garbage[round(mino.x)][round(mino.y)] == true) {
      return true;
    }
    
  return false;
}
