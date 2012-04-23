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
MyCamera myCamera;// = new MyCamera( new PVector(440, 350, 400), 10, 0, 0);//
CardDealer myCardDealer, opponentCardDealer;
String OBJECT_FILE_NAME = "room.xml";

XMLParser myXMLParser = new XMLParser();

void setup() 
{
  size(1000, 800, P3D);
  myXMLParser.read(new XMLElement(this, OBJECT_FILE_NAME));
  for (Objects o : myXMLParser.getObjects().values()) {
    myObjects.add(o);
  }
  myCamera = myXMLParser.getCamera();
  //myGrid = new Grid(1000, 500);
  //myTable = new Table(new PVector(300, 500-70, 300));
  //myCardDealer = new CardDealer(new PVector(390, 420, 310), new PVector( 0, -100, 150), 429.9);
  //opponentCardDealer = new CardDealer(new PVector(390, 420, 310), new PVector( 0, -50, -10), 429.9);
  //myObjects.add(myCard);
  //myObjects.add(myTable);
  //myTableTop = new TableTop();
}

void draw() 
{
  myCamera.setCamera();

  float t = millis();

  background(0);
  fill(100);
  for (Objects o : myObjects) {
    o.toDraw(t);
  }
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
    myObjects.add(myXMLParser.getCardDealers().get("player").generateCard());
    break;
  case '2':
    //myCard.toDealCard(millis(), 429.9, new PVector( -100, -130, 50));
    myObjects.add(myXMLParser.getCardDealers().get("house").generateCard());
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
  println("myObjects size is ");
  println(myObjects.size());
  
  for (Objects o : myObjects) {
    if(!(o == null)){
    PVector[] ranges = o.getEnclosedBoxRange();
    println("name");
    println(o.getName());
    println("myLocation");
    println(o.myLocation());
    println("myDimensions");
    println(o.myDimensions());
    println("my ranges");
    println(ranges[0]);
    println(ranges[1]);
    println();
    }
  }
}

