import processing.sound.*;

Radar radar1, radar2;
Background background1;

//ArrayList<Borders> borders = new ArrayList();
PImage startButton;
SoundFile sound; 

Snow[] snow = new Snow[50];
boolean clicked = false;
boolean radarMove = true;

void setup()
{
  //fullScreen();
  size(600, 600);
  // Load the soundfile
  sound = new SoundFile(this, "startMusic.wav");
  
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
 
  if (clicked)
  {

  }//end if clicked
  
  else
  {
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
    displayButton();
  }//end if hasn't been clicked yet
}//end draw
  
void displayButton()
{
  float buttonWidth = width - (width / 3);
  float buttonHeight = height / 6;
  float borderX = (width / 2) - (buttonWidth / 2);
  float borderY = (height / 3)- (buttonHeight / 2) ;
  stroke (0, 255, 255);
  fill(0, 255, 255);
  //Center rectangle to make it easier 
  //rectMode(CENTER);
  rect(borderX , borderY, buttonWidth, buttonHeight);
  fill(255, 110, 25);
  textAlign(CENTER);
  float textWidth = map(4, 0, width, borderX, width - borderX);
  textSize(textWidth / 4);
  
  text("Enter starfighter", width / 2, height / 3);
}

void mousePressed()
{
  float buttonWidth = width - (width / 3);
  float buttonHeight = height / 6;
  float borderX = width / 2 - buttonWidth / 2;
  float borderY = height / 3 - buttonHeight / 2;
  if (mouseX > borderX && mouseX < borderX + buttonWidth
    && mouseY > borderY && mouseY < borderY + buttonHeight
    )
    {
      clicked = true;
      sound.play();
    }
}