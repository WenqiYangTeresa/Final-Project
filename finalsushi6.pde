import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

import ddf.minim.*;

Box2DProcessing e;
ArrayList<fastBox> fastbox;
ArrayList<myBox> theboxes;
ArrayList<myWall> thewalls;

float FRICTION = 0.4; 
int i;


Surface surface;

  int numFrames = 6;
  int frame = 0;
  PImage[] characters = new PImage[numFrames];
  
Minim minim; // audio engine
AudioPlayer[] groove = new AudioPlayer[1];
     
void setup()
{
  size(600, 600, OPENGL);
  
  
  e = new Box2DProcessing(this); 
  e.createWorld(); 
  e.setGravity(0, -10); 
  e.listenForCollisions();
  
  fastbox  = new ArrayList<fastBox>();
  theboxes = new ArrayList<myBox>();
  thewalls = new ArrayList<myWall>();
  surface  = new Surface();
  
  
  myWall bottom1 = new myWall(width/6, height, width/3, 10);
  thewalls.add(bottom1);
  myWall bottom2 = new myWall(5*width/6, height, width/3, 10);
  thewalls.add(bottom2);
  myWall top1 = new myWall(width/6, 0, width/3, 10);
  thewalls.add(top1);
  myWall top2 = new myWall(5*width/6, 0, width/3, 10);
  thewalls.add(top2);
  myWall right = new myWall(width, height/2, 10, height);
  thewalls.add(right);
  myWall left = new myWall(0, height/2, 10, height);
  thewalls.add(left);

     characters [0] = loadImage("sushi2.png");
     characters [1] = loadImage("sushi3.png");
     characters [2] = loadImage("sushi5.png");
     characters [3] = loadImage("sushi7.png");
     characters [4] = loadImage("sushi8.png");
     characters [5] = loadImage("sushi9.png");

     
  minim = new Minim(this);
  for (int i = 0; i<groove.length; i++)
  {
    groove[i] = minim.loadFile("comical.mp3",2048);
  }

 }


void draw()
{
  background(255, 255, 255);
  e.step(); // advances the physics engine one frame
 
 for (i=0; i<fastbox.size (); i++)
  {
    fastbox.get(i).display();
  }
  
  for (i=0; i<theboxes.size(); i++)
  {
    theboxes.get(i).display();
  }
  
  for (i=0; i<thewalls.size (); i++)
  {
    thewalls.get(i).display();
  }
  
  surface.display();
}


void mousePressed()
{
  myBox temp = new myBox(characters [frame], random(width/2.3, width/2), 0, 40, 40);
  theboxes.add(temp);
   frame ++; 
       if (frame == numFrames) {
       frame = 0;
     }
}

void keyReleased()
{
  fastBox hard = new fastBox(random(width/2.3, width/2), 0, 30, 30);
  fastbox.add(hard);

}


