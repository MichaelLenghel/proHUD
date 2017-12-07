class Snow
{
  float x = random(0, width), y = random(0, height); 
  float downwardsSpeed = random(1.0f, 3.0f);
  
  void update()
  {
    y += downwardsSpeed;
    if(y > height)
    {
      y = random(-15, 10);
    }//end if
  }//end update
  
  void render()
  {
    stroke(0, 255, 255);
    line(x, y, x, y + 5);
    ellipse(x, y, 5, 5);
  }//end render
}//end Drops