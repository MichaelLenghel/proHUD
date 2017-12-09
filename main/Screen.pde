class Screen extends GameObject
{
  float screenBorderX, screenBorderY;
  
  Screen(float screenBorderX, float screenBorderY)
  {
    super(screenBorderX, screenBorderY);
  }
  void update()
  {
    
  }
  
  void sayHello()
  {
   println("Hello"); 
  }
  
  void render()
  {
    noStroke();
    rectMode(CORNER);
     //Below window
    rect(0,  height * 3 / 4, width, height / 2);
    float dis = (height * 0.75) - screenBorderY;
    
    fill(0);
    
    //Window
    rect(screenBorderX,  screenBorderY, width - (screenBorderX * 2), dis , 75);
    stroke(0, 255, 255);
  }
}