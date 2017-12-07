

class Radar
{
  float cx, cy, radius, frequency, speed, theta;
  
  
  Radar(float cx, float cy, float radius, float frequency)
  {
    this.cx = cx;
    this.cy = cy;
    this.radius = radius;
    this.frequency = frequency;
    this.speed = (TWO_PI / 60.0) * frequency;
    this.theta = 0;
  }//endactualRadar
  
  void update()
  {
      theta += speed;
  }//end update
  
  void render()
  {
    stroke(0, 255, 0);
    noFill();
    int trailLength = 20;
    float greenIntensity = 255.0f / (float)trailLength;
    float x, y;
    ellipse(cx, cy, radius, radius);
    
      for(int i = 0; i < trailLength; i++)
      {
        stroke (0, greenIntensity * i, 0);
        x = cx + sin(theta + i * speed) * (radius / 2);
        y = cy - cos(theta + i * speed) * (radius / 2);
        line(cx, cy, x, y);
      }//end for
  }//end render
}//end actualRadar