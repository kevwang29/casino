public class Table extends Objects{
  //dimensions of the blackjack table: 4.69:2.34 (width:height)
  //color of blackjack table: 9, 79, 97
  float tableTopLength = 180;
  float tableTopWidth = 5;
  float tableTopHeight = 90;
  //the legs' size is relative to the table top size -- everything done in proportions
  float legLength = tableTopLength * .03;
  float legWidth = tableTopWidth * 13;
  float legHeight = tableTopHeight*.75;
  Rectangle surface = new Rectangle(tableTopLength, tableTopWidth, tableTopHeight);
  Rectangle leg1 = new Rectangle(legLength, legWidth, legHeight);
  Rectangle leg2 = new Rectangle(legLength, legWidth, legHeight);
  PVector myLocation;
  private ArrayList<Objects> myObjects;
  
  public Table(PVector location, String name){
    super(name);
    myLocation = location;
    myObjects = new ArrayList<Objects>();
    myObjects.add(surface);
    myObjects.add(leg1);
    myObjects.add(leg2);
  }

  public void toDraw(float t) {
    pushMatrix();
    translate(myLocation.x, myLocation.y, myLocation.z);
    surface.setTexture(3, "./data/blackjacktable1.jpg", 3);
    fill(9, 79, 97);
    surface.toDraw(t);
    translate((tableTopLength - legLength)/8, tableTopWidth, (tableTopHeight-legHeight)/2);
    fill(133,94,66);
    leg1.toDraw(t);
    translate(6*((tableTopLength-legLength)/8), 0, 0);
    fill(133,94,66);
    leg2.toDraw(t);
    popMatrix();
    
    updateEnclosedBoxRange();
  }
  
  public PVector myLocation() {
    return new PVector(minX, maxY, minZ);
  }

  public PVector myDimensions() {
    return new PVector( maxX-minX, maxY-minY, maxZ-minZ);
  }
  
  public void updateLastRenderedLocation(){
    //get update data from myCard
  }
  
  public void updateEnclosedBoxRange(){
    PVector[] defaultMinMax = myObjects.get(0).getEnclosedBoxRange();
    minX = defaultMinMax[0].x;
    minY = defaultMinMax[0].y;
    minZ = defaultMinMax[0].z;
    maxX = defaultMinMax[1].x;
    maxY = defaultMinMax[1].y;
    maxZ = defaultMinMax[1].z;
    
    for(Objects o : myObjects){
      PVector[] currentMinMax = o.getEnclosedBoxRange();
      
      if(currentMinMax[0].x < minX) minX = currentMinMax[0].x;
      if(currentMinMax[1].x > maxX) maxX = currentMinMax[1].x;
      if(currentMinMax[0].y < minY) minY = currentMinMax[0].y;
      if(currentMinMax[1].y > maxY) maxY = currentMinMax[1].y;
      if(currentMinMax[0].z < minZ) minZ = currentMinMax[0].z;
      if(currentMinMax[1].z > maxZ) maxZ = currentMinMax[1].z;
    }
  }
}

