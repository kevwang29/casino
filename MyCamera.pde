public class MyCamera {
  PVector myLocation;
  PVector myDirection;
  float theta = PI/2;
  float phi = 0;
  float myRadius;
  public float myMouseX=0;
  public float myMouseY=0;
  private boolean debug = false;

  public MyCamera(PVector location, float r) {
    myLocation = location;
    myRadius = r;
  }

  public void setCamera(){
    PVector pCenter = calculateCenterCoordiates();
    camera( myLocation.x, myLocation.y, myLocation.z, pCenter.x, pCenter.y, pCenter.z, 0, 1, 0);
    if(debug){
      println(myLocation);
      println(pCenter);
    }
  }
  
  public PVector calculateCenterCoordiates() {
    float delZ = -cos(theta)*cos(phi)*myRadius;
    float delX = sin(theta)*cos(phi)*myRadius;
    float delY = -sin(phi)*myRadius;
    return new PVector(myLocation.x+delX, myLocation.y+delY, myLocation.z+delZ);
  }
  public void turnRight(float radian) {
    theta+=radian;
  }

  public void turnLeft(float radian) {
    theta-=radian;
  }
  
  public void lookUp(float radian){
    phi-=radian;
  }
  
  public void lookDown(float radian){
    phi+=radian;
  }

  public void moveForward(float distance) {
    float delZ = -cos(theta)*distance;
    float delX = sin(theta)*distance;
    myLocation.add(new PVector(delX, 0, delZ));
  }

  public void moveBackward(float distance) {
    float delZ = -cos(theta)*distance;
    float delX = sin(theta)*distance;
    myLocation.sub(new PVector(delX, 0, delZ));
  }

  public void moveUp(float distance) {
    myLocation.add(new PVector(0, -distance, 0));
  }

  public void moveDown(float distance) {
    myLocation.add(new PVector(0, distance, 0));
  }
  
  public void moveLeft(float distance){
    float delZ = -cos(theta-PI/2)*distance;
    float delX = sin(theta-PI/2)*distance;
    myLocation.add(new PVector(delX, 0, delZ));
  }
  
  public void moveRight(float distance){
    float delZ = -cos(theta+PI/2)*distance;
    float delX = sin(theta+PI/2)*distance;
    myLocation.add(new PVector(delX, 0, delZ));
  }
  
  public PVector getLocation(){
   return myLocation; 
  }
}
