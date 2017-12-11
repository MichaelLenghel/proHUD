class Pod
{
 PVector location;
 PVector velocity;
 PVector acceleration;
 float maxSpeed, radius;
  
  //Returns the exact location of this pod so that we can check if it goes over a star
  float overlaps(float check)
  {
    //If 0 then it is x
    if(check == 0)
    {
      check = location.x;
    }
    
    else
    {
       check = location.y;
    }
    return(check);
  }
 
 Pod(float x, float y, float radius, float maxSpeed)
 {
  location = new PVector(x, y);
  velocity = new PVector(0, 0);
  acceleration = new PVector(0, 0);
  this.maxSpeed = maxSpeed * 2;
  this.radius = radius;
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
 }//end update
 
 void render()
 {
   float disLine = (height * 0.75) - screenBorderY;
   if((location.y < disLine && location.y + (radius / 2) < disLine) || location.y < height * 0.05)
   {
     stroke(255, 0, 0);
     noFill();
     line(location.x, disLine, location.x, 0);
     line(0, location.y, width, location.y);
     rect(location.x, location.y, radius, radius); 
     noCursor();
   }
   else
   {
     stroke(255, 0, 0);
     noFill();
     line(location.x, disLine, location.x, 0);
     line(0, disLine - radius, width, disLine - radius);
     rect(location.x, disLine - radius, radius, radius); 
    cursor(); 
   }
 }//end render
 
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