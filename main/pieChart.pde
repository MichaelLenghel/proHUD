class pieChart
{
  float cx, cy, radius, frequency, speed, theta, total;
  float[] sizeArray;
  float disLine;
 pieChart(float cx, float cy, float radius, float frequency)
 {
   this.cx = cx;
   this.cy = cy;
   this.radius = radius;
   this.frequency = frequency;
   this.sizeArray = new float[5];
   //arrayCopy(sizeArr, sizeArray, 10);
   //Set defaults for array at start
   for(int i = 0; i < sizeArray.length; i++)
   {
     sizeArray[i] = i;
   }
   disLine = (height * 0.75) - screenBorderY;
 }
 
 void getInfo(float[] sizeArr)
 {
   arrayCopy(sizeArr, sizeArray, 5);
 }
 
 void render()
 {
   //Find total of the size array
   total = 0;
   for(int i = 0; i < sizeArray.length; i++)
   {
     total = total + sizeArray[i];
   }
   //Find the largest size
   float max = sizeArray[0];
   for(int i = 1; i < sizeArray.length; i++)
   {
     if (sizeArray[i] > max)
     {
        max = sizeArray[i];
     }
   }
   float thetaPrev = 0;
   for(int i = 0; i <  sizeArray.length; i++)
    {
      // get the theata angle
      float theta = map(sizeArray[i], 0, total, 0, TWO_PI);
      textAlign(CENTER);
      //col gives us a neat color within a certain range
      float col = map(sizeArray[i], 0, max, 255, 100 );
      float thetaNext = thetaPrev + theta;
      
      float radius = cx * 0.9f;
      
      float x = cx + sin(thetaPrev + (theta / 2) + HALF_PI) * radius;
      float y = cy - cos(thetaPrev + (theta / 2) + HALF_PI) * radius;
      
      
      fill(255);
      if(sizeArray[i] > 1 && sizeArray[i] < 3)
      {
        text("Neon Stars", x, y);
      }
      
      else if(sizeArray[i] > 3  && sizeArray[i] < 6)
      {
        text("Neomonian Stars", x, y);
      }
      
      else if(sizeArray[i] > 6 && sizeArray[i] < 8)
      {
        text("Omega Stars", x, y);
      }
      
      else if (sizeArray[i] > 8)
      {
        text("Mega star", x, y);
      }
      
      
      stroke(0, col, col);
      fill(0, col, col);
      float size = height - disLine;
      arc(cx, cy, size / 1.5, size / 1.5, thetaPrev, thetaNext);
      thetaPrev = thetaNext;
    }
 }
}