class Pod extends GameObject
{
 PVector location;
 PVector velocity;
 PVector acceleration;
 float maxSpeed, radius;
 Resources resource;

  //Pod()
  //{
  //  super(1, 2, 3, 4);
  //}
  
  void overlaps()
  {
   println("Overlapped"); 
  }
 
 Pod(float x, float y, float radius, float maxSpeed)
 {
  super(x, y, radius, maxSpeed);
  location = new PVector(x, y);
  velocity = new PVector(0, 0);
  acceleration = new PVector(0, 0);
  this.maxSpeed = maxSpeed;
  this.radius = radius;
  resource = new Resources(0);
 }
 
 void update()
 {
   PVector mouse = new PVector(mouseX, mouseY);
   mouse.sub(location);
   //Sets the new length of the vector, shorter than normalizing to 1 and then multiplying
   mouse.setMag(0.5);
   acceleration = mouse;
   //acceleration = PVector.random2D();
   
   velocity.add(acceleration);
   location.add(velocity);
   //Doesn't let it gety over 5
   velocity.limit(maxSpeed);
   //Call resources
   
 }//end update
 
 void render()
 {
   float disLine = (height * 0.75) - screenBorderY;
   if(mouseY < disLine && location.y + (radius / 2) < disLine)
   {
     stroke(255, 0, 0);
     noFill();
     line(location.x, disLine, location.x, 0);
     line(0, location.y, width, location.y);
      rect(location.x, location.y, radius, radius);
     //for(int xg = 0 ; xg <= 5 ; xg ++)
     //{
     //  float pos = map(xg, 0, 2, location.x, width - location.x); 
      
     //  line(pos + location.x, border, pos + location.x, height - border);
     //  line(border, pos + location.y, width - border, pos + location.y);   
     //}  
   }
   
   
 }//end display
 
 void edges()
 {
   if (location.x > width)
   {
    location.x =  0;
    location.x = location.x * -1;
   }
   
   if (location.x < 0)
   {
    location.x =  width ;
    location.x = location.x * -1;
   }
   
   if (location.y > height)
   {
    location.y =  0;
    location.y = location.y * -1;
   }
   
   if (location.y < 0)
   {
    location.x =  height;
    location.y = location.y * -1;
   }
 }//end fxn
}