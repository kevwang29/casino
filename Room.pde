public class Room extends Objects {

  Rectangle myRoom = new Rectangle(800, 500, 1000);
  PVector myLocation;
  public Room(PVector location, PVector dimensions, String name) {
    super(name);
    myLocation = location;
    myRoom = new Rectangle(dimensions.x, dimensions.y, dimensions.z);
    for(int i=0; i<6; i++){
      //myRoom.setTexture(i, "./data/skyImage.jpeg", 1);
    }
  } 

  public void toDraw(float t) {
    fill(47,79,47);
    myRoom.toDraw(t);
  }

  public PVector myLocation() {
    return myRoom.myLocation();
  }

  public PVector myDimensions() {
    return myRoom.myDimensions();
  }

  public void updateLastRenderedLocation() {
    //get update data from myCard
  }

  public PVector[] getEnclosedBoxRange() {
    return myRoom.getEnclosedBoxRange();
  }

  public void updateEnclosedBoxRange() {
    //update done in rectangle
  }
}

