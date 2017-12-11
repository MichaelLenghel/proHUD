class Radar extends GameObject
{
  float cx, cy, radius, frequency, speed, theta;
  boolean col = false;
  
  Radar(float cx, float cy, float radius, float frequency, boolean col)
  {
    super(cx, cy, radius, frequency); 
    this.cx = cx;
    this.cy = cy;
    this.radius = radius;
    this.frequency = frequency;
    this.speed = (TWO_PI / 60.0) * frequency;
    this.theta = 0;
    this.col = col;
  }//endactualRadar
  
  void update()
  {
      theta += speed;
  }//end update
  
  //void changeRadarFrequency(float frequency)
  //{
  //  this.frequency = frequency;
  //}
  
  void render()
  {
    stroke(0, 255, 0);
    noFill();
    int trailLength = 10;
    float greenIntensity = 255.0f / (float)trailLength;
    float blueIntensity = 255.0f / (float)trailLength;
    float x, y;
    ellipse(cx, cy, radius, radius);
    
      for(int i = 0; i < trailLength; i++)
      {
        if(!col)
        {
          trailLength = 10;
          stroke (0, greenIntensity * i, 0);
        }
        else
        {
          trailLength = 20;
          stroke (0, 0, blueIntensity * i);
        }
        
        x = cx + sin(theta + i * speed) * (radius / 2);
        y = cy - cos(theta + i * speed) * (radius / 2);
        line(cx, cy, x, y);
      }//end for
  }//end render
}//end actualRadar