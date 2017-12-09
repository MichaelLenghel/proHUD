class Star
{
 float x, y, z, screenBorderX, screenBorderY, dis, speed, lineX, lineY;
 boolean warpPressed;
 
 Star(float x, float y, float z, float screenBorderX, float screenBorderY)
 {
  dis = (height * 0.75) - screenBorderY;
  //map onto the screen
  this.x = x;
  this.y = y;
  this.z = z;
  speed = 10;
  warpPressed = false;
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
   }
 }
 
 void render()
 {
   float cx = map(x / z, 0, 1, 0, width);
   float cy = map(y / z, 0, 1, 0, height);
   float size = map(z, 0, width, 10, 0);
   //golden color
   fill(255,215,0);
   noStroke();
   //Map x and y onto the screen
   ellipse(cx, cy, size, size);
   //Display the resources
   
   stroke(255);
   line(lineX, lineY, cx, cy);
   if (warpPressed)
   {
     //gets the lines to  follow
     lineX = x;
     lineY = y;
   }
   
   else
   {
     //resets it so that it goes normally
     lineX = cx;
     lineY = cy;
   }
 }
 
 void warp(boolean warpPressed)
 {
   this.warpPressed = warpPressed;
 }
}