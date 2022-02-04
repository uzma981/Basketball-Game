Player player;
Whistle w1, w2;
//global variables
PImage background;
int y=0; 
int gameMode;
PImage startImg;
PImage gameOverimg;
int score=0;

boolean gameOver;
int x_pos;
int lives;
int speedX;
int speedY;

Obstacle [] obstacles = new Obstacle [4]; //array list for obstacles
Points [] hoops= new Points[5];// array for the points which are hoops
int [] location ={50, 200, 350, 500, 650}; //location for the hoops


void setup()
{
  size(1000, 1000);// size of the canvas

  background = loadImage("basketballcourt.jpg");// loads the background image during the game
  background.resize(width, height);
  startImg=loadImage ("gameImage.jpg");// loads the start image for the intro
  startImg.resize(width, height);
  gameOverimg=loadImage ("gameOver.jpg");// game over Image 
  gameOverimg.resize(width, height);
  player= new Player (380, 40);// player is given a fixed inital position of x and y to start the game
  w1= new Whistle(500, 1000, 5);
  w2=new Whistle (200, 1000, 6);
  score=0;
  lives=3;// lives have been set to 3



  //local variable
  int x=100; //x positioning of the obstacle
  int speedY= 2;//local variable for the for loop of the obstacles




  for (int i=0; i<obstacles.length; i++)

  {
    obstacles[i]=new Obstacle(x, 1000, speedY);
    x+=200;// x value will increase by 200
    speedY+=2;// speed will increase by 2 for the obstacles.
  }


  for (int i=0; i<hoops.length; i++)

  {
    hoops[i]=new Points(location[(int) random (0+i, 1+i)], ((int)random(500, 800)), ((int)random(4, 6)));
  }
}


void gameOver()// gover over screen
{


  imageMode(CENTER);// places the start image from the center
  image (gameOverimg, width/2, height/2);// actual position
  text("Game Over! Press SPACE to Restart Game!", 200, 500);// game Over message in the middle of the screen
  textSize(32);    
  text("Score: " + score, 400, 400);//appear score message. 
  fill(255);

  if (keyPressed) {// when the space key is pressed the game will return back to the setup and game mode will be 1
    if (key == ' ') {
      setup();
      gameMode = 1;
    }
  }
}




void draw()
{
  if (gameMode==0)// start page of the screen
  {
    gameScreen();
  } else if (gameMode==1) //actual game page

  {
    drawBackground();
    player.update();

    for (Obstacle o : obstacles)//o is given for obstacle
    {
      o.update();
      if (player.crash(o))// if the player crashes with all the obstacles then game over
      {
        lives=lives-1;// player lives will decrease by 1
        o.delete();
        obstacleCrash();
      }
    }
    w1.update();  
    w2.update();

    textSize(32);    
    text("Lives: " + lives, 500, 30);
    text("Score: " + score, 80, 30);//appears the scoring for the game page

    for (int i=0; i<hoops.length; i++) {
      hoops[i].update();
    }
    //Collison for each of the different hoops
    for (int i=0; i<hoops.length; i++) {
      if (hoops[i].crash(player)) {
        score = score + 10;// score will increase by 10 when the player crashes with the hoop.

        hoops[i].delete();// the hoops are given a disappearing/explosion effect, whenever the hoop collide with the player it will disappear(go off the page)
      }
    }
    if (w1.crash(player))// if the player crashes either of the whistles, the score will increase by 30.
    {
      score=score+30;
      w1.delete();
    }
    if (w2.crash(player))
    {
      score=score+30;
      w2.delete();
    }
  } else if (gameMode==2)// if the game mode is 2 , the game will end

  {
    gameOver();
  }
}



void drawBackground()
{
  imageMode(CORNER);
  image(background, 0, y); //draw background twice adjacent
  image(background, 0, y+background.height);
  y -=2;
  if (y == -background.height)
    y=0; //wrap background
} 

void gameScreen() {
  imageMode(CENTER);// places the start image from the center
  image (startImg, width/2, height/2);// actual position
}    



void mousePressed()// user clicks the screen for the game to start
{
  if (gameMode==0)
  {
    gameMode=1;
  }
}

void keyPressed()// key press function for the right and left movement of the ball(player)
{
  if (key == CODED)
  {
    if ((keyCode == RIGHT) && (player.getX() < (1000 - 60)))// prevents the ball from coming off the screen
    {
      player.move(10, 0);//+10 pixels across the screen in right direction
    }
    if ((keyCode == LEFT) && (player.getX() >0))
    {

      player.move(-10, 0);// left direction so negative x
    }
    if ((keyCode==UP) && (player.getY()< 1000))

    {
      player.move(0, -5);
    }
    if ((keyCode==DOWN)&& (player.getY()>0))
    {
      player.move(0, 5);
    }
  }
}


void obstacleCrash()// If the lives hit 0 then the game over screen will appear
{
  if (lives==0)
  {
    gameOver=true; 
    gameMode=2;
  }
}
