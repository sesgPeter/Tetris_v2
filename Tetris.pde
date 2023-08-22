PVector mino = new PVector(5,0); 

void setup(){
  size(320,640);
  
  frameRate(4);
}

void draw(){
  background(0);
  
  rect(mino.x*32,mino.y*32, 32,32);
  
  //mino hasn't hit the lower bounds
  //of the level
  if (mino.y < 20-1){
    mino.add(new PVector(0,1));
  } else {
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
