import processing.sound.*;
SoundFile bgMusic;

float vx, vy;
float bx, by, bd;

float player1w = 150, player1h = 15;
float player1x = 300, player1y = 550;
float ax;

boolean aKey, dKey;

int points, lives;
PFont livesFont;
PFont introText;
PFont play;
PImage[] explosion;
int gifFrames;
int f;

int i;
int j;
int k;
int l;
float m = -10;
float n = 0;
float sVolume = 1;

int bricks = 20;
float brickd = 30;
int [] brickX;
int [] brickY;
boolean [] alive;

iBricks i2;
int iBricksAmount=80;
iBricks[] ito = new iBricks[iBricksAmount];


int gamestate = 0;
final int intro = 0;
final int playing = 1;
final int paused = 2;
final int game_over = 3;

String[] fontlist = PFont.list();
void setup() {
  size(600, 600);
  background(0);
  gamestate = intro;
  //bgMusic = new SoundFile(this, "");
  brickX = new int[bricks];
  brickY = new int[bricks];
  alive = new boolean[bricks];
  println(fontlist);
  livesFont = createFont("Tw Cen MT Condensed Extra Bold", 40);
  introText = createFont("Comic Sans MS",80);
  play = createFont("Arial Black",30);
  bx = 300;
  by = 350;
  bd = 20;
  vx = 0;
  vy = 8;
  ax = 0;
  lives = 3;
  gifFrames = 17;
  explosion = new PImage[gifFrames];
  i = 0;
  while (i<gifFrames){
    explosion[i] = loadImage("frame_"+i+"_delay-0.1s.gif");
    i+=1;
  }
  //j=0;
  //i=0;
  //while (j<3) {
  //  while (i<4) {
  //print(i, j, i+ j*3, i*100 + 100, j*75 + 100, " ");
  //    brickX[i+ j*3] = i*100 + 100;
  //    brickY[i+ j*3] = j*75 + 100;
  //    alive[i + j*3] = true;
  //    i=i+1;
  //  }
  //  println("");
  //  i=0;
  //  j= j+1;
  //}
  int i = 0;
  int j = 100;
  int k = 60;
  while (i < bricks) {
    //print(i, j, i+ j*3, i*100 + 100, j*75 + 100, " ");
    brickX[i] = j;
    brickY[i] = k;
    alive[i] = true;
    j += 100;
    i++;
    if (j > 500) {
      j = 100;
      k += 70;
    }
  }

  i=0;
  while (i<iBricksAmount) {
    ito[i] = new iBricks();
    i2 = new iBricks();
    i++;
  }


  //println(brickX);
  //println(brickY);
}

void draw() {
  if (gamestate == intro) {
    intro();
  } else if (gamestate == playing) {
    playing();
  } else if (gamestate == paused) {
    paused();
  } else if (gamestate == game_over) {
    game_over();
  }
}

void keyPressed() {
  if (key == 'a' || key == 'A') aKey = true;
  if (key == 'd' || key == 'D') dKey = true;
}

void keyReleased() {
  if (key == 'a' || key == 'A') aKey = false;
  if (key == 'd' || key == 'D') dKey = false;
}

void p1move() {
  if (aKey) {
    ax -= 1;
    if (player1x<0) ax += 1;
  }
  if (dKey) {
    ax += 1;
    if (player1x + player1w > width) ax-=1;
  }
  ax = ax * 0.875;
  player1x += ax;
}

void ball() {
  j=0;
  while (j<8) {
    bx += vx/8;
    by += vy/8;
    if (vx > 30) {
      vx = 30;
    }
    if (bx <= 0 + bd/2) {
      vx = abs(vx);
      bx += vx;
      break;
    }
    if (bx >= width - bd/2) {
      vx = abs(vx) * -1;
      bx += vx;
      break;
    }
    if (by <= 0 + bd/2) {
      vy = abs(vy);
      by += vy;
      break;
    }
    if (by >= height - bd/2) {
      lives -= 1;
      bx = 300;
      by = 350;
      vx = 0;
      vy = 1.5;
    }
    j += 1;
    if (player1x < bx+ bd/2 && bx - bd/2 < player1x+player1w && player1y < by + bd/2 && by- bd/2 < player1y + player1h) {
      vy = -vy*1.05;
      if (player1x < bx+ bd/2 && bx+ bd/2 < player1x+20 && player1y < (by + bd/2) && by- bd/2 < player1y + player1h) {
        vx = -vx + abs(ax) * -1;
        bx += abs(ax) * -1;
      }
      if (player1x+player1w-20 < bx- bd/2 && bx- bd/2 < player1x+player1w && player1y < (by + bd/2) && by- bd/2 < player1y + player1h) {
        vx = -vx + abs(ax);
        bx += abs(ax);
      }
      bx += vx;
      by += vy;
      while (player1x < bx+ bd/2 && bx - bd/2 < player1x+player1w && player1y < by + bd/2 && by- bd/2 < player1y + player1h == true) {
        by += vy;
        vy = -vy*1.05;
      }
      break;
    }
  }
  fill(255);
  circle(bx, by, bd);
}
