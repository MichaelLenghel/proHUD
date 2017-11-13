Radar radar1, radar2;
Background background1;

ArrayList<Borders> borders = new ArrayList();
Snow[] snow = new Snow[50];

void setup()
{
  size(600, 600);
  radar1 = new Radar(width / 10, height / 10, 100, 1);
  radar2 = new Radar(width - (width / 10), height / 10, 100, 1);
  background1 = new Background();
  for(int i = 0; i < snow.length; i++)
  {
    //Set the new arrays of type Drop
    snow[i] = new Snow();
  }//end for
}//end setup

void draw()
{
  background(133,133,133);
  background1.initialiseBackground();
  radar1.render(); 
  radar1.update();
  radar2.render();
  radar2.update();
  for (int i = 0; i < snow.length; i++)
  {
    snow[i].render();
    snow[i].update();
  }//end for
 
}//end draw