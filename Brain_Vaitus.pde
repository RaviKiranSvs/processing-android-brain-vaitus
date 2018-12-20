int[][] a;
int X,Y;

void setup()  {
  a = new int[7][7];
  layout();
  
  size(800,600);
}

void draw()  {
  background(0);
  display();
  
  if  (gameOver())  {  fill(255);  text("GAME_OVER", 100, 50);  noLoop();  }
}

void mouseReleased()  {
  X = (mouseX - 75)/ 50;
  Y = (mouseY - 75)/ 50;
  
  if  (a[X][Y] == 1)  {
    for  (int j=0; j<7; j++)  {
      for  (int i=0; i<7; i++)  {
        if  (a[i][j] == 2)  a[i][j] = 1;
        if  (a[i][j] == 3)  a[i][j] = 0;
      }
    }
    a[X][Y] = 2;
    if  (Y<5 && a[X][Y+2] == 0 && a[X][Y+1] == 1)  a[X][Y+2] = 3;
    if  (Y>1 && a[X][Y-2] == 0 && a[X][Y-1] == 1)  a[X][Y-2] = 3;
    if  (X<5 && a[X+2][Y] == 0 && a[X+1][Y] == 1)  a[X+2][Y] = 3;
    if  (X>1 && a[X-2][Y] == 0 && a[X-1][Y] == 1)  a[X-2][Y] = 3;
  }
  
  else if  (a[X][Y] == 3)  {
    for  (int j=0; j<7; j++)  {
      for  (int i=0; i<7; i++)  {
        if  (a[i][j] == 2)  {
          a[i][j] = 0;
          a[(X+i)/2][(Y+j)/2] = 0;
        }
        if  (a[i][j] == 3)  a[i][j] = 0;
      }
    }
    a[X][Y] = 1;
  }
  
  print(X);
  print("\t");
  println(Y);
}