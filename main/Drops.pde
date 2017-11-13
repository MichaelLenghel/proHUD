class Drops
{
  float speed;
  float x = random(0, width), y = random(0, height), z; 
  float downwardsSpeed = 1.0f;
  
  Drops()
  {
    
  }//end Drops
  
  void update()
  {
    y = y + downwardsSpeed;
  }//end update
  
  void render()
  {
    line(x, y, x, y + 5);
  }//end render
}//end Drops