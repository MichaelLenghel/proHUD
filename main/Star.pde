class Star
{
 float x, y, z, screenBorderX, screenBorderY, dis, speed, lineX, lineY;
 boolean warpPressed;
 
 Star(float x, float y, float z, float screenBorderX, float screenBorderY)
 {
  dis = (height * 0.75) - screenBorderY;
  //map onto the screen
  this.x = x;// map(x, 0, width, screenBorderX + 10, width - (screenBorderX * 2 - 10));
  this.y = y;// map(y, 0, height, screenBorderY + 10, dis - 10);
  this.z = z; //map(width, 0, width, screenBorderX + 10, width - (screenBorderX * 2 - 10)); 
  speed = 10;
  warpPressed = false;
  //Where the window goes up to in Front class
 }//end Star
 
 void warp(boolean warpPressed)
 {
   this.warpPressed = warpPressed;
 }
 
 void update()
 {
   //Distance to the bottom of the screen
  //if (x < screenBorderX + 10 || x > width - (screenBorderX * 2 - 10)|| y <  screenBorderY + 10 || y > dis - 10)
  //  {
  //    starss.remove(this);
  //    x = random(screenBorderX + 10, width - (screenBorderX * 2 - 10));
  //    y = random(screenBorderY + 10, dis - 10);
  //  }
    //essentially divides by a value that gets bigger and bigger
    z = z - speed;
   ////make the stars reappear
   if (z < 1)
   {
    //z = map(width, 0, width, screenBorderX + 10, width - (screenBorderX * 2 - 10));
   // random(screenBorderX + 10, width - (screenBorderX * 2 - 10));
    //random(screenBorderY + 10, dis - 10);
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
 
 //void applyToRadar(Radar radar)
 //{
 //  radar.frequency += 10;
 //}
}