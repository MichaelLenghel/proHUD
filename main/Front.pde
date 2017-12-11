class Front implements UI
{
  boolean warpDrive;
  
  void warpCheck(boolean warpDrive)
  {
   this.warpDrive = warpDrive; 
  }
  
  void render()
  {
    noStroke();
    rectMode(CORNER);
    float disLine = (height * 0.75) - screenBorderY;
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
  }
}