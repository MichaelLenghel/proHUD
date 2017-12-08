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
  
  //Must have for Front since it extends gameObject
  GameObject(float screenBorderX, float screenBorderY)
  {
    
  }
  
  GameObject(float frequency)
  {
    this.frequency = frequency;
  }
  
  //Will change speed of radar
  void changeRadarFrequency(float frequency)
  {
    this.frequency = frequency;
    println(frequency);
  }
  
  GameObject(boolean warp)
  {
    
  }
  
  abstract void render();
  abstract void update();
}//end