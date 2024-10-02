Faller faller1;

PImage[] obstacles = new PImage[3];
Shelf[] shelf = new Shelf[5];

PImage background, end;


int y = 0;
int dist = 0;
float maxHealth = 100;
float currentHealth = 100;
float barWidth = 100;
int count = 0;

 //<>//

void setup()
{
  size(500,500);
  background = loadImage("clouds.jpeg");
  background.resize(width,height);
  
  for(int i = 0; i < obstacles.length; i++)
  {
    obstacles[i] = loadImage("obstacle"+i+".png"); 
  }
  
    
  for (int i = 0; i < shelf.length; i++)
  {
    int index = int(random(obstacles.length)); 
   
    shelf[i] = new Shelf(obstacles[index],100+i*50,800+i*150); //random obsacle image chosen for each shelf
    faller1 = new Faller(250,70);
  }

}

void draw()
{
 image(background, 0, y); 
 image(background,0, y+background.height);
 y -=4;
 
 if(y == -background.height)
 {
   y=0;
   dist=dist+100;
 }  
  faller1.update();

 for (int i = 0; i < shelf.length; i++)
 {
   shelf[i].update();
   
   if (shelf[i].collision() == true)
   {
     currentHealth -= 20;
     shelf[i].y = height;
     shelf[i].x=random(0,width-50); //random x position each time it spawns again
   }
   

    
 fill(255,0,0);
 text("Distance:"+dist+"m",10,30);
 textSize(28);
 
 HealthBar(); 

 endgame();

  }
 
}

void HealthBar()
{
  if (currentHealth < 25)
  {
    fill(255, 0, 0);
  }  
  else if (currentHealth < 50)
  {
    fill(255, 200, 0);
  }
  else
  {
    fill(0, 255, 0);
  } 
  noStroke();
  float drawWidth = (currentHealth / maxHealth) * barWidth; //Size of healthbar determined via the current health
  rect(10, 50, drawWidth, 20);
 
}

void endgame()
{
  if (currentHealth==0)
  {
    stop();
    end = loadImage("game.jpg");
    end.resize(width,height);
    image(end,0,0);
    text("Distance:"+dist+"m",150,350);
    textSize(28);
    
  }
}
