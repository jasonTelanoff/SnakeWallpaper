int numOfSnakes = 50;
int lengthOfTail = 15 ;
int snakeSize = 20;

int attractiveForce = 65;

Snake[] snakes = new Snake[numOfSnakes];

class Snake {
  int[][] coords;
  int size;

  Snake(int tailLength, int _size) {
    size = _size;
    coords = new int[tailLength][2];
    for (int i = 0; i < coords.length; i++) {
      coords[i][0] = width/2;
      coords[i][1] = height/2;
    }
  }

  void show() {
    int opacity = 240;
    for (int i = 1; i < coords.length; i++) {
      opacity-=240/lengthOfTail;
      fill(50, 200, 40, opacity);
      rect(coords[i][0], coords[i][1], size, size);
    }
    fill(0, 100, 0, 250);
    rect(coords[0][0], coords[1][1], size, size);
  }

  void update() {
    switch (floor(random(4.5))) {
    case 0:
      if (coords[0][1] < height - 2*size) {
        updateCoords(0, size);
      }
      break;
    case 1:
      if (coords[0][1] > 2*size) {
        updateCoords(0, -size);
      }
      break;
    case 2:
      if (coords[0][0] < width - 2*size) {
        updateCoords(size, 0);
      }
      break;
    case 3:
      if (coords[0][0] > 2*size) {
        updateCoords(-size, 0);
      }
      break;
    }
  }

  void updateCoords(int xChange, int yChange) {
    for (int i = coords.length-1; i > 0; i--) {
      coords[i][0] = coords[i - 1][0];
      coords[i][1] = coords[i - 1][1];
    }
    coords[0][0] += xChange;
    coords[0][1] += yChange;
  }
}

void setup() {
  fullScreen();

  frameRate(10);
  noStroke();
  for (int i = 0; i < numOfSnakes; i++) {
    snakes[i] = new Snake(lengthOfTail, snakeSize);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < snakes.length; i++) {
    snakes[i].show();
    snakes[i].update();
  }
}
