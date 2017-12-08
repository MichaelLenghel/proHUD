import ddf.minim.*;


//Warnings are entirely to do with an internal problem convering processing.sound library. Does not affect program. Possibly since not .wav files
ArrayList<GameObject> gameObjectsStart = new ArrayList<GameObject>();
ArrayList<GameObject> gameObjectRadar = new ArrayList<GameObject>();
ArrayList<GameObject> gameObjects2 = new ArrayList<GameObject>();
ArrayList<Star> starss = new ArrayList<Star>();
int numStars;

Background background1;
PImage startButton;

/*sound here*/
//Creates the class
Minim minim;
//Instaniate 
AudioPlayer flighterSound1, buttonClick, warpSound, windDown, startScreen;

//namTime is used to delay spaceShuttle song from playing for 1 second and allow a transition to occur before space shuttle enters
int napTime, numOfObjDisplayOnPauseScreen;
//Both snow and star must have the same array size or will encounter problems below!
Snow[] snow = new Snow[50];
boolean clicked = false;
float screenBorderX = width / 30;
float screenBorderY = height / 30;
boolean warpDrive;
Front frontWarpCheck;

void setup()
{
  //fullScreen();
  size(600, 600);
  // Load the soundfile
  
  
  /*Sound stuff here*/
  minim = new Minim(this);
  flighterSound1 = minim.loadFile("flighterSound.mp3");
  buttonClick = minim.loadFile("startMenu.mp3");
  warpSound = minim.loadFile("warp.mp3");
  windDown = minim.loadFile("windDown.mp3");
  //Cool electromagnetic vibrations of planets in space and then mapped onto sound the our ears can hear
  startScreen = minim.loadFile("startSound.mp3");
  //Notes:
  //playerloop(); to play for ever, player.play() to play once, player.rewind() to bring bck to start, player.pause will stop file from playing.
  
  frontWarpCheck = new Front(warpDrive);
  napTime = 1000;
  gameObjectsStart.add(
    new Radar(width / 10, height / 10, 100, 1, false));
  gameObjectsStart.add(
    new Radar(width - width / 10, height / 10, 100, 1, false));
    /**Order is extremely important in the elements before, it dictates what goes over what in draw*/
    //Screen is first element in gameObjects2, its vvital that an element is not added before it as it will cause an error where we loop it will display incorrectly
   gameObjects2.add(
    new Screen(screenBorderX, screenBorderY));
   gameObjects2.add(
    new Pod(width / 2, height / 2, 40.0f, 5.0f));
   gameObjectRadar.add(
    new Radar(width - width * 1/8, height - (height / 8), height / 6, 1, false));
  gameObjectRadar.add(
   new Radar(width * 1/8, height - (height / 8), height / 6, 1, false));
  gameObjects2.add(
    new Front(warpDrive));
   //Radar on ship

    //We only want to display the two radars on the pause screen
   numOfObjDisplayOnPauseScreen = 2;
   int i;
  background1 = new Background();
  for(i = 0; i < snow.length; i++)
  {
    //Set the new arrays of type Drop
    snow[i] = new Snow();
  }//end for
  
  numStars = 350;
  for(i = 0; i < numStars; i++)
  {
    starss.add(new Star(random(-width, width), random(-height, height), random(width), screenBorderX, screenBorderY));
  }//end for
  warpDrive = false;
}//end setup

