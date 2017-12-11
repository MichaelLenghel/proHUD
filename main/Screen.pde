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
    float barLineX = barBorderX + (width / 30);
    float barLineY = 0;
    rectMode(CORNER);
     //Below window
    rect(0,  height * 3 / 4, width, height / 2);
    dis = (height * 0.75) - screenBorderY;
      
    
    //Window
    fill(0);
    rect(screenBorderX,  screenBorderY, width - (screenBorderX * 2), dis , 75);
   //Make background blue when we go into warpDrive
   if(warpDrive)
   {
        fill(0, 0, 194);
        rect(screenBorderX,  screenBorderY, width - (screenBorderX * 2), dis , 75);
   }//end if

    stroke(255, 255, 255, 150);
    
    float tSize = width / 60;
    textSize(tSize);
    textAlign(CORNER);
    //Temp meter
    rect(barBorderX, barBorderY, width / 30, height / 5);
    //Fuel meter
    rect(barBorderX * 2.2, barBorderY, width / 30, height / 5);

    
    for(int i = 0; i < 7; i ++)
    {
      barLineY = map(i, 0, 6, barBorderY, barBorderY + (height / 5));
      //Draw lines for temp meter
      line(barBorderX, barLineY, barLineX, barLineY);
      //Draw lines for fuel meter
      line(barBorderX * 2.2, barLineY, (barBorderX * 2.2) + width / 30, barLineY);
      //rect(barBorderX, barLineY, width / 30, height / 5);
      if(warpDrive && i < 4)
      {

            fill(255, 0, 51);     
            rect(barBorderX, barLineY, width / 30, (height / 5) / 2);
            rect(barBorderX * 2.2, barLineY, width / 30, (height / 5 / 2));
      }//end if warpDrivce
      
      else if(!warpDrive && i < 4)
      {
        fill(0, 255, 51);     
        rect(barBorderX, barLineY, width / 30, (height / 5) / 2);
        rect(barBorderX * 2.2, barLineY, width / 30, (height / 5 / 2));
      }
    }//end for loop

    fill(255, 255, 255);
    text("Temp", barBorderX - 5, barBorderY- 10);
    text("Fuel", (barBorderX * 2.2) - 5, barBorderY- 10);
  }
}