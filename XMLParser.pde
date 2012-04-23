
public class XMLParser
{
  // These are read in from input file and do not change during rendering
  /** The camera for this scene. */
  private Room myRoom ;
  /** The list of lights for the scene. */
  private List<Table> myTables;
  /** The list of surfaces for the scene. */
  private Map<String, CardDealer> myCardDealers;

  private MyCamera myCamera;

  private Map<String, Objects> myObjects;

  /**
   * Create an empty scene.
   */
  public XMLParser ()
  {
    myTables = new ArrayList<Table>();
    myCardDealers = new HashMap<String, CardDealer>();
    myObjects = new HashMap<String, Objects>();
  }

  public Room getRoom() {
    return myRoom;
  }

  public List<Table> getTables() {
    return myTables;
  }

  public Map<String, CardDealer> getCardDealers() {
    return myCardDealers;
  }

  public MyCamera getCamera() {
    return myCamera;
  }


  // BUGBUG: yuck --- ugly parsing code below
  //         Processing does not support reflection :(
  /**
   * Read scene description from given XML data.
   */
  public void read (XMLElement root)
  {
    for (XMLElement node : root.getChildren())
    {
      if (node.getName().equalsIgnoreCase("camera"))
      {
        setCamera(node.getChildren());
      }
      else if (node.getName().equalsIgnoreCase("table"))
      {
        addTable(node.getChildren());
      }
      else if (node.getName().equalsIgnoreCase("card_dealer"))
      {
        addCardDealer(node.getChildren());
      }
      else if (node.getName().equalsIgnoreCase("room"))
      {
        addRoom(node.getChildren());
      }
    }
  }


  private void addObject(Objects obj) {
    myObjects.put(obj.getName(), obj);
  }

  public Map<String, Objects> getObjects() {
    return myObjects;
  }

  /** Set scene's camera. */
  private void setCamera (XMLElement[] properties)
  {
    Map<String, Object> values = parse(properties);
    myCamera = new MyCamera((PVector)values.get("location"), 
    new Float((String)values.get("radius")), 
    new Float((String)values.get("theta")), 
    new Float((String)values.get("phi")));
  }

  /** Add a light to this scene. */
  private void addTable (XMLElement[] properties)
  {
    Map<String, Object> values = parse(properties);
    Table table = new Table((PVector)values.get("location"), (String)values.get("name"));
    myTables.add(table );
    addObject(table);
  }

  private void addCardDealer ( XMLElement[] properties)
  {
    Map<String, Object> values = parse(properties);
    CardDealer cd = new CardDealer((PVector)values.get("location"), (PVector)values.get("speed"), new Float((String)values.get("height")), (String)values.get("name"));
    println("carddealer made");
    println(cd.getName());
    myCardDealers.put(cd.getName(), cd);
    addObject(cd);
  }

  private void addRoom ( XMLElement[] properties)
  {
    Map<String, Object> values = parse(properties);
    myRoom = new Room((PVector)values.get("location"), (PVector)values.get("dimensions"), (String)values.get("name"));
    println("room made");
    println(myRoom.getName());
    addObject(myRoom);
  }

  /** Convert an XML string to component values. */
  private Map<String, Object> parse (XMLElement[] properties)
  {
    Map<String, Object> values = new HashMap<String, Object>();
    for (XMLElement p : properties)
    {
      String key = p.getName().toLowerCase();
      if (p.getContent() != null)
      {
        if (((String)(p.getContent())).split(" ").length == 1) values.put(key, (String)(p.getContent()));
        else {
          float[] nums = float(split(p.getContent(), " "));
          values.put(key, new PVector(nums[0], 
          nums.length > 1 ? nums[1] : 0, 
          nums.length > 2 ? nums[2] : 0));
        }
      }
      else
      {
        values.put(key, p.getString("ref").toLowerCase());
      }
    }
    return values;
  }
}

