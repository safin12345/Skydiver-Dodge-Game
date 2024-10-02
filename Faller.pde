int lives = 3; //<>//
class Faller
{
  int x,y;
  int speed = 0;
  int count = 0;

  PImage img1,img2,img3;
  
  Faller(int x, int y)
  {
  this.x = x;
  this.y = y;
  img1 = loadImage("falling1.png");
  img2 = loadImage("falling2.png");
  img3 = loadImage("falling3.png");
  
  
  
  }
  void keyPressed()
  {
    if (key==CODED)
    {
      if (keyCode == LEFT && faller1.x>10)
      {
        image(img3,x,y);
        faller1.x = faller1.x-5;
      }
      else if (keyCode == RIGHT && faller1.x<400) 
      {
        image(img2,x,y);
        faller1.x = faller1.x+5;  
      }
      else
      {
        image(img1,x,y); 
      }
       count++;
    }
    
    
    if (key!=CODED)
    {
      image(img1,x,y);
    }
    
  }
  
  void effect()
  {
    y = y + int(random(-3,3));
  }
  
  void update()
  {
    effect();
    keyPressed();
  }

}


  
