
// Space Battle Game
import processing.sound.*;
// Space Invaders Background
PImage img;
PImage playerImage;
PImage alienImage;
PImage welcomeImg;
PFont titleFont;
PFont bodyFont;
// Sounds
SoundFile fireSound;
SoundFile explosion;
SoundFile music;

// our Ship
int p1X = 400;
int p1Y = 550;
int pW = 50;
int pH = 30;
int pSpeed = 3;

// aliens
int aWidth = 40; 
int aHeight = 40;
// row 1 - aliens
int a1X = 50;
int a2X = a1X + 60;
int a3X = a2X + 60;
int a4X = a3X + 60;
int a5X = a4X + 60;
int a6X = a5X + 60;
int a7X = a6X + 60;
int a8X = a7X + 60;
int a9X = a8X + 60;
int a10X = a9X + 60;
int a11X = a10X + 60;
int a12X = a11X + 60;

float a1Y = 150;
float a2Y = 150;
float a3Y = 150;
float a4Y = 150;
float a5Y = 150;
float a6Y = 150;
float a7Y = 150;
float a8Y = 150;
float a9Y = 150;
float a10Y = 150;
float a11Y = 150;
float a12Y = 150;

// row 2 - aliens
int a13X = 50;
int a14X = a13X + 60;
int a15X = a14X + 60;
int a16X = a15X + 60;
int a17X = a16X + 60;
int a18X = a17X + 60;
int a19X = a18X + 60;
int a20X = a19X + 60;
int a21X = a20X + 60;
int a22X = a21X + 60;
int a23X = a22X + 60;
int a24X = a23X + 60;

float a13Y = 210;
float a14Y = 210;
float a15Y = 210;
float a16Y = 210;
float a17Y = 210;
float a18Y = 210;
float a19Y = 210;
float a20Y = 210;
float a21Y = 210;
float a22Y = 210;
float a23Y = 210;
float a24Y = 210;



// counter
int score = 0;
int stage = 0;
// stage 0 - main menu
// stage 1 = game
// stage 2 = win

// rocket
int r1X = p1X; // rocket begin with the player
int r1Y = p1Y;
int r1Position = 0;
int rWidth = 7;
int rHeight = 20;
int rSpeed = 5;
boolean fire = false; 


void setup(){
  size(800,600);
  // Load all image
  img = loadImage("SIB.png");
  playerImage = loadImage("spaceship.png");
  alienImage = loadImage("aliens.png");
  welcomeImg = loadImage("introwallpaper.jpeg");
  // Font
  titleFont = createFont("title.ttf", 60);
  bodyFont = createFont("font.otf", 40);
  
  // sounds
  //explosion = new SoundFile(this, "explosion.wav");
  //music = new SoundFile(this, "music.mpeg");


  //fireSound.play();
  
  
} 
void draw(){
  //music.play();
  if(stage == 0){
    splash();
  }
  if(stage == 1){
   
    game();
  }
  if(stage == 2){
    win();
  }
  if(stage == 3){
    lost();
  }
  if(mousePressed == true){
    stage = 1;
  }

}

