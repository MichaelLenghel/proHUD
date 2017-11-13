class Background
{
  float roadMove = 1;
  float speed = 0.05;
  
  void initialiseBackground()
  {
    stroke(255, 0, 0);
    for (int i = 0; i < width / 6; i++)
    {
      line(width / 2, height / 2, i * 6, height);
    }//end for
    
    moveBackground();
  }//end initialiseBackground
  
  void moveBackground()
  {
    int i = height / 2;
    float y = 1;
    
    //Reset the lines
    if (roadMove > 2.25)
    {
      roadMove = 1;
    }//end if
    
    while (i < height)
    {
      //i always same, y changes
      line(0, i, width, i);
      i = i + int(y);
      
      y = y * 1.25 + roadMove;
    }//end height
    
    roadMove += speed;
  }//end moveBackground
  
}//end class background