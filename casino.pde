//Rectangle r = new Rectangle(100, 100, 100);
int t = 0;
int y = 0;
Card myCard;
Grid myGrid;
Table myTable;
boolean debug = false;
private ArrayList<Objects> myObjects = new ArrayList<Objects>();
//TableTop myTableTop;
MyCamera myCamera = new MyCamera(new PVector(0, 0, 0), 10);
void setup() 
{
  size(1000, 800, P3D);
  myCard = new Card(new PVector(0, -10, 0));
  myGrid = new Grid(1000, 500);
  myTable = new Table();
  myObjects.add(myCard);
  myObjects.add(myTable);
  //myTableTop = new TableTop();
}

void draw() 
{
  background(0);
  //noStroke();
  fill(100);
  //translate(width/2.0, height/2.0, 0);
  pushMatrix();
  myCamera.setCamera();
  popMatrix();
  //myGrid.toDraw();
  myTable.toDraw(t);
  
  //r.addRotateY(1*t);
  //r.setTexture(0, "./data/cards.png", 1);
  //r.setTexture(5, "./data/cards/clubs-2-150.jpg", 1);
  //r.setTexture(2, "./data/cards/back-blue-75-3.png", 1);
  //r.toDraw();

  myCard.toDraw(millis());
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
    myCard.toDealCard(millis(), myTable.myLocation().y-myTable.myDimensions().y-myCard.myDimensions().y, new PVector( 100, -130, 0));
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
  for(Objects o : myObjects){
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
