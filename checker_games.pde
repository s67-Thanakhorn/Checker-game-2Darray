int[][] ckGrid = {{0,1,0,1,0,1,0,1},
                  {1,0,1,0,1,0,1,0},
                  {0,0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0,0},
                  {0,2,0,2,0,2,0,2},
                  {2,0,2,0,2,0,2,0}};

boolean isClicked = false;

int checkRow,checkCol,saveCol,saveRow,saveColred,saveRowred,saveColblue,saveRowblue;
String direct ;

void setup(){
 background(0);
 size(800,800);
 
}

void drawBoard(){
  noStroke();
  fill(#A1662F);
 for(int x = 0; x < width; x += 200){
  for (int y = 0 ; y < height; y += 200){
    square(x,y,100); 
   
   }
 }
 
 for(int x = 100; x < width; x += 200){
  for (int y = 100 ; y < height; y += 200){
    square(x,y,100); 
   
   }
 }
}

void drawChecker(){
  int row = ckGrid[0].length;
  int col = ckGrid.length;
  noStroke();
  
  for (int i = 0; i < row; i++){
    for (int j = 0; j < col; j++){
    if (ckGrid[i][j] == 1){
     fill(255,0,0); 
     circle(50+(j*100),50+(i*100),100*ckGrid[i][j]);
    }
    if (ckGrid[i][j] == 2){
     fill(0,0,255); 
     circle(50+(j*100),50+(i*100),50*ckGrid[i][j]);
    }
     
      }
      
    
  }

}
void selectCk(){
  int i = checkCol;
  int j = checkRow;
  int forCal2_red = 2;
  int forCal2_blue = 2;
  
  
  if(isClicked){
  if (ckGrid[i][j] == 1){
   noFill();
   strokeWeight(5);
   stroke(0,255,0);
   circle(50+(j*100),50+(i*100),100*ckGrid[i][j]);
   noStroke();
   fill(0,255,0,100);
   
   
   if (i+1 < 8 && j-1 >= 0){
     
     if (ckGrid[i+1][j-1] == 0){
       square((j*100)-100,(i*100)+100,100);
       saveCol = i;
       saveRow = j;
       
     }else{
       
      if (ckGrid[i+1][j-1] == 2){                      
         if (i + 2 < 8 && j - 2 >= 0){
          if (ckGrid[i+2][j-2] == 0){
             
            fill(255,0,0,150);
            square((j*100)-100,(i*100)+100,100);
            fill(0,255,0,100);
            square((j*100)-200,(i*100)+200,100);
            
          }
         }
        }
     }
   }

   if (j+1 < 8 && i+1 < 8){
    if (ckGrid[i+1][j+1] == 0){
     square((j*100)+100,(i*100)+100,100);
      saveCol = i;
      saveRow = j;
      
     }else{
      
        if (ckGrid[i+1][j+1] == 2){
          if (i+2 < 8 && j+2 < 8){
          if (ckGrid[i+forCal2_red][j+forCal2_red] == 0){
            fill(255,0,0,150);
            square((j*100)+100,(i*100)+100,100);
            fill(0,255,0,100);
            square((j*100)+200,(i*100)+200,100);
            }
          }else{
           forCal2_red = 1; 
          }
         }
       }
     
    }
   }
   
  }else{
  
  
  if (ckGrid[i][j] == 2){
   noFill();
   strokeWeight(5);
   stroke(0,255,0);
   circle(50+(j*100),50+(i*100),50*ckGrid[i][j]);
   noStroke();
   fill(0,255,0,100);
   
   if(j-1 >= 0 && i-1 >= 0){
     if (ckGrid[i-1][j-1] == 0){
      square((j*100)-100,(i*100)-100,100);
      saveCol = i;
      saveRow = j;     
     }else{
       if (ckGrid[i-1][j-1] == 1){
         
        if (i-2 >= 0 && j-2 >= 0){
        if (ckGrid[i-forCal2_blue][j-forCal2_blue] == 0){
          fill(255,0,0,200);
          square((j*100)-100,(i*100)-100,100);
          fill(0,255,0,100);
          square((j*100)-200,(i*100)-200,100);
        }
        }else{
         forCal2_blue = 1; 
        }
       }
       
     }
   }
   if (j+1 < 8 && i-1 >= 0){
     if (ckGrid[i-1][j+1] == 0){
      square((j*100)+100,(i*100)-100,100);
      saveCol = i;
      saveRow = j;
      
     }else{
       if (ckGrid[i-1][j+1] == 1){
         if (i-2 >= 0 && j+2 < 8){
        if (ckGrid[i-forCal2_blue][j+forCal2_blue] == 0){
          fill(255,0,0,200);
          square((j*100)+100,(i*100)-100,100);
          fill(0,255,0,100);
          square((j*100)+200,(i*100)-200,100);
        }
         }else{
          forCal2_blue = 1; 
         }
       }
       
     }
    } 
   } 
  }
  
  
  if (ckGrid[i][j] == 0){
  
   if(ckGrid[saveCol][saveRow] == 1){
    if(saveCol + 1 == i && saveRow + 1 == j){
     ckGrid[i][j] = 1;
     ckGrid[saveCol][saveRow] = 0;
     isClicked = false;

    }
    if(saveCol + 1 == i && saveRow - 1 == j){
     ckGrid[i][j] = 1;
     ckGrid[saveCol][saveRow] = 0;
     isClicked = false;
    }
    
    //red eat
   
   if(i-2 >= 0 && j - 2 >= 0){ 
    if (ckGrid[i-2][j-2] == 1){
     if(ckGrid[i-1][j-1] == 2){
      ckGrid[i][j] = 1;
      ckGrid[saveCol+1][saveRow+1] = 0;
      ckGrid[saveCol][saveRow] = 0;
      isClicked = false;
     }
    }
   }else{
    saveColred = i;
    saveRowred = j;
   }
   if(i - 2 >= 0 && j + 2 < 8){
   if(ckGrid[i-2][j+2] == 1){
    if(ckGrid[i-1][j+1] == 2){
     ckGrid[i][j] = 1;
     ckGrid[i-1][j+1] = 0;
     ckGrid[i-2][j+2] = 0;
     isClicked = false;
     }
    }
   }else{
    saveColred = i;
    saveRowred = j;
   }
  }
  
  // if red are negative
  if(i - 2 == saveColred && j - 2 == saveRowred){
     ckGrid[i-2][j-2] = 0;
     ckGrid[i][j] = 1;
     ckGrid[i-1][j-1] = 0;
     isClicked = false;
   }
  if(i-2 == saveColred && j + 2 == saveRowred){
     ckGrid[i-2][j+2] = 0;
     ckGrid[i][j] = 1;
     ckGrid[i-1][j+1] = 0;
     isClicked = false;    
  }
  
   //blue
   if(ckGrid[saveCol][saveRow] == 2){
    if(saveCol - 1 == i && saveRow - 1 == j){
     ckGrid[i][j] = 2;
     ckGrid[saveCol][saveRow] = 0;
     isClicked = true;

    }
    if(saveCol - 1 == i && saveRow + 1 == j){
     ckGrid[i][j] = 2;
     ckGrid[saveCol][saveRow] = 0;
     isClicked = true;

    }
    if(i + 2 < 8 && j - 2 >= 0){
      if(ckGrid[i+2][j-2] == 2){  //right
       if(ckGrid[i+1][j-1] == 1){
        ckGrid[i][j] = 2;
        ckGrid[i+1][j-1] = 0;
        ckGrid[i+2][j-2] = 0;
        isClicked = true;
      }
     }
    }else{
     saveColblue = i;
     saveRowblue = j;
    }
    if( i + 2 < 8 && j + 2 < 8){
     if(ckGrid[i+2][j+2] == 2){
      if(ckGrid[i+1][j+1] == 1){
       ckGrid[i][j] = 2;
       ckGrid[i+1][j+1] = 0;
       ckGrid[i+2][j+2] = 0;
       isClicked = true;
      }
     }
    }else{
     saveColblue = i;
     saveRowblue = j;      
    }
    
   }
   
   //if blue are negative
   
   if(i + 2 == saveColblue && j + 2 == saveRowblue ){
    ckGrid[i][j] = 2;
    ckGrid[i+1][j+1] = 0;
    ckGrid[i+2][j+2] = 0;
    isClicked = true;
   }
   
   if(i + 2 == saveColblue && j - 2 == saveRowblue){
    ckGrid[i][j] = 2;
    ckGrid[i+1][j-1] = 0;
    ckGrid[i+2][j-2] = 0;
    isClicked = true;
   }  
  }
}



void draw(){
 
  background(0);
  drawBoard();
  drawChecker();
  selectCk(); 
}

void mousePressed(){
  checkCol = mouseY/100;
  checkRow = mouseX/100;

  
}