void draw()
{
   
  if (clicked)
  {
    background(255,215,0);
    gameObjectsStart.clear();
    startScreen.pause();
    //Remember to change clicked and delay to false and uncomment this when you demo!!!!//Remember to change clicked to false and uncomment this when you demo!!!!//Remember to change clicked to false and uncomment this when you demo!!!!
    flighterSound1.play();
    //Restarts it afrter  it ends
    if(flighterSound1.position() == flighterSound1.length())
    {
      flighterSound1.rewind();
      flighterSound1.play();
    }

    //Display screen. Must be first element or it will be behind the screen
    GameObject go2 = gameObjects2.get(0);
    go2.update();
    go2.render();
    
    //Draw stars centered around width, we do this so when we zoom in to the center and we are not going towards the corners
    pushMatrix();
    translate(width / 2, height / 2);
    for(int i = starss.size() - 1 ; i >= 0  ; i --)
    {
      Star s = starss.get(i);
      s.update();
      s.render();
      s.warp(warpDrive);
    }
    popMatrix();
    
    //Display front. We only go down to 1 as (0) the first element is the screen and we don't want to display that
     for(int i = gameObjects2.size() - 1 ; i >= 1  ; i --)
    {
      go2 = gameObjects2.get(i);
      //We will remove the radars and change them to be red and faster during warp drive
      changeRadars();
      go2.update();
      go2.render();
    }
    //Display Radars
    for(int i = gameObjectRadar.size() - 1 ; i >= 0  ; i --)
    {
      go2 = gameObjectRadar.get(i);
      //We will remove the radars and change them to be red and faster during warp drive
      changeRadars();
      go2.update();
      go2.render();
    } 
  }//end if clicked
  
  else
  {
   background(0,0,0);
   startScreen.play();
   background1.initialiseBackground();
   
   //Iterate backwards just to be safe
   //We only want to display the two radars on the pause screen
   for(int i =  gameObjectsStart.size() - 1 ; i >= 0  ; i --)
  {
    GameObject go = gameObjectsStart.get(i);
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

//We want to only change radars when warpDrive is called, not every frame.
boolean doOnce = false;
void changeRadars()
{
  if(doOnce)
  {
      //will find the elements in the radar class
    if(warpDrive)
    {
      //clears current radar
      gameObjectRadar.clear();
      //adds new radar, but will make it red and much faster
      gameObjectRadar.add(
        new Radar(width - width * 1/8, height - (height / 8), height / 6, 3, true));//True means we are in warp and do what we would expect
      gameObjectRadar.add(
        new Radar(width * 1/8, height - (height / 8), height / 6, 3, true));
    }
    
    else
    {
      gameObjectRadar.clear();
      gameObjectRadar.add(
        new Radar(width - width * 1/8, height - (height / 8), height / 6, 1, false));
      gameObjectRadar.add(
        new Radar(width * 1/8, height - (height / 8), height / 6, 1, false));
    }
    doOnce = false;
  }

}
  
void displayButton()
{
  float buttonWidth = width - (width / 4);
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
  //All for clicking button
  float buttonWidth = width - (width / 4);
  float buttonHeight = height / 6;
  float borderX = width / 2 - buttonWidth / 2;
  float borderY = height / 3 - buttonHeight / 2;
  float disButton = (height * 0.85) - screenBorderY;
  
  //Allows you to start the game!
  if(clicked == false)
  {
    if (mouseX > borderX && mouseX < borderX + buttonWidth
    && mouseY > borderY && mouseY < borderY + buttonHeight
    )
    {
      clicked = true;
      buttonClick.play();
      background(0, 0, 0);
      delay(napTime);
    }
  }//end original if
  
  else
  {
    float warpWidth = width / 4;
    float warpHeight = height / 12;
    if (mouseX > (width / 2) - (warpWidth / 2) && mouseX <  (width / 2) + (warpWidth / 2)
      && mouseY > disButton - (warpHeight / 2) && mouseY < disButton + (warpHeight / 2)
      )
     
      {
          //Will add a cool warp sound
          if(warpDrive == false)
          {
            warpSound.play();
            windDown.rewind(); 
            //Repeat warp drive
            if(warpSound.position() == warpSound.length())
            {
                warpSound.rewind();
                warpSound.play();
            }//end warp sound
            warpDrive = true;
            doOnce = true;
          }
          else
          {
            windDown.play(); 
            warpSound.pause();
            warpSound.rewind();
            warpDrive = false;
            doOnce = true;
            //warp
          }   
      }//end check where pressed if
  }
}//end mousePressed