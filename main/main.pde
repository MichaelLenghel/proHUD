Radar radar1;
Borders border1;

ArrayList<Borders> borders = new ArrayList();
Drops[] drops = new Drops[50];

void setup()
{
  size(600, 600);
  radar1 = new Radar(width / 10, height / 10, 100, 1);
  for(int i = 0; i < drops.length; i++)
  {
    //Set the new arrays of type Drop
    drops[i] = new Drops();
  }//end for
}//end setup

void draw()
{
  background(255);
  radar1.render(); 
  radar1.update();
  for (int i = 0; i < drops.length; i++)
  {
    drops[i].render();
    drops[i].update();
  }//end for
 
}//end draw