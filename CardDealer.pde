public class CardDealer extends Objects {
  PVector myLocation;
  PVector mySpeed;
  float myTableHeight;
  ArrayList<Card> myCards;
  int numOfCardsDealt = 0;
  
  public CardDealer(PVector location, PVector speed, float tableHeight, String name) {
    super(name);
    myLocation = location;
    mySpeed = speed;
    myTableHeight = tableHeight;
    myCards = new ArrayList<Card>();
  } 

  public Card generateCard() {
    int suit = int(random(4));
    int value = int(random(13));
    Card newCard = new Card(myLocation.get(), suit, value, "card-"+suit+"-"+value);
    myCards.add(newCard);
    newCard.toDealCard(millis(), myTableHeight-0.1*numOfCardsDealt, new PVector(mySpeed.x-50+10*numOfCardsDealt++, mySpeed.y, mySpeed.z+10*numOfCardsDealt));

    return newCard;
  }

  public void renderCards(float t) {
    for (Card c : myCards) {
      c.toDraw(t);
    }
  }

  //At the end of the rendering process record the location of the object
  public void updateLastRenderedLocation() {
  };

  //return the length, width, and height of the object
  public PVector myDimensions() {
    return new PVector();
  }

  //return the corner location of the object with the smallest x, largest y (since -y is up), and smallest z 
  public PVector myLocation() {
    return myLocation;
  }

  public void toDraw(float t) {
  };

  public void updateEnclosedBoxRange() {
  };

  public PVector[] getEnclosedBoxRange() {
    return new PVector[] { 
      myLocation(), myLocation()
    };
  }
}

