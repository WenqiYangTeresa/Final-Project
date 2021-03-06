class myBox
{
  Body body; // this is the container for a body
  BodyDef bd; // this defines a type of physics body
  FixtureDef fd;
  float w, h; // the width and height i'm keeping
  float r, g, b, a;
  PImage c;
  

  int isboink;
       
  myBox(PImage _c, float x, float y, float _w, float _h)
  {
    //character = loadImage("sushi1.png");
    w = _w;
    h = _h;
    c = _c;
    isboink = 0;
    
    // make me a new body
    bd = new BodyDef();
    bd.type = BodyType.DYNAMIC; // it's gonna move
    bd.position.set(e.coordPixelsToWorld(x,y)); // this is where it starts
    body = e.createBody(bd); // registers it with the physics engine
    
    // this describes the shape of the thing
    PolygonShape ps = new PolygonShape();
    float box2dW = e.scalarPixelsToWorld(w/2);
    float box2dH = e.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dW, box2dH);
    
    // this makes the fixture
    fd = new FixtureDef();
    fd.shape = ps; // assigns the shape to the fixture
    
    // some parameters
    fd.density = 1.;
    fd.friction = 0.1;
    fd.restitution = 0.75;

    body.createFixture(fd);
    body.setLinearVelocity(new Vec2(random(-6, 10), random(-1, 1)));
    

    // you need this for collision detection!!!!
    body.setUserData(this);
   
  }
  
  void display()
  {
     Vec2 pos = e.getBodyPixelCoord(body); // find out where it is
     float angle = body.getAngle();
     
     pushMatrix();
     translate(pos.x, pos.y);
     rotate(-angle);
     fill(0);
     stroke(0);
     imageMode(CENTER);
     image(c, 0, 0, w, h);
     popMatrix();
  }
  void killBody()
  {
     e.destroyBody(body); 
  }

  void unboink()
  {
    isboink = 0;
  }

  void boink()
  {
    if (isboink==0) // new hit
    {

      playhalf();

        isboink=1;
    }
  }
}

