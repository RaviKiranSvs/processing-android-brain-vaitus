void layout()  {
  for  (int j=0; j<7; j++)  {
    for  (int i=0; i<7; i++)  {
      if  ((i==0 || i==1 || i==5 || i==6) && (j==0 || j==1 || j==5 || j==6))
        a[i][j] = -1;
      else if  (i==3 && j==3)  a[i][j] = 0;
      else  a[i][j] = 1;
    }
  }
}

void layoutGO()  {
  for  (int j=0; j<7; j++)  {
    for  (int i=0; i<7; i++)  {
      if  (i==3 && j==3)  a[i][j] = 1;
      else  a[i][j] = 0;
    }
  }
}

void display()  {
  for  (int j=0; j<7; j++)  {
    for  (int i=0; i<7; i++)  {
          if  (a[i][j] == -1)  fill(0);
      else if  (a[i][j] == 0)  fill(0, 25, 25);
      else if  (a[i][j] == 1)  fill(180);
      else if  (a[i][j] == 2)  fill(0, 0, 255);
      else if  (a[i][j] == 3)  fill(0, 100, 0);
      ellipse(50*i+100, 50*j+100, 20, 20);
    }
  }
}

boolean gameOver()  {
  boolean gO = true;
  for  (int j=0; j<7; j++)  {
    for  (int i=0; i<7; i++)  {
      if  ((j<5 && a[i][j+2] == 0 && a[i][j+1] == 1 && a[i][j] == 1) ||
           (j>1 && a[i][j-2] == 0 && a[i][j-1] == 1 && a[i][j] == 1) ||
           (i<5 && a[i+2][j] == 0 && a[i+1][j] == 1 && a[i][j] == 1) ||
           (i>1 && a[i-2][j] == 0 && a[i-1][j] == 1 && a[i][j] == 1) ||
           (j<5 && a[i][j+2] == 3 && a[i][j] == 2) ||
           (j>1 && a[i][j-2] == 3 && a[i][j] == 2) ||
           (i<5 && a[i+2][j] == 3 && a[i][j] == 2) ||
           (i>1 && a[i-2][j] == 3 && a[i][j] == 2))  gO = false;
    }
  }
  return  (gO);
}