
public class Rectangle extends Objects
{
  float myLength, myWidth, myHeight;
  String[] texturePicture = new String[6];
  int[] textureOrientation = new int[] { 
    -1, -1, -1, -1, -1, -1
  };
  PVector myLocation;
  final PVector[] myVertices;
  int[][] myFaces;
  boolean debug = false;

  public Rectangle(){
    this(1,1,1, new PVector()); 
  }

  public Rectangle(float rectLength, float rectWidth, float rectHeight, PVector location)
  {
    super("");
    myLength = rectLength;
    myWidth = rectWidth;
    myHeight = rectHeight;


    myLocation = location;

    int[][] faces = {
      { 
        1, 3, 6, 5
      }
      , 
      { 
        0, 2, 7, 4
      }
      , 
      { 
        0, 2, 3, 1
      }
      , 
      { 
        7, 6, 5, 4
      }
      , 
      { 
        2, 3, 6, 7
      }
      , 
      { 
        0, 1, 5, 4
      }
    };
    PVector[] vertices = {
      new PVector(0, 1, 0), 
      new PVector( 1, 1, 0), 
      new PVector(0, 1, 1), 
      new PVector( 1, 1, 1), 
      new PVector(0, 0, 0), 
      new PVector( 1, 0, 0), 
      new PVector( 1, 0, 1), 
      new PVector(0, 0, 1)
      };

      myFaces = faces;
    myVertices = vertices;
    scale();
  }

  public Rectangle(float rectLength, float rectWidth, float rectHeight) {
    this(rectLength, rectWidth, rectHeight, new PVector(0, 0, 0));
  } 

  public void toDraw(float t)
  {  
    if (debug) println("start toDraw");


    for (int f = 0; f < myFaces.length; f++) {
      beginShape(QUADS);

      if (texturePicture[f]!= null)
      {
        int[] myTemp = myFaces[f];
        int[] textureX = new int[] {
          0, 0, 1, 1
        };
        int[] textureY = new int[] {
          0, 1, 1, 0
        };


        PImage myTexture = loadImage(texturePicture[f]);
        textureMode(NORMALIZED);
        texture(myTexture);
        for (int i=0; i<4; i++) {
          vertex(myVertices[myTemp[i]].x, myVertices[myTemp[i]].y, myVertices[myTemp[i]].z, textureX[(i+textureOrientation[f])%4], textureY[(i+textureOrientation[f])%4]);
        }
      }
      else
      {
        for (int i : myFaces[f])
        {
          vertex(myVertices[i].x, myVertices[i].y, myVertices[i].z);
        }
      }
      endShape();
    }
  
    updateLastRenderedLocation();
    updateEnclosedBoxRange();
  }

  public void updateLastRenderedLocation() {
    myLastRenderedLocation = new PVector(modelX(0, myWidth, 0), modelY(0, myWidth, 0), modelZ(0, myWidth, 0));
  }
  
  public void updateEnclosedBoxRange(){
    for( int i=0; i<myVertices.length; i++){
      PVector currentVertex = myVertices[i];
      float x = modelX(currentVertex.x, currentVertex.y, currentVertex.z);
      float y = modelY(currentVertex.x, currentVertex.y, currentVertex.z);
      float z = modelZ(currentVertex.x, currentVertex.y, currentVertex.z);
      
     if(i == 0){
      minX = maxX = x;
      minY = maxY = y;
      minZ = maxZ = z;
     }
     else{
      if(x < minX) minX = x;
      if(x > maxX) maxX = x;
      if(y < minY) minY = y;
      if(y > maxY) maxY = y;
      if(z < minZ) minZ = z;
      if(z > maxZ) maxZ = z;
     }
    }
    
  }

  public void setTexture( int face, String fileName, int rotation) {
    texturePicture[face] = fileName;
    textureOrientation[face] = rotation;
  }

  public void removeTexture( int face) {
    texturePicture[face] = null;
    textureOrientation[face] = -1;
  }

  private void scale() {
    for (int i=0; i< myVertices.length; i++) {
      myVertices[i].x= myVertices[i].x*myLength;
      myVertices[i].y= myVertices[i].y*myWidth;
      myVertices[i].z= myVertices[i].z*myHeight;
    }
  }

  public PVector myDimensions() {
    return new PVector(myLength, myWidth, myHeight);
  }

  public PVector myLocation() {
    return myLastRenderedLocation;
  }
}

