import processing.sound.*;

SoundFile bgMusic;

float vx,vy;
float bx,by,bd;

float player1w = 150, player1h = 15;
float player1x = 300, player1y = 550;
float ax;

boolean aKey, dKey;

int i;
int j;
float sVolume = 1;

int bricks = 9;
float brickd = 30;
int [] brickX;
int [] brickY;

int gamestate = 0;
final int intro = 0;
final int playing = 1;
final int paused = 2;
final int game_over = 3;

void setup() {
  size(600, 600, P2D);
  background(142);
  gamestate = playing;
  bgMusic = new SoundFile(this, "");
  brickX = new int[bricks];
  brickY = new int[bricks];
  bd = 20;
  vx = 8;
  vy = 8;
  ax = 0;
  
  j=0;
  i=0;
  while (j<3) {
    while (i<3) {
      brickX[i+ j*3] = i*200 + 100;
      brickY[i+ j*3] = j*100 + 100;
      println(brickX[i+j]);
      println(brickY[i+j]);
      i=i+1;
    }
    i=0;
    j= j+1;
  }
}

void draw() {
  if (gamestate == intro) {
  } else if (gamestate == playing) {
    playing();
  } else if (gamestate == paused) {
    paused();
  } else if (gamestate == game_over) {
  }
}

void keyPressed() {
  if (key == 'a') aKey = true;
  if (key == 'd') dKey = true;
}

void keyReleased() {
  if (key == 'a') aKey = false;
  if (key == 'd') dKey = false;
}

void p1move(){
  if (aKey) ax -= 1;
  if (dKey) ax += 1;
  ax = ax * 0.875;
  player1x += ax;
}

void player() {
}
//class
