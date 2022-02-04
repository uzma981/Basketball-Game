class Points
{
  int x, y, speedY;
  PImage hoop;

  Points(int x, int y, int speedY)
  {
    this.x=x;
    this.y=y;
    this.speedY=speedY; 
    hoop=loadImage("basket_hoop.png");
    hoop.resize(100, 100);
  }
  void render()

  {

    image(hoop, this.x, this.y);//location of the cone
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


  boolean crash(Player other)   //boolean crash between hoop and player
  {
    return(abs(this.x-other.x) <=50 && abs(this.y-other.y) <50);
  }

  void delete() {// gives the disappearing effect for the hoop when it collides with the player.
    this.y = -1000;
  }
}
