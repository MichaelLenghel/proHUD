abstract class GameObject
{
  PVector pos;
  PVector forward;
  float radius, frequency;
  
  GameObject(float x, float y, float radius, float frequency)
  {
    pos = new PVector(x, y);
    this.radius = radius;
    this.frequency = frequency;
    forward = new PVector(0, -1);
  }
  
  abstract void render();
  abstract void update();
}//end