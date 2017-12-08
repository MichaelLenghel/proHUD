class Front extends GameObject
{
  boolean warpDrive;
  
  Front(boolean warpDrive)
  {
    super(warpDrive);
  }
  void update()
  {
    
  }
  
  void render()
  {
    noStroke();
    rectMode(CORNER);
    //Draw the panel at the bottom
     fill(133, 133, 133);
     //Below window
    rect(0,  height * 3 / 4, width, height / 2);
    float disLine = (height * 0.75) - screenBorderY;
    float disButton = (height * 0.85) - screenBorderY;
    fill(0);
    //Window
    //rect(screenBorderX,  screenBorderY, width - (screenBorderX * 2), dis , 75);
    stroke(0, 255, 255);
    line(0, disLine + 2, width, disLine + 2);
    //Draw the button to go into warp drive
    float buttonWidth = width / 4;
    float buttonHeight = height / 12;
    
    fill(0, 255, 0, 60);
    //Button to go into warp drive
    rectMode(CENTER);
    rect(width / 2, disButton,buttonWidth, buttonHeight, 75); 
    textSize(10);
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