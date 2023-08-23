boolean newPiece;
PVector[] tetrimino; 

PVector translation;

//the old blocks in level, not
//yet removed
boolean[][] garbage;

void setup(){
  size(320,640);
  
  frameRate(4);
  
  garbage = new boolean[10][20];
  
  newPiece = true;
  
  translation = new PVector(0,0);
}

void draw(){
  if (newPiece){
    translation = new PVector(0,0);
    tetrimino = createNewPiece();
    newPiece = false;
  }
  
  background(0);
  
  for (int i = 0; i < tetrimino.length; i++){
    PVector mino = tetrimino[i];
    rect(mino.x*32,mino.y*32, 32,32);
  }
  
  //draw garbage
  for (int y = 0; y < 20; y++){
    for (int x = 0; x < 10; x++){
      if (garbage[x][y]){
        rect(x*32,y*32, 32,32);
      }
    }
  }
  
  //mino hasn't hit the lower bounds
  //of the level or garbage
  for (int i = tetrimino.length-1; i >= 0; i--){
    PVector mino = tetrimino[i];
    if (mino.y >= 0){ //we don't check collision if piece is above the sceen
      if (mino.y > 20-2 || garbage[(int)mino.x][(int)mino.y+1]){
        newPiece = true; 
      }
    }
    
    if (newPiece){
      for (int j = 0; j < tetrimino.length; j++){
        garbage[(int)tetrimino[j].x][(int)tetrimino[j].y] = true;
      }
      break;
    }
  }
  
  if (!newPiece){
    for (int i = tetrimino.length-1; i >= 0; i--){
      PVector mino = tetrimino[i];
        mino.add(new PVector(0,1));
    }
    translation.add(new PVector(0,1));
  }
  
  //check for cleared lines
  for (int y = 0; y < 20; y++){
    boolean lineClear = true;
    for (int x = 0; x < 10; x++){
      if (!garbage[x][y]){
        lineClear = false;
        break;
      }
    }
    if (lineClear){
      for (int i = y; i > 0; i--){
        for (int x = 0; x < 10; x++){
          garbage[x][i] = garbage[x][i-1];
        }
      }
    }
  }
}

void keyPressed(){
  
  PVector[] newLocation = new PVector[4];
  
  if (key == CODED){
      switch (keyCode){
        case LEFT:
          //find leftmust mino
          PVector leftest = new PVector(10,0);
          for (int i = 0; i < tetrimino.length; i++){
            if (tetrimino[i].x < leftest.x){
              leftest = tetrimino[i];
            }
          }
          if (leftest.x > 0){
            for (int i = 0; i < tetrimino.length; i++){
              tetrimino[i].x--;
            }
            translation.add(new PVector(-1,0));
          }
          break;
        case RIGHT:
          //find rightmust mino
          PVector rightest = new PVector(0,0);
          for (int i = 0; i < tetrimino.length; i++){
            if (tetrimino[i].x > rightest.x){
              rightest = tetrimino[i];
            }
          }
          if (rightest.x < 10-1){
            for (int i = 0; i < tetrimino.length; i++){
              tetrimino[i].x++;
            }
            translation.add(new PVector(1,0));
          }
          break;
        case UP:
        for (int i = 0; i < tetrimino.length; i++){
          PVector mino = tetrimino[i].copy();
            mino.set(new PVector( 
                    round(mino.copy().sub(translation).rotate(radians(-90)).add(translation).x),
                    round(mino.copy().sub(translation).rotate(radians(-90)).add(translation).y)));
            newLocation[i] = mino;
        }
        if (!collision(newLocation)){
          tetrimino = newLocation;
        }
          break;
       case DOWN:
       for (int i = 0; i < tetrimino.length; i++){
          PVector mino = tetrimino[i].copy();
            mino.set(new PVector( 
                    round(mino.copy().sub(translation).rotate(radians(90)).add(translation).x),
                    round(mino.copy().sub(translation).rotate(radians(90)).add(translation).y)));
            newLocation[i] = mino;
        }
        if (!collision(newLocation)){
          tetrimino = newLocation;
        }
         break;   
      }
  }
}
