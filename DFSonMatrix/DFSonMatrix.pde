import java.util.*;

int x_limit=50;
int y_limit=x_limit;
int N=50;
int x,y;
int i=0;
int delay=10;
List<Integer[]> bfsRoute=new ArrayList<Integer[]>();

 class DFS {
   public  List<Integer[]> calcRoute(){
     int[][]mat;
     Stack<Integer[]> st=new Stack<Integer[]>();
     List<Integer[]> ls=new ArrayList<Integer[]>();
     mat= new int[N][N];
     st.add(new Integer[]{(int)random(N-1),(int)random(N-1)});
     try{
     matrixBFS(st,ls,mat);
     }catch (Exception e){
         System.out.println("error");
     }
     //for(Integer[] i : st){
     //    System.out.print("("+i[0]+","+i[1]+")");
     //}
     //  System.out.println();
     //for(Integer[] i : ls){
     //    System.out.print("("+i[0]+","+i[1]+")");
     //}System.out.println();
     return ls;
     //printArray(mat);
   }
   public   void getNxtNode(Stack<Integer[]>st,List<Integer[]> ls,int[][] mat ){
           int i_limit = mat.length - 1;
           int j_limit = mat[0].length - 1;
           Integer index[] = st.peek();
           st.pop();
           if (index[1] - 1 >= 0) {
               Integer[] v=new Integer[]{index[0], index[1] - 1};
               if(containsArrInList(ls,v)||containsArrInList(st,v));
               else st.push(v);
           }
           if (index[0] - 1 >= 0) {
               Integer[] v=new Integer[]{index[0]-1, index[1]};
               if(containsArrInList(ls,v)||containsArrInList(st,v));
               else  st.push(v);
           }
           if (index[1] + 1 <= j_limit) {//
               Integer[] v=new Integer[]{index[0], index[1] + 1};
               if(containsArrInList(ls,v)||containsArrInList(st,v));
               else  st.push(v);
           }
           if (index[0] + 1 <= i_limit) {
               Integer[] v=new Integer[]{index[0] + 1, index[1]};
               if(containsArrInList(ls,v)||containsArrInList(st,v));
               else  st.push(v);
           }
   }
   public  boolean containsArrInList(List<Integer[]> ls,Integer[] a2){
       for(int i=0;i<ls.size();i++) {
           if (checkArrEqual(ls.get(i), a2)) {
               return true;
           }
       }
       return false;
    }
    public  boolean checkArrEqual(Integer[] a1,Integer a2[]) {
        for(int i=0;i<a1.length;i++){
            if(a1[i]!=a2[i]){
                return false;
            }
        }
        return true ;
    }
   public  void matrixBFS(Stack<Integer[]> st, List<Integer[]> ls, int[][] mat)throws Exception{
       if(st.isEmpty()){
           return;
       }else{
           ls.add(st.peek());
           getNxtNode(st,ls,mat);
           matrixBFS( st, ls,mat);
       }
   }


}

 boolean colorState=true ;
 DFS dfs=new DFS();
void setup(){
  size(800,800);
  bfsRoute=dfs.calcRoute();
  background(0);
}
void draw(){
  if(i>=bfsRoute.size()){
    i=0;
    bfsRoute=dfs.calcRoute();
    colorState=!colorState;
  }
    int l=(width-2*x_limit)/N;
    int start =millis();
 //List<Integer[]> bfsCoordinates=new ArrayList<Integer[]>();
   //plotMatrix(N);
   x=x_limit+bfsRoute.get(i)[0]*l;
   y=y_limit+bfsRoute.get(i)[1]*l;
   System.out.print("("+x+","+y+")");
   i++;
   if(colorState)fill((int)random(255),(int)random(255),(int)random(255));
   else fill((int)random(255));
   square(x,y,l);
   while(millis()-start<delay);
}
void plotMatrix(int n){
  stroke(255);
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
