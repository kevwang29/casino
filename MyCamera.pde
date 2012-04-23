public class MyCamera {
  PVector myLocation;
  PVector myDirection;
  float theta;
  float phi;
  float myRadius;
  public float myMouseX=0;
  public float myMouseY=0;
  private boolean debug = false;

  public MyCamera(PVector location, float r, float theta, float phi) {
    myLocation = location;
    myRadius = r;
    this.theta = theta;
    this.phi = phi;
    
  }

  public void setCamera(){
    PVector pCenter = calculateCenterCoordiates();
    camera( myLocation.x, myLocation.y, myLocation.z, pCenter.x, pCenter.y, pCenter.z, 0, 1, 0);
    //camera( pCenter.x, pCenter.y, pCenter.z,myLocation.x, myLocation.y, myLocation.z,  0, 1, 0);
    /*
    rotateY(theta);
    //rotateX(phi);
    float distance = sqrt(sq(myLocation.x)+sq(myLocation.z));
    float angle = atan(myLocation.z/myLocation.x);
    
    translate(-cos(angle-theta)*distance, -myLocation.y, -sin(angle-theta)*distance);
    
    
    */
   
    
    if(debug){
      //println(myLocation);
      //println(theta);
      //println(distance);
      //println(angle);
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