void splash(){
  // welcome Window
  background(welcomeImg);
  
  stroke(0,255,0);
  noFill();
  strokeWeight(3);
  //rect(width/2, height/2, width, height);
  noStroke();
  fill(#F1060B);
  textSize(20);
  textFont(titleFont);
  
  text("SPACE INVADERS", width/2 - 305, height/2 - 150);
  fill(#FFEE15);
  text("SPACE INVADERS", width/2 - 300, height/2 - 155);
  textFont(bodyFont);
  textSize(20);
  text("PROGRAMMED BY JESUS LOPEZ IN 2023", width/2 - 160, 180);
  textFont(titleFont);
  textSize(60);
  fill(#F1060B);
  text("HOW TO PLAY", width/2 - 230, 300);
  fill(#FFEE15);
  text("HOW TO PLAY", width/2 - 225, 305);
  
  textFont(bodyFont);
  textSize(20);
  
  text("PRESS LEFT AND RIGHT TO MOVE", width/2 - 140, 330);
  text("PRESS F TO FIRE ROCKETS", width/2 - 140, 360);
  text("DESTROY ALL ALIENS TO WIN", width/2 - 140, 390);
  
  textFont(titleFont);
  textSize(40);
  fill(#F1060B);
  text("CLICIK THE SCREEN TO BEGIN", width/2 - 350, 520);
  fill(#FFEE15);
  text("CLICIK THE SCREEN TO BEGIN", width/2 - 345, 525);
  
  
}

void lost(){
    // lost window
  background(0);
  
  stroke(0);
  noFill();
  strokeWeight(3);
  //rect(width/2, height/2, width, height);
  noStroke();
  
  fill(#FFF218);
  textSize(60);
  textFont(titleFont);
  text("GAME OVER", width/2 - 180, height/2 - 100);
  textFont(bodyFont);
  textSize(35);
  fill(255,0,0);
  text("EARTH HAS BEEN DESTROYED", width/2 - 160, 300);
  
}
void win(){
  // win window
  background(0);
  
  stroke(0);
  noFill();
  strokeWeight(3);
  //rect(width/2, height/2, width, height);
  noStroke();
  
  fill(#FFF218);
  textSize(1);
  textFont(titleFont);
  text("CONGRATULATIONS", width/2 - 330, height/2 - 100);
  textFont(titleFont);
  textSize(35);
  fill(0,255,0);
  text("EARTH HAS BEEN SAVED", width/2 - 240, 300);
}



void game(){
  //call looping function()
  background(img);
  keyPressed();
  keyTyped();
  
  noStroke();
  fill(#8DAC50); // green buzz
  rect(width - 800, 0, width, 50); // banner
  
  // Draw our ship
  noStroke();
  fill(#A89EA8);
  image(playerImage,p1X, p1Y, pW, pH); 
  
  // draw aliens at their position
  //fill(255);
  tint(255,150);
  image(alienImage, a1X, a1Y, aWidth, aHeight);
  image(alienImage, a2X, a2Y, aWidth, aHeight);
  image(alienImage, a3X, a3Y, aWidth, aHeight);
  image(alienImage, a4X, a4Y, aWidth, aHeight);
  image(alienImage, a5X, a5Y, aWidth, aHeight);
  image(alienImage, a6X, a6Y, aWidth, aHeight);
  image(alienImage, a7X, a7Y, aWidth, aHeight);
  image(alienImage, a8X, a8Y, aWidth, aHeight);
  image(alienImage, a9X, a9Y, aWidth, aHeight);
  image(alienImage, a10X, a10Y, aWidth, aHeight);
  image(alienImage, a11X, a11Y, aWidth, aHeight);
  image(alienImage, a12X, a12Y, aWidth, aHeight);
  image(alienImage, a13X, a13Y, aWidth, aHeight);
  image(alienImage, a14X, a14Y, aWidth, aHeight);
  image(alienImage, a15X, a15Y, aWidth, aHeight);
  image(alienImage, a16X, a16Y, aWidth, aHeight);
  image(alienImage, a17X, a17Y, aWidth, aHeight);
  image(alienImage, a18X, a18Y, aWidth, aHeight);
  image(alienImage, a19X, a19Y, aWidth, aHeight);
  image(alienImage, a20X, a20Y, aWidth, aHeight);
  image(alienImage, a21X, a21Y, aWidth, aHeight);
  image(alienImage, a22X, a22Y, aWidth, aHeight);
  image(alienImage, a23X, a23Y, aWidth, aHeight);
  image(alienImage, a24X, a24Y, aWidth, aHeight);
  
  a1Y += 0.13;
  a2Y += 0.13;
  a3Y += 0.13;
  a4Y += 0.13;
  a5Y += 0.13;
  a6Y += 0.13;
  a7Y += 0.13;
  a8Y += 0.13;
  a9Y += 0.13;
  a10Y += 0.13;
  a11Y += 0.13;
  a12Y += 0.13;
  a13Y += 0.13;
  a14Y += 0.13;
  a15Y += 0.13;
  a16Y += 0.13;
  a17Y += 0.13;
  a18Y += 0.13;
  a19Y += 0.13;
  a20Y += 0.13;
  a21Y += 0.13;
  a22Y += 0.13;
  a23Y += 0.13;
  a24Y += 0.13;
  
  rockets();
  
  // collisions between rocket and aliens
  if(r1X >= a1X - aWidth/2 && r1X <= a1X+aWidth/2 && r1Y >= a1Y - aHeight/2 && r1Y <= a1Y+aHeight/2){
    // add points
    score += 1;
    a1X =  -1000;
    r1Position = 2;
    
  }
  if(r1X >= a2X - aWidth/2 && r1X <= a2X+aWidth/2 && r1Y >= a2Y - aHeight/2 && r1Y <= a2Y+aHeight/2){
    // add points
    score += 1;
    a2X =  -1000;
    r1Position = 2; 
  }
  if(r1X >= a3X - aWidth/2 && r1X <= a3X+aWidth/2 && r1Y >= a3Y - aHeight/2 && r1Y <= a3Y+aHeight/2){
    // add points
    score += 1;
    a3X =  -1000;
    r1Position = 2; 
  }
  if(r1X >= a4X - aWidth/2 && r1X <= a4X+aWidth/2 && r1Y >= a4Y - aHeight/2 && r1Y <= a4Y+aHeight/2){
    // add points
    score += 1;
    a4X =  -1000;
    r1Position = 2; 
  }
  if(r1X >= a5X - aWidth/2 && r1X <= a5X+aWidth/2 && r1Y >= a5Y - aHeight/2 && r1Y <= a5Y+aHeight/2){
    // add points
    score += 1;
    a5X =  -1000;
    r1Position = 2; 
  }
  if(r1X >= a6X - aWidth/2 && r1X <= a6X+aWidth/2 && r1Y >= a6Y - aHeight/2 && r1Y <= a6Y+aHeight/2){
    // add points
    score += 1;
    a6X =  -1000;
    r1Position = 2; 
  }
  if(r1X >= a7X - aWidth/2 && r1X <= a7X+aWidth/2 && r1Y >= a7Y - aHeight/2 && r1Y <= a7Y+aHeight/2){
    // add points
    score += 1;
    a7X =  -1000;
    r1Position = 2; 
  }
  if(r1X >= a8X - aWidth/2 && r1X <= a8X+aWidth/2 && r1Y >= a8Y - aHeight/2 && r1Y <= a8Y+aHeight/2){
    // add points
    score += 1;
    a8X =  -1000;
    r1Position = 2; 
  }
  if(r1X >= a9X - aWidth/2 && r1X <= a9X+aWidth/2 && r1Y >= a9Y - aHeight/2 && r1Y <= a9Y+aHeight/2){
    // add points
    score += 1;
    a9X =  -1000;
    r1Position = 2; 
  }
  if(r1X >= a10X - aWidth/2 && r1X <= a10X+aWidth/2 && r1Y >= a10Y - aHeight/2 && r1Y <= a10Y+aHeight/2){
    // add points
    score += 1;
    a10X =  -1000;
    r1Position = 2; 
  }
  if(r1X >= a11X - aWidth/2 && r1X <= a11X+aWidth/2 && r1Y >= a11Y - aHeight/2 && r1Y <= a11Y+aHeight/2){
    // add points
    score += 1;
    a11X =  -1000;
    r1Position = 2; 
  }
  if(r1X >= a12X - aWidth/2 && r1X <= a12X+aWidth/2 && r1Y >= a12Y - aHeight/2 && r1Y <= a12Y+aHeight/2){
    // add points
    score += 1;
    a12X =  -1000;
    r1Position = 2; 
  }
  if(r1X >= a13X - aWidth/2 && r1X <= a13X+aWidth/2 && r1Y >= a13Y - aHeight/2 && r1Y <= a13Y+aHeight/2){
    // add points
    score += 1;
    a13X =  -1000;
    r1Position = 2; 
  }
  if(r1X >= a14X - aWidth/2 && r1X <= a14X+aWidth/2 && r1Y >= a14Y - aHeight/2 && r1Y <= a14Y+aHeight/2){
    // add points
    score += 1;
    a14X =  -1000;
    r1Position = 2; 
  }
  if(r1X >= a15X - aWidth/2 && r1X <= a15X+aWidth/2 && r1Y >= a15Y - aHeight/2 && r1Y <= a15Y+aHeight/2){
    // add points
    score += 1;
    a15X =  -1000;
    r1Position = 2; 
  }
  if(r1X >= a16X - aWidth/2 && r1X <= a16X+aWidth/2 && r1Y >= a16Y - aHeight/2 && r1Y <= a16Y+aHeight/2){
    // add points
    score += 1;
    a16X =  -1000;
    r1Position = 2; 
  }
  if(r1X >= a17X - aWidth/2 && r1X <= a17X+aWidth/2 && r1Y >= a17Y - aHeight/2 && r1Y <= a17Y+aHeight/2){
    // add points
    score += 1;
    a17X =  -1000;
    r1Position = 2; 
  }
  if(r1X >= a18X - aWidth/2 && r1X <= a18X+aWidth/2 && r1Y >= a18Y - aHeight/2 && r1Y <= a18Y+aHeight/2){
    // add points
    score += 1;
    a18X =  -1000;
    r1Position = 2; 
  }
  if(r1X >= a19X - aWidth/2 && r1X <= a19X+aWidth/2 && r1Y >= a19Y - aHeight/2 && r1Y <= a19Y+aHeight/2){
    // add points
    score += 1;
    a19X =  -1000;
    r1Position = 2; 
  }
  if(r1X >= a20X - aWidth/2 && r1X <= a20X+aWidth/2 && r1Y >= a20Y - aHeight/2 && r1Y <= a20Y+aHeight/2){
    // add points
    score += 1;
    a20X =  -1000;
    r1Position = 2; 
  }
  if(r1X >= a21X - aWidth/2 && r1X <= a21X+aWidth/2 && r1Y >= a21Y - aHeight/2 && r1Y <= a21Y+aHeight/2){
    // add points
    score += 1;
    a21X =  -1000;
    r1Position = 2; 
  }
  if(r1X >= a22X - aWidth/2 && r1X <= a22X+aWidth/2  && r1Y >= a22Y - aHeight/2 && r1Y <= a22Y+aHeight/2){
    // add points
    score += 1;
    a22X =  -1000;
    r1Position = 2; 
  }
  if(r1X >= a23X - aWidth/2 && r1X <= a23X+aWidth/2 && r1Y >= a23Y - aHeight/2 && r1Y <= a23Y+aHeight/2){
    // add points
    score += 1;
    a23X =  -1000;
    r1Position = 2; 
  }
  if(r1X >= a24X - aWidth/2 && r1X <= a24X+aWidth/2 && r1Y >= a24Y - aHeight/2 && r1Y <= a24Y+aHeight/2){
    // add points
    score += 1;
    a24X =  -1000;
    r1Position = 2; 
  }

  
  
      
    // Score bar
    fill(0);
    textSize(20);
    text("Score:", 5, 35);
    text(score, 90, 35);
    
    // exting stages
    if(score >= 24){
      stage = 2;
    }
  
}

void rockets(){
  // draw rokecet
  fill(255,0,0);
  rect(r1X + 20, r1Y, rWidth, rHeight);
  
  if(fire == true && r1Position == 0){
    r1Position = 1;
  }
  if(r1Position == 1){
    r1X = r1X;
    r1Y = r1Y - rSpeed;
    
    // if exceeds window or misses
    if(r1Y <= 0){
      r1Position = 2; // reload
    }
  }
  else{
    r1Y = p1Y;
    r1X = p1X;
  }
  // check if aliens have reached the bottom of the screen
  if (a1Y >= height - aHeight/2 || a2Y >= height - aHeight/2 || a3Y >= height - aHeight/2 || a4Y >= height - aHeight/2 || 
    a5Y >= height - aHeight/2 || a6Y >= height - aHeight/2 || a7Y >= height - aHeight/2 || a8Y >= height - aHeight/2 || 
    a9Y >= height - aHeight/2 || a10Y >= height - aHeight/2 || a11Y >= height - aHeight/2 || a12Y >= height - aHeight/2 || 
    a13Y >= height - aHeight/2 || a14Y >= height - aHeight/2 || a15Y >= height - aHeight/2 || a16Y >= height - aHeight/2 || 
    a17Y >= height - aHeight/2 || a18Y >= height - aHeight/2 || a19Y >= height - aHeight/2 || a20Y >= height - aHeight/2 || 
    a21Y >= height - aHeight/2 || a22Y >= height - aHeight/2 || a23Y >= height - aHeight/2 || a24Y >= height - aHeight/2) {
  // if any alien has reached the bottom, game over
  stage = 3;
  }
  
  // reload on # 2 command
  if(r1Position == 2){
    r1Y = p1Y;
    r1X = p1X;
    r1Position = 0;
  }
}

void keyPressed(){
  // game control movement
  if(key == CODED){
    if(keyCode == LEFT && keyPressed == true){
      p1X = p1X - pSpeed;
    }
    else if(keyCode == RIGHT && keyPressed == true){
      p1X = p1X + pSpeed;
    }
  }
}

void keyTyped(){
  // ship fire
  if(key == 'f' && keyPressed == true){
    //fireSound = 
    fire = true;
   
  }
  else{
    fire = false;
  }
}
