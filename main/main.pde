import processing.sound.*;
//Warnings are entirely to do with an internal problem convering processing.sound library. Does not affect program. Possibly since not .wav files
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();

Background background1;
PImage startButton;
SoundFile sound; 
SoundFile flighterSound;
//namTime is used to delay spaceShuttle song from playing for 1 second and allow a transition to occur before space shuttle enters
int napTime;
Snow[] snow = new Snow[50];
boolean clicked = false;

void setup()
{
  //fullScreen();
  size(600, 600);
  // Load the soundfile
  sound = new SoundFile(this, "startMenu.mp3");
  flighterSound = new SoundFile(this, "flighterSound.mp3");
  napTime = 1000;
  gameObjects.add(
    new Radar(width / 10, height / 10, 100, 1));
  gameObjects.add(
    new Radar(width - (width / 10), height / 10, 100, 1));
    
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
    //Strater flighter track
    delay(napTime);
    flighterSound.loop();
  }//end if clicked
  
  else
  {
    
   background1.initialiseBackground();
   
   //Iterate backwards just to be safe
   for(int i = gameObjects.size() - 1 ; i >= 0  ; i --)
  {
    GameObject go = gameObjects.get(i);
    go.update();
    go.render();
  }
  
    for (int i = 0; i < snow.length; i++)
    {
      snow[i].render();
      snow[i].update();
    }//end for
    //Displays button on startup screen
    displayButton();
  }//end if hasn't been clicked yet
}//end draw
  
void displayButton()
{
  float buttonWidth = width - (width / 3);
  float buttonHeight = height / 6;
  float borderX = (width / 2) - (buttonWidth / 2);
  float borderY = (height / 3)- (buttonHeight / 2) ;
  stroke (0, 255, 255, 150);
  fill(0, 255, 255, 200);
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
      background(0, 0, 0);
      delay(napTime);
    }
}