int X=200;
int Y=200;
void setup(){
  size(400,400);
  background(0);
}
void draw(){
if(Y<55){
  Y=200;X=200; 
}
background(0);
fill(255);
ellipse(200,200,100,100);
  stroke(0);
 
  strokeWeight(2);
  fill(0);
  ellipse(X,Y,100,100);
  Y--;
  X=(600-Y)/2;
int start=millis();
while(millis()-start<100){}

}
