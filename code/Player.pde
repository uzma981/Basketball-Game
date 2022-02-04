class Player
{
  int x, y;

  PImage ball;



  Player(int x, int y)
  {
    print("New Player: X: " + x + " Y: " + y); 
    this.y=y;

    this.x=x;
    ball = loadImage("ball.png");// loads the  image
  }

  void render()
  {
    image(ball, this.x, this.y);
    //print("here" + x + y);
  }
  void update() 
  {
    render();
  }

  void move(int x_pos, int y_pos) {
    this.x += x_pos;
    this.y += y_pos;
  }

  int getX() {
    return this.x;
  }
  int getY() {
    return this.y;
  }


  boolean crash(Obstacle other)   //boolean crash between obstacle and player
  {
    return(abs(this.x-other.x) <=50 && abs(this.y-other.y) <50);
  }
}
