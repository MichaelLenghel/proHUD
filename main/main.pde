Radar radar1;

void setup()
{
  size(500, 500);
  radar1 = new Radar(width / 10, height / 10, 100, 1);
}//end setup

void draw()
{
  background(0);
  radar1.render();
  radar1.update();
}//end draw