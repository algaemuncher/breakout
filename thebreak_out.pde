import processing.sound.*;

SoundFile bgMusic;

float vx, vy;
float bx, by, bd;

float player1w = 150, player1h = 15;
float player1x = 300, player1y = 550;
float ax;

boolean aKey, dKey;

int i;
int j;
float sVolume = 1;

int bricks = 20;
float brickd = 30;
int [] brickX;
int [] brickY;
boolean [] alive;

int gamestate = 0;
final int intro = 0;
final int playing = 1;
final int paused = 2;
final int game_over = 3;

void setup() {
  size(600, 600, P2D);
  background(0);
  gamestate = playing;
  //bgMusic = new SoundFile(this, "");
  brickX = new int[bricks];
  brickY = new int[bricks];
  alive = new boolean[bricks];
  bx = 300;
  by = 350;
  bd = 20;
  vx = 0;
  vy = 8;
  ax = 0;

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
    print(i, j, i+ j*3, i*100 + 100, j*75 + 100, " ");
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




  println(brickX);
  println(brickY);
}

void draw() {
  if (gamestate == intro) {
  } else if (gamestate == playing) {
    playing();
  } else if (gamestate == paused) {
    paused();
  } else if (gamestate == game_over) {
    game_over();
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

void p1move() {
  if (aKey) ax -= 1;
  if (dKey) ax += 1;
  ax = ax * 0.875;
  player1x += ax;
}

void ball() {
  j=0;
  while (j<8) {
    bx += vx/8;
    by += vy/8;
    if (bx <= 0 + bd/2 || bx >= width - bd/2) {
      vx = -vx;
      bx += vx;
      break;
    }
    if (by <= 0 + bd/2 || by >= height - bd/2) {
      vy = -vy;
      by += vy;
      break;
    }
    j += 1;
    if (player1x < bx+ bd/2 && bx - bd/2 < player1x+player1w && player1y < by + bd/2 && by- bd/2 < player1y + player1h) {
      vy = -vy;
      if (player1x < bx+ bd/2 && bx+ bd/2 < player1x+20 && player1y < (by + bd/2) && by- bd/2 < player1y + player1h) {
        vx = -vx + abs(ax) * -1; 
        bx += abs(ax) * -1;
      }
      if (player1x+player1w-20 < bx- bd/2 && bx- bd/2 < player1x+player1w && player1y < (by + bd/2) && by- bd/2 < player1y + player1h) {
        vx = vx*-1 + abs(ax);
        bx += abs(ax);
      }
      bx += vx;
      by += vy;
      break;
    }
  }
  fill(255);
  circle(bx, by, bd);
}

void player() {
}
//class
