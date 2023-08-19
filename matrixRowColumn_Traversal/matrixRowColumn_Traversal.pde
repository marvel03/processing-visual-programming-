import java.util.*;
int x_limit=50;
int y_limit=x_limit;
int N=10;// size of the matrix 
int delay=10;// delay for the next frame from being processed
 int x=x_limit,y=y_limit;
void setup(){
 size(500,500);
 background(255);
}
void draw(){
  int l=(width-2*x_limit)/N;
  if(y>height-y_limit-l){
  x=x_limit;
  y=y_limit;
 }
  //background(0);//uncomment this to see the traversal taking place
  plotMatrix(N);
  int start =millis(); 
 fill(int(random(255)));
 square(x,y,l);// for column traversal 
 square(y,x,l);// for row traversal
 x+=l;
 if(x>=width-x_limit){
   x=x_limit;
   y+=l;
 }
 while(millis()-start<delay){} 

}
void plotMatrix(int n){
  stroke(0);
  noFill();
  int x=x_limit;
  int y=y_limit;
  int l=(width-2*x_limit)/n;
      while(y<height-50){
          while(x<width-50){
              square(x,y,l);
              x+=l;
          }
          x=x_limit;
          System.out.println();
          y+=l;
      }
}
