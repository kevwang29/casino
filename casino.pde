import processing.opengl.*;

//Rectangle r = new Rectangle(100, 100, 100);
int t = 0;
int y = 0;
Card myCard;
Grid myGrid;
Table myTable;
Room myRoom;
boolean debug = false;
private ArrayList<Objects> myObjects = new ArrayList<Objects>();
//TableTop myTableTop;
MyCamera myCamera = new MyCamera( new PVector(440, 350, 400), 10);//
CardDealer myCardDealer, opponentCardDealer;

void setup() 
{
  size(1000, 800, P3D);
  myCard = new Card(new PVector(440, 420, 345), 2, 3);
  myGrid = new Grid(1000, 500);
  myRoom = new Room(new PVector(0, 0, 0));
  myTable = new Table(new PVector(300, 500-70, 300));
  myCardDealer = new CardDealer(new PVector(390, 420, 310), new PVector( 0, -100, 150), 429.9);
  opponentCardDealer = new CardDealer(new PVector(390, 420, 310), new PVector( 0, -50, -10), 429.9);
  myObjects.add(myCard);
  myObjects.add(myTable);
  //myTableTop = new TableTop();
}

void draw() 
{
  camera();
  myCamera.setCamera();
  float t = millis();
  background(0);
  //noStroke();
  fill(100);
  //translate(width/2.0, height/2.0, 0);
  myRoom.toDraw(t);
  
  //myGrid.toDraw();
  myTable.toDraw(t);
  myCardDealer.renderCards(t); 
   opponentCardDealer.renderCards(t); 
  //r.addRotateY(1*t);
  //r.setTexture(0, "./data/cards.png", 1);
  //r.setTexture(5, "./data/cards/clubs-2-150.jpg", 1);
  //r.setTexture(2, "./data/cards/back-blue-75-3.png", 1);
  //r.toDraw();

  myCard.toDraw(t);
  //myTableTop.toDraw(millis());
}

void keyPressed ()
{
  float increment = 10;  
  switch (key)
  {
  case '=':
    t+=3;
    break;
  case '-':
    t-=3;
    break;
  case '0':
    y+=3;
    break;
  case '9':
    y-=3;
    break;
  case '1':
    //myCard.toDealCard(millis(), 429.9, new PVector( -100, -130, 50));
    myCardDealer.generateCard();
    break;
  case '2':
    //myCard.toDealCard(millis(), 429.9, new PVector( -100, -130, 50));
    opponentCardDealer.generateCard();
    break;
  case 'r':
    myCamera.moveUp(20);
    break;
  case 'f':
    myCamera.moveDown(20);
    break;   

  case 'w':
    myCamera.moveForward(20);
    break;
  case 's':
    myCamera.moveBackward(20);
    break;
  case 'a':
    myCamera.moveLeft(20);
    break;
  case 'd':
    myCamera.moveRight(20);
    break;
  case 'q':
    getObjectData();
    break;
  }


  if (key == CODED)
  {
    if (keyCode == UP)
    {
      myCamera.moveForward(20);
    }
    if (keyCode == DOWN)
    {
      myCamera.moveBackward(20);
    }
    if (keyCode == LEFT)
    {
      myCamera.moveLeft(20);
    }
    if (keyCode == RIGHT)
    {
      myCamera.moveRight(20);
    }
  }
}

void mousePressed() { 
  myCamera.myMouseX = mouseX;
  myCamera.myMouseY = mouseY;
}

void mouseDragged() {
  float xDiff = mouseX - myCamera.myMouseX ;
  myCamera.turnRight(PI/200*xDiff);
  myCamera.myMouseX = mouseX;

  float yDiff = mouseY - myCamera.myMouseY ;
  myCamera.lookUp(PI/200*yDiff);
  myCamera.myMouseY = mouseY;
}

void getObjectData() {
  for (Objects o : myObjects) {
    PVector[] ranges = o.getEnclosedBoxRange();
    println("myLocation");
    println(o.myLocation());
    println("myDimensions");
    println(o.myDimensions());
    println("my ranges");
    println(ranges[0]);
    println(ranges[1]);
    println();
  }

  println("camera location");
  println(myCamera.getLocation());

  println(myTable.myLocation().y-myTable.myDimensions().y-myCard.myDimensions().y);
}

