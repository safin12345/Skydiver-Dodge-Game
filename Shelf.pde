class Shelf  //<>//
{
  float x;
  float y;
  int speed = 6;
  
  PImage img; 


  Shelf(PImage tempImg,float x, float y)
  {
    this.x = x;
    this.y = y;
    img = tempImg;
  }
  
  void render() 
  {
    image(img,x,y);
  }

  void move()
  {
    y = y-speed;
    
    if (y<-100)
    {
     y = height;
     x = random(0,width-50);
    }
  }
  
  boolean collision()
  {
    return (abs(faller1.y-this.y) <40 && abs(faller1.x-this.x)<60);
  }
 
  
  void update()
  {
    move();
    render();
  }
  
}
