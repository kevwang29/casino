public class Card extends Objects{
  Rectangle myCard = new Rectangle(6.3, 0.1, 9);
  boolean beingDealt = false;
  boolean flipped = false;
  float timeLastUpdated = 0;
  float myTableHeight = 0;
  PVector myLocation;
  PVector mySpeed;
  float resistance = 5;
  boolean hitDeck= false;
  boolean debug = true;
  
  int mySuit;
  int myValue;

  public Card(PVector location, int suit, int value) {
    myLocation = location;
    mySuit = suit;
    myValue = value;
  }

  public void toDraw(float t) {
    /*if(debug){
     System.out.println("start toDraw and time is");
     System.out.println(t); 
     }*/
    pushMatrix();
    if (beingDealt) {
      updateLocation(t);
    }

    if (flipped) { 
      rotateX(PI);
    }

    renderCard(t);
    popMatrix();
  }

  public void renderCard(float t) {
    pushMatrix();
    translate(myLocation.x, myLocation.y, myLocation.z);
    myCard.setTexture(3, String.format("./data/cards/%s-%s-150.jpg", mySuit, myValue+1), 1);
    myCard.setTexture(2, "./data/cards/back-blue-150-1.jpg", 1);
    myCard.toDraw(t);
    popMatrix();
  }

  public void toDealCard(float t, float tableHeight, PVector velocity) {
    beingDealt = true;
    timeLastUpdated = t;
    mySpeed = velocity.get();
    myTableHeight = tableHeight;
  }

  private void updateLocation(float t) {
    if (debug) {
      println("speed before update");
      println(mySpeed);
      print( "input time");
      println(t);
      print("last update");
      println( timeLastUpdated);
    }

    float timeElapsed = t - timeLastUpdated;



    PVector horizontalSpeed = new PVector( mySpeed.x, 0, mySpeed.z);
    PVector verticalSpeed = new PVector( 0, mySpeed.y, 0);

    if (hitDeck) {
      horizontalSpeed.sub(PVector.mult(horizontalSpeed, (timeElapsed)/1000*resistance));
      if (horizontalSpeed.mag()<0.1) {
        stopAnimation();
        mySpeed = new PVector();
        return;
      }
    }
    else {
      verticalSpeed.add( new PVector(0, (timeElapsed)/1000*980, 0));
    }
    myLocation.add(PVector.mult(horizontalSpeed, (timeElapsed/1000)));
    myLocation.add(PVector.mult(verticalSpeed, (timeElapsed/1000)));

    mySpeed = PVector.add(horizontalSpeed, verticalSpeed);
    timeLastUpdated = t;

    if (debug) {
      print("mylocation");
      println(myLocation);
      print("my speed");
      println(mySpeed);
      print("time elapsed");
      println(timeElapsed);
      println();
    }

    if ( myLocation.y>myTableHeight) {
      if (debug) println("hitdeck");
      hitDeck = true;
      mySpeed = new PVector(mySpeed.x, 0, mySpeed.z);
      myLocation = new PVector(myLocation.x, myTableHeight, myLocation.z);
    }
  }

  private void stopAnimation() {
    if (debug) {
      println("animation stopped");
    }
    mySpeed = new PVector();
    myTableHeight=0;
    beingDealt = false;
    hitDeck = false;
  }
  
  public PVector myLocation() {
    return myCard.myLocation();
  }

  public PVector myDimensions() {
    return myCard.myDimensions();
  }
  
  public void updateLastRenderedLocation(){
    //get update data from myCard
  }
  
  public PVector[] getEnclosedBoxRange(){
   return myCard.getEnclosedBoxRange(); 
  }
  
  public void updateEnclosedBoxRange(){
     //update done in rectangle 
  }
}

