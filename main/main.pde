Radar radar1;
Borders border1;

ArrayList<Borders> borders = new ArrayList();

void setup()
{
  size(800, 800);
  radar1 = new Radar(width / 10, height / 10, 100, 1);
  setupShapes();
}//end setup

void setupShapes()
{
  borders.clear();
  //border1 = new Borders(width / 2, height / 2, 100.0f, 100.0f, 3.0f);
  borders.add(new Square(width / 8.0f, height /8.0f, 100.0f, 100.0f, 1.0f));
}//end void

void draw()
{
  background(0);
  radar1.render(); 
  radar1.update();
}//end draw