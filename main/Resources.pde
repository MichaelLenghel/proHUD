//Is displayed from the class star since it focus on interacting with only class star
class Resources 
{
  int resources;
  float x, y, z, screenBorderX, screenBorderY;
  PVector locationPod;
  PVector locationResource;
  
  Resources(int resources)
  {
    this.resources = resources;
    z = width;
    x = random(-width, width);
    y = random(-height, height);
  }
  
  //Will get position of pod
  void pos(PVector locationPod)
  {
    this.locationPod = locationPod;
  }
  
  void update()
  {
    //will find if resource == pod
    //if(dist(locationPod.x, locationPod.y, locationResource.x, locationResource.y < 40))
   // {
      //resources++;
      //Update pie chart
    //}//end if
  }
  
  void render()
  {
    float tSize = width / 30;
    textSize(tSize);
    text("Number of resources collected: " + resources, width / 2, height * 0.95);
    //Make pie chart
  }
  
  void createResources()
  {
   locationResource = new PVector(random(0, 9), random(0, 9)); 
  }
}