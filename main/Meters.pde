class Meters extends GameObject
{
  float barBorderX, barBorderY, frequency, disLine;
  String name;
  boolean warpDrive;
  Meters(float cx, float cy, float radius, float frequency, String name, boolean warpDrive, int leftRight)
  {
    super(cx, cy, radius, frequency);
    //Will give us the corner
    disLine = (height * 0.75) - screenBorderY;
    this.frequency = frequency;
    this.name = name;
    this.warpDrive = warpDrive;
    //1 for left, 2 for right
    if(leftRight == 1)
    {
      barBorderX = cx - (cx * 0.2);
    }
    else if(leftRight == 2)
    {
      barBorderX = cx * 2;
    }
  }
  
    float barWidth;
    float barHeight;
    float barLineX;
    float barLineY;
  
  void update()
  {
    barWidth = width / 30;
    barHeight = height / 5;
    barLineX = barBorderX + barWidth;
    barLineY = 0;
    

    stroke(0, 255, 255);
    //Tmeter
    if(warpDrive)
    {
      fill(255, 0, 51);
      
    }
    else
    {
      fill(0, 255, 51);
    }
    rect(barBorderX, disLine + barHeight / 1.5, barWidth, barHeight);
    for(int i = 0; i < 7; i ++)
    {
      barLineY = map(i, 0, 6, disLine, disLine + barHeight);
      //Draw lines for meter
      line(barBorderX - (barWidth / 2), barLineY, barLineX - (barWidth / 2), barLineY);
      fill(0, 255, 51);
    }//end for loop 
  }
  
  void render()
  {
    float tSize = width / 100;
    textSize(tSize);
    noFill();
    textAlign(CENTER);
    text(name, barBorderX, disLine + barHeight / 7);
  }
}