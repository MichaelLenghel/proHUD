abstract class GameObject
{
  PVector pos;
  PVector forward;
  float radius, frequency, cx, cy;
  boolean warp;
  
  GameObject(float cx, float cy, float radius, float frequency)
  {
    this.cx = cx;
    this.cy = cy;
    this.radius = radius;
    this.frequency = frequency;
  }
  
  void sayHello()
  {
   Pod pods = new Pod();
   pods.sayHello(); 
   
  }
  abstract void render();
  abstract void update();
}//end