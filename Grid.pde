public class Grid{
 private int myLengthOfSide;
 private int myInterval;
 private boolean debug= false;
  
 public Grid(int lengthOfSide, int interval){
  myLengthOfSide = lengthOfSide;
  myInterval = interval;
 } 
 
 public void toDraw(){
   
   noFill();
   if(debug){
      println("drawing grid"); 
   }
   for(int i=0; i<myLengthOfSide; i+=myInterval){
     for(int j=0; j<myLengthOfSide; j+=myInterval){
       for( int k=0; k<myLengthOfSide; k+=myInterval){
         if(debug){
            println(String.format("point %s, %s, %s", i,j,k)); 
         }
         /*point(i,j,k);
         line(i, j, k, i+myInterval, j, k);
         line(i, j, k, i, j+myInterval, k);
         line(i, j, k, i, j, k+myInterval);   
         */
         strokeWeight(5);
         stroke(new Float(i)/myLengthOfSide/3*255 + new Float(j)/myLengthOfSide/3*255 + new Float(k)/myLengthOfSide/3*255, 0, 0);
         point(i, j, k);
         stroke(25);
         strokeWeight(1);
         pushMatrix();
         translate(i, j, k);
         translate(-myInterval/2, -myInterval/2, -myInterval/2);
         box(myInterval,myInterval,myInterval);
         popMatrix();
     }
    } 
   }
   
 }
  
  
}
