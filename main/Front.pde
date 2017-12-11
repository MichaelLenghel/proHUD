class Front implements UI
{
  boolean warpDrive;
  float disLine;
  void warpCheck(boolean warpDrive)
  {
   this.warpDrive = warpDrive; 
  }
  
  void render()
  {
    noStroke();
    rectMode(CORNER);
    disLine = (height * 0.75) - screenBorderY;
    float disButton = (height * 0.85) - screenBorderY;
    //Draw the panel at the bottom
    fill(0, 0, 0);
     //Below window
    rect(0, height * 3 / 4, width, height / 2);
    fill(133,133,133);
    triangle(0, height * 0.1, 0, 0, 0.1 * width, 0);
    triangle(width, height * 0.1, width, 0, 0.9 * width, 0);
    rect(0, 0, width, height * 0.05);
    //Side panels
    //rect(0, 0, width, disLine);
    //rect(width * 0.09, 0, width * 0.01, disLine);
    
    rect(0,  height * 3 / 4, width, height / 2, 200, 200, 0, 0);
    
    fill(0);
    //Window
    //rect(screenBorderX,  screenBorderY, width - (screenBorderX * 2), dis , 75);
    stroke(0, 255, 255);
    line(0, disLine + 2, width, disLine + 2);
    //Draw the button to go into warp drive
    float buttonWidth = width / 4;
    float buttonHeight = height / 12;
    
    
    fill(211,211,211);
    //Button to go into warp drive
    rectMode(CENTER);
    rect(width / 2, disButton,buttonWidth, buttonHeight, 75); 
    float tSize = width / 40;
    textSize(tSize);
    textAlign(CENTER);
    fill(0, 255, 255);
    if(warpDrive == false)
    {
      text("Start warp Drive", width / 2, disButton);
    }
    
    else
    {
     text("Stop warp Drive", width / 2, disButton); 
    }
    
    drawBars();

  }

void drawBars()
  {
    float barBorderX = width * 0.3;
    float barBorderY = height * 0.85;
    float barWidth = width / 30;
    float barHeight = height / 5;
    float barLineX = barBorderX + barWidth;
    float barLineY = 0;

    stroke(255, 255, 255);

    float tSize = width / 60;
    textSize(tSize);
    textAlign(CORNER);
    //Temp meter
    rect(barBorderX, barBorderY, barWidth, barHeight);
    //Fuel meter
    rect(barBorderX * 2.2, barBorderY, barWidth, height / 5);

    
    for(int i = 0; i < 7; i ++)
    {
      barLineY = map(i, 0, 6, barBorderY, barBorderY + barHeight);
      //Draw lines for temp meter
      line(barBorderX, barLineY, barLineX, barLineY);
      //Draw lines for fuel meter
      line(barBorderX * 2.2, barLineY, (barBorderX * 2.2) + barWidth, barLineY);
      //rect(barBorderX, barLineY, width / 30, height / 5);
      if(warpDrive && i < 4)
      {

            fill(255, 0, 51);     
            rect(barBorderX, barLineY, width / 30, barHeight / 2);
            rect(barBorderX * 2.2, barLineY, barWidth, barHeight/ 2);
      }//end if warpDrivce
      
      else if(!warpDrive && i < 4)
      {
        fill(0, 255, 51);     
        rect(barBorderX, barLineY, width / 30, barHeight / 2);
        rect(barBorderX * 2.2, barLineY, barWidth, barHeight / 2);
      }
    }//end for loop

    fill(255, 255, 255);
    text("Temp", barBorderX - 5, barBorderY- 10);
    text("Fuel", (barBorderX * 2.2) - 5, barBorderY- 10);
  }
}