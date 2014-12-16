void beginContact(Contact cp) {
  // Get both fixtures
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  // Get both bodies
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();

  // Get our objects that reference these bodies
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();
  int boxhitsword = 0;
  int boxhitshard = 0;
  
  if (o1.getClass() == myWall.class && o2.getClass() == myBox.class) boxhitsword = 1;
  if (o2.getClass() == myWall.class && o1.getClass() == myBox.class) boxhitsword = 2;
  if (o1.getClass() == myWall.class && o2.getClass() == fastBox.class) boxhitshard = 1;
  if (o2.getClass() == myWall.class && o1.getClass() == fastBox.class) boxhitshard = 2;
  
  if (boxhitsword==1)
  {
    myBox w = (myBox) o2;
    w.boink();
  } else if (boxhitsword==2)
  {
    myBox w = (myBox) o1;
    w.boink();
  }
   
   if(boxhitshard>0)
  {
 
    println("box hit brick!!!"); 
  }
  
  
  
}

// THIS HAPPENS WHEN THINGS STOP HITTING EACH OTHER
void endContact(Contact cp) {
  // Get both fixtures
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  // Get both bodies
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();

  // Get our objects that reference these bodies
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();
  int boxhitsword = 0;

  
  if (o1.getClass() == myWall.class && o2.getClass() == myBox.class) boxhitsword = 1;
  if (o2.getClass() == myWall.class && o1.getClass() == myBox.class) boxhitsword = 2;

  if (boxhitsword==1)
  {
    myBox w = (myBox) o2;
    w.unboink();
  } else if (boxhitsword==2)
  {
    myBox w = (myBox) o1;
    w.unboink();
  }

}

