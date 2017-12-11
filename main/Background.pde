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
    instructions();
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
  
  void instructions()
  {
    float tSize = width / 40;
    textSize(tSize * 2);
    textAlign(CENTER);
    fill(0, 255, 255);
    textSize(tSize);
    text("You are a", width / 2, height * 0.6);
    text("star explorer.", width / 2, height * 0.65);
    text( "You are tasked", width / 2, height * 0.7);
    text("with finding", width / 2, height * 0.75);
    text(" the biggest stars", width / 2, height * 0.8);
    text("in the galaxy.", width / 2, height * 0.85);
    stroke(255, 255, 255);
    text("FOR ETERNITY.", width / 2, height * 0.95);
  }
}//end class background