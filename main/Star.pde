class Star
{
 float x, y, z, screenBorderX, screenBorderY, dis, speed, lineX, lineY, lineZ;
 boolean warpPressed;
 boolean resource;
 PVector locationStar;
 PVector locationPod;
 float size;
 
 Star(float x, float y, float z, float screenBorderX, float screenBorderY)
 {
  dis = (height * 0.75) - screenBorderY;
  //map onto the screen
  this.x = x;
  this.y = y;
  this.z = z;
  locationStar = new PVector(x, y);
  lineZ = z;
  speed = 20;
  warpPressed = false;
  locationStar = new PVector(x, y);
  //Where the window goes up to in Front class
 }//end Star

 
 void update()
 {
    //essentially divides by a value that gets bigger and bigger
    z = z - speed;
   ////make the stars reappear
   if (z < 1)
   {
    z = width;
    x = random(-width, width);
    y = random(-height, height);
    //They are being connected to their previous locations when they get to the edge and this stops that
    lineX = x;
    lineY = y;
    lineZ = z;
   }
 }
 
 void render()
 {
   noStroke();
   //golden color
   fill(255,215,0);
   //Continually dividing by a number to give the appearence of 3D
   float cx = map(x / z, 0, 1, 0, width);
   float cy = map(y / z, 0, 1, 0, height);
   size = map(z, 0, width, 10, 0);

   locationStar = new PVector(x, y);
   //20 is the half of the pod. Hard coded :(
   if(locationStar.dist(locationPod) < 20)
   {
     println("We just touched a star fo size: " + size);
   }
   //Map x and y onto the screen
   ellipse(cx, cy, size, size);
   stroke(255);
   
   
   if (warpPressed)
   {
     speed = 30;
     float px =  map(x / lineZ, 0, 1, 0, width);
     float py =  map(y / lineZ, 0, 1, 0, height);
     lineX = z;
     line(px, py, cx, cy);
   }
   else
   {
     speed = 20;
   }
 }
 
 float checkIfTouched(float podX, float podY)
 {
   locationPod = new PVector(podX,podY);
   return(size);
 }
 
 void warp(boolean warpPressed)
 {
   this.warpPressed = warpPressed;
 }
}