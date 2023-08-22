PVector mino = new PVector(5,0); 

//the old blocks in level, not
//yet removed
boolean[][] garbage;

void setup(){
  size(320,640);
  
  frameRate(4);
  
  garbage = new boolean[10][20];
}

void draw(){
  background(0);
  
  rect(mino.x*32,mino.y*32, 32,32);
  
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
  if (mino.y < 20-1 && !garbage[(int)mino.x][(int)mino.y]){
    mino.add(new PVector(0,1));
  } else {
    garbage[(int)mino.x][(int)mino.y] = true;
    mino = new PVector(5,0); 
  }
}

void keyPressed(){
  if (key == CODED){
    switch (keyCode){
      case LEFT:
        if (mino.x > 0)
          mino.add(new PVector(-1,0));
        break;
      case RIGHT:
        if (mino.x < 10-1)
          mino.add(new PVector(1,0));
        break;
    }
  }
}
