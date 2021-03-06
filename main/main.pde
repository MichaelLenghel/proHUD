import ddf.minim.*;
Minim minim;
//Instaniate sound files
AudioPlayer flighterSound1, buttonClick, warpSound, windDown, startScreen;
//Warnings are entirely to do with an internal problem convering processing.sound library. Does not affect program. Possibly since not .wav files
ArrayList<GameObject> gameObjectsStart = new ArrayList<GameObject>();
ArrayList<GameObject> gameObjects2 = new ArrayList<GameObject>();
ArrayList<Star> starss = new ArrayList<Star>();
ArrayList<Budget > data = new ArrayList<Budget>();
int numStars, numOfObjDisplayOnPauseScreen;
boolean clicked = false;
boolean warpDrive;
boolean cycleChart = true;
//napTime is used to delay spaceShuttle song from playing for 1 second and allow a transition to occur before space shuttle enters
float screenBorderX = width / 30;
float screenBorderY = height / 30;
float chartCenterX;
float chartCenterY;
float max;
float disLine;
float[]sizeArray;
Snow[] snow = new Snow[50];
Front frontWarpCheck;
Screen screen;
Background background1;
Pod pod;
pieChart chart;

void setup()
{
  fullScreen();
  //size(600, 600);
  frameRate (60);
  numStars = 500;
  disLine = (height * 0.75) - screenBorderY;
  max = 0;
  sizeArray = new float[5];
  chartCenterX = width * 1/8;
  chartCenterY = height - (height / 8);
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
  
  gameObjectsStart.add(
    new Radar(width / 10, height / 10, 100, 1, false));
  gameObjectsStart.add(
    new Radar(width - width / 10, height / 10, 100, 1, false));
  gameObjects2.add(
    new Radar(width - width * 1/8, height - (height / 8), height / 6, 1, false));
  //Meter
  gameObjects2.add(
    new Meters(width - width * 1/6, height - (height / 8), height / 6, 1, "Fuel", false, 1));
  gameObjects2.add(
    new Meters(width * 1/6, height - (height / 8), height / 6, 1, "Temp", false, 2));
   //new Radar(width * 1/8, height - (height / 8), height / 6, 1, false));
  frontWarpCheck = new Front();
  screen = new Screen(screenBorderX, screenBorderY);
  pod = new Pod(width / 2, height / 2, 40.0f, 5.0f);
  chart = new pieChart(chartCenterX, chartCenterY, height / 6, 1);
  loadData();
  //We only want to display the two radars on the pause screen
  numOfObjDisplayOnPauseScreen = 2;
  int i;
  background1 = new Background();
  for(i = 0; i < snow.length; i++)
  {
    //Set the new arrays of type Drop
    snow[i] = new Snow();
  }//end for
  for(i = 0; i < numStars; i++)
  {
    starss.add(new Star(random(-width, width), random(-height, height), random(width), screenBorderX, screenBorderY));
  }//end for
  warpDrive = false;
}//end setup

