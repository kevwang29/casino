public abstract class Objects{
 public float minX, minY, minZ, maxX, maxY, maxZ;
 public String myName;
 public Objects(String name){
   myName = name;
 }
  
 public PVector myLastRenderedLocation;
 
 //At the end of the rendering process record the location of the object
 public abstract void updateLastRenderedLocation();
  
 //return the length, width, and height of the object
 public abstract PVector myDimensions();
 
 //return the corner location of the object with the smallest x, largest y (since -y is up), and smallest z 
 public abstract PVector myLocation(); 
 
 public abstract void toDraw(float t);
 
 public abstract void updateEnclosedBoxRange();
 
 public PVector[] getEnclosedBoxRange(){
     return new PVector[]{ new PVector(minX, minY, minZ), new PVector(maxX, maxY, maxZ)}; 
  }
  
  public String getName(){
    return myName;
  }
  
  
}
