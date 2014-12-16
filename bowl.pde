class Surface
{
  ArrayList<Vec2> surface;

  Surface() {
    surface = new ArrayList<Vec2>();

    // This is what box2d uses to put the surface in its world
    ChainShape chain = new ChainShape();

    float theta = 0;
    
    // This has to go backwards so that the objects  bounce off the top of the surface
    // This "edgechain" will only work in one direction!
    for (float x = width/1.2; x >100 ; x -= 10) {

      // Doing some stuff with perlin noise to calculate a surface that points down on one side
      // and up on the other
      float y = map(cos(theta), -3, 0, 600, height/1.5);
      theta += 0.15;

      // Store the vertex in screen coordinates
      surface.add(new Vec2(x,y));

    }

    // Build an array of vertices in Box2D coordinates
    // from the ArrayList we made
    Vec2[] vertices = new Vec2[surface.size()];
    for (int i = 0; i < vertices.length; i++) {
      Vec2 edge = e.coordPixelsToWorld(surface.get(i));
      vertices[i] = edge;
    }
    
    // Create the chain!
    chain.createChain(vertices,vertices.length);

    // The edge chain is now attached to a body via a fixture
    BodyDef bd = new BodyDef();
    bd.position.set(0.0f,0.0f);
    Body body = e.createBody(bd);
    // Shortcut, we could define a fixture if we
    // want to specify frictions, restitution, etc.
    body.createFixture(chain,0);
    body.setUserData(this);
  }

  // A simple function to just draw the edge chain as a series of vertex points
  void display() {
    strokeWeight(3);
    stroke(250,80,155);
    noFill();
    beginShape();
    for (Vec2 v: surface) {
      vertex(v.x,v.y);
    }
    endShape();
  }

}

