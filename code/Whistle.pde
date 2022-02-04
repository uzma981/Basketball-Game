class Whistle extends Points// inheritance class for Points

{
  PImage whistle;
  Whistle(int x, int y, int speedY) {
    super (x, y, speedY);
    whistle=loadImage("whistle.png");
    whistle.resize(50, 50);
  }
  void render()

  {
    image(whistle, this.x, this.y);
  }

  void move()// only want specifically the whistle to move in this way

  {

    float stepX= random(-10, 5); //makes the whistle bounce
    y=y+(int)stepX;
  }
}
