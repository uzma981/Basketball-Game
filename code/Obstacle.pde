class Obstacle
{
  int x, y;
  int size;
  int speedY;

  PImage cone;


  Obstacle(int x, int y, int speedY)
  {
    print("New Obs: X: " + x + " Y: " + y);
    this.y=y;   
    this.x=x;
    this.speedY = speedY;
    cone = loadImage("cone.png");// loads the  image
    cone.resize(100, 100);
  }
  void render()

  {
    image(cone, this.x, this.y);//location of the cone
  }
  void move() {


    //println("move" + y);
    y=y-speedY;


    if (y<0)

      y=height;
  }

  void update()
  {

    move();
    render();
  }
  void delete() {// obstacle disappears and goes off the screen, until lives are greater than 0
    this.y = -1000;
  }
}
