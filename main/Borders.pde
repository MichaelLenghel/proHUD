class Borders
{
  float bx, by, speed;
  
  Borders(float bx, float by,float speed)
  {
    this.bx = bx;
    this.by = by;
    this.speed = speed;
  }//end Borders
  
  Borders()
  {
    //Constructor Chaining
    this(10.0f, 10.0f, 10.0f);
  }//end Borders
  void render()
  {
    if(frameCount % 60 == 0)
    {
     stroke(random(0, 255), random(0, 255), random(0, 255)); 
     fill(random(0, 255), random(0, 255), random(0, 255)); 
    }//end if
    //No line
  }//end render
  
}//end class borders