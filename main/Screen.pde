class Screen implements UI
{
  float screenBorderX, screenBorderY, dis;
  boolean warpDrive;
  
  Screen(float screenBorderX, float screenBorderY)
  {
    this.screenBorderX = screenBorderX;
    this.screenBorderY = screenBorderY;
  }
  
  void col(boolean warpDrive)
  {
   this.warpDrive = warpDrive;
  }
  
  void render()
  {
    noStroke();
    float barBorderX = screenBorderX + (screenBorderX * 8);
    float barBorderY = screenBorderY + (screenBorderY * 106);
    rectMode(CORNER);
     //Below window
    //rect(0,  height * 3 / 4, width, height / 2);
    dis = (height * 0.75) - screenBorderY;
      
    
    //Window
    fill(0);
    rect(0,  0, width, dis);
   //Make background blue when we go into warpDrive
   if(warpDrive)
   {
      fill(0, 0, 194);
      rect(0,  0, width, dis);
   }//end if
  }
}