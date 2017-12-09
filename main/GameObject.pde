abstract class GameObject
{
  PVector pos;
  PVector forward;
  float radius, frequency, cx, cy;
  int numResources;
  boolean warp;
  
  GameObject(float cx, float cy, float radius, float frequency)
  {
    this.cx = cx;
    this.cy = cy;
    this.radius = radius;
    this.frequency = frequency;
  }
  
  GameObject(int numResources)
  {
   this.numResources = numResources; 
  }
  
  //void overlaps()
  //{
  // Pod pods = new Pod();
  // pods.overlaps(); 
  //}
  
  abstract void render();
  abstract void update();
}//end