void draw()
{
  float podX, podY;
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
    
    //Draw stars centered around width, we do this so when we zoom in to the center and we are not going towards the corners
    screen.render();
    screen.col(warpDrive);
     pushMatrix();
     translate(width / 2, height / 2);
     //0 for x
     podX = pod.overlaps(0);
     //1 for y
     podY = pod.overlaps(1);
    int j = 0;
    for(int i = starss.size() - 1 ; i >= 0  ; i --)
    {
      Star s = starss.get(i);
      float size = s.checkIfTouched(podX, podY);
      
      s.update();
      s.render();
      s.warp(warpDrive);
      //Add to array the size of the star we touched
      if(i > starss.size() - 6)
      {
        sizeArray[j] = size;
        j++;
      } 
    }
    popMatrix();
    //Displays front
    frontWarpCheck.render();
    frontWarpCheck.warpCheck(warpDrive);
    pod.update();
    pod.render();
    
    //Display Radars
    for(int i = gameObjects2.size() - 1 ; i >= 0  ; i --)
    {
      GameObject go2 = gameObjects2.get(i);    
    
      //We will remove the radars and change them to be red and faster during warp drive
      changeRadarsRemoveOther();
      go2.update();
      go2.render();
    }
    
    max = chart.render(max);
    if(cycleChart)
    {
      chart.getInfo(sizeArray);
    }
    text("Max: " + maxBudget + " Min: " + minBudget, width / 2, height * 0.04);
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
void changeRadarsRemoveOther()
{
  if(doOnce)
  {
    /*Deletes objects on screen so that we can put new ones over them for warping*/
    if(warpDrive)
    {
      //clears current radar
      gameObjects2.clear();
      //adds new radar, but will make it red and much faster
      gameObjects2.add(
        new Radar(width - width * 1/8, height - (height / 8), height / 6, 3, true));//True means we are in warp and do what we would expect
      gameObjects2.add(
        new Meters(width - width * 1/6, height - (height / 8), height / 6, 1, "Fuel", true, 1));
      gameObjects2.add(
        new Meters(width * 1/6, height - (height / 8), height / 6, 1, "Temp", true, 2));
    }
    
    else
    {
     //clears current radar
     gameObjects2.clear();
     gameObjects2.add(
        new Radar(width - width * 1/8, height - (height / 8), height / 6, 1, false));
     gameObjects2.add(
        new Meters(width - width * 1/6, height - (height / 8), height / 6, 1, "Fuel", false, 1));
     gameObjects2.add(
        new Meters(width * 1/6, height - (height / 8), height / 6, 1, "Temp", false, 2));
    doOnce = false;
    }//end else
  }//end if
}//end changeRadarsRemoveOther
  
void displayButton()
{
  float buttonWidth = width - (width / 4);
  float buttonHeight = height / 6;
  float borderX = (width / 2) - (buttonWidth / 2);
  float borderY = (height / 3)- (buttonHeight / 2) ;
  stroke (0, 255, 255, 150);
  fill(0, 255, 255, 200);
  //Center rectangle to make it easier 
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
  float diameter = (height - disLine ) / 1.5;
  float radius = diameter / 2;
  disLine = (height * 0.75) - screenBorderY;

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
      delay(1000);
    }
  }//end original if
  
  else
  {
    float warpWidth = width / 4;
    float warpHeight = height / 12;
    if (mouseX > (width / 2) - (warpWidth / 2) && mouseX <  (width / 2) + (warpWidth / 2)
      && mouseY > disButton - (warpHeight / 2) && mouseY < disButton + (warpHeight / 2)
      )
       //music associated with starting the warp drive
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
            //With the minim library you need to restart the music
            warpSound.rewind();
            warpDrive = false;
            doOnce = true;
            //warp
          }   
      }//end check where pressed if
      
    //Check if pie chart is clicked by checking if distance between mouse and circle is less than radius
    if (dist(chartCenterX, chartCenterY, mouseX, mouseY) < radius)
    {
      if(cycleChart == true)
      {
        cycleChart = false;
      }
      else
      {
        cycleChart = true;
      } 
    }//end if
  }//end else
}//end mousePressed
float maxBudget, minBudget;

 void loadData()
{
  Table t = loadTable("gdp.csv");
  for(int i = 0 ; i < t.getRowCount(); i ++)
  {
    TableRow row = t.getRow(i);
    Budget budget = new Budget(row);
    data.add(budget);
    
    /**Calculate the maxiumum and minimum budgets*/
    maxBudget = 0;
    minBudget = budget.amount;
    for (Budget b:data)
    {
      if (budget.amount < minBudget)
      {
        minBudget = budget.amount;
      }
      if (budget.amount > maxBudget)
      {
        maxBudget = budget.amount;
      }    
    }//end nested for
  }//end for
}