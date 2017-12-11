class Meters extends GameObject
{
  float barBorderX, barBorderY, frequency;
  String name;
  boolean warpDrive;
  Meters(float cx, float cy, float radius, float frequency, String name, boolean warpDrive)
  {
    super(cx, cy, radius, frequency);
    //Will give us the corner
    barBorderX = cx;
    barBorderY = cy;
    this.frequency = frequency;
    this.name = name;
    this.warpDrive = warpDrive;
  }
  
  void update()
  {
    float barWidth = width / 30;
    float barHeight = height / 5;
    float barLineX = barBorderX + barWidth;
    float barLineY = 0;
    
    fill(255, 255, 255);
    stroke(255, 255, 255);
    //Temp meter
    rect(barBorderX, barBorderY, barWidth, barHeight);

    //for(int i = 0; i < 7; i ++)
    //{
    //  barLineY = map(i, 0, 6, barBorderY, barBorderY + barHeight);
    //  //Draw lines for temp meter
    //  line(barBorderX, barLineY, barLineX, barLineY);
    //  //Draw lines for fuel meter
    //  line(barBorderX * 2.2, barLineY, (barBorderX * 2.2) + barWidth, barLineY);
    //  //rect(barBorderX, barLineY, width / 30, height / 5);
    //  if(warpDrive && i < 4)
    //  {

    //        fill(255, 0, 51);     
    //        rect(barBorderX, barLineY, width / 30, barHeight / 2);
    //        rect(barBorderX * 2.2, barLineY, barWidth, barHeight/ 2);
    //  }//end if warpDrivce
      
    //  else if(!warpDrive && i < 4)
    //  {
    //    fill(0, 255, 51);     
    //    rect(barBorderX, barLineY, width / 30, barHeight / 2);
    //    rect(barBorderX * 2.2, barLineY, barWidth, barHeight / 2);
    //  }
 //}//end for loop 
  }
  
  void render()
  {
    float tSize = width / 60;
    textSize(tSize);
    textAlign(CORNER);
    fill(255, 255, 255);
    //text(name, barBorderX - 5, barBorderY- 10);
    rect(cx, cy, 10, 10);
  }
}