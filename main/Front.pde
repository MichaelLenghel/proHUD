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
    float dis = (height * 0.75) - screenBorderY;
    fill(0);
    //Window
    //rect(screenBorderX,  screenBorderY, width - (screenBorderX * 2), dis , 75);
    stroke(0, 255, 255);
    line(0, dis + 2, width, dis + 2);
    //Draw the button to go into warp drive
    float buttonWidth = width / 3;
    float buttonHeight = height / 10;
    
    fill(0, 255, 0, 60);
    //Button to go into warp drive
    rectMode(CENTER);
    rect(width / 2, dis + (buttonWidth / 4),buttonWidth, buttonHeight, 75); 
    textSize(10);
    textAlign(CENTER);
    fill(0, 255, 255);
    if(warpDrive == false)
    {
      text("Start warp Drive", width / 2, dis + (buttonWidth / 4));
    }
    
    else
    {
     text("Stop warp Drive", width / 2, dis + (buttonWidth / 4)); 
    }
    
  }
}