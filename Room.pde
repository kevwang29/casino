public class Room extends Objects {

  Rectangle myRoom = new Rectangle(800, 500, 1000);
  PVector myLocation;
  public Room(PVector location) {
    myLocation = location;
    for(int i=0; i<6; i++){
      //myRoom.setTexture(i, "./data/skyImage.jpeg", 1);
    }
  } 

  public void toDraw(float t) {
    fill(47,79,47);
    myRoom.toDraw(t);
  }

  public PVector myLocation() {
    return myCard.myLocation();
  }

  public PVector myDimensions() {
    return myCard.myDimensions();
  }

  public void updateLastRenderedLocation() {
    //get update data from myCard
  }

  public PVector[] getEnclosedBoxRange() {
    return myCard.getEnclosedBoxRange();
  }

  public void updateEnclosedBoxRange() {
    //update done in rectangle
  }
}

