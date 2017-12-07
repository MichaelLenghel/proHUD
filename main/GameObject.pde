abstract class GameObject
{
  PVector pos;
  PVector forward;
  float radius, frequency, cx, cy;
  
  GameObject(float cx, float cy, float radius, float frequency)
  {
    this.cx = cx;
    this.cy = cy;
    this.radius = radius;
    this.frequency = frequency;
  }
  
  abstract void render();
  abstract void update();
}//end