public class CardDealer{
 PVector myLocation;
 PVector mySpeed;
 float myTableHeight;
 ArrayList<Card> myCards;
 int numOfCardsDealt = 0;
 
  public CardDealer(PVector location, PVector speed, float tableHeight){
    myLocation = location;
    mySpeed = speed;
    myTableHeight = tableHeight;
    myCards = new ArrayList<Card>();
 } 
 
 public Card generateCard(){
  int suit = int(random(4));
  int value = int(random(13));
  Card newCard = new Card(myLocation.get(), suit, value);
  myCards.add(newCard);
  newCard.toDealCard(millis(), myTableHeight-0.1*numOfCardsDealt, new PVector(mySpeed.x-50+10*numOfCardsDealt++, mySpeed.y, mySpeed.z+10*numOfCardsDealt));
  
  return newCard;
 }
 
 public void renderCards(float t){
    for(Card c : myCards){
       c.toDraw(t);
    } 
 }
  
}
