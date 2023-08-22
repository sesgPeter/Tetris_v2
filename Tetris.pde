PVector mino = new PVector(5,0); 

void setup(){
  size(320,640);
  
  frameRate(4);
}

void draw(){
  background(0);
  
  rect(mino.x*32,mino.y*32, 32,32);
  
  mino.add(new PVector(0,1));
}
