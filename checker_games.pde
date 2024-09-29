int[][] ckGrid = {{0,1,0,1,0,1,0,1},
                  {1,0,1,0,1,0,1,0},
                  {0,0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0,0},
                  {0,2,0,2,0,2,0,2},
                  {2,0,2,0,2,0,2,0}};

boolean isClicked = false;

int checkRow,checkCol,saveCol,saveRow;
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
         println(i,j);
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
         if (i-2 >= 0){
        if (ckGrid[i-forCal2_blue][j+2] == 0){
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
  
  if (ckGrid[i][j] == 0){
   
     if (ckGrid[saveCol][saveRow] == 1){
     if (i - saveCol == 1 && saveRow - j == 1){
      ckGrid[saveCol][saveRow] = 0;
      ckGrid[i][j] = 1;
     }
     if(i - saveCol == 1 && j - saveRow == 1){
      ckGrid[saveCol][saveRow] = 0;
      ckGrid[i][j] = 1;
     }
     
     if(ckGrid[saveCol+1][saveRow+1] == 2){
       
       ckGrid[saveCol][saveRow] = 0;
       ckGrid[saveCol+2][saveRow+2] = 1;
       ckGrid[saveCol+1][saveRow+1] = 0;
       
     }
    
     if(ckGrid[saveCol+1][saveRow-1] == 2){
       
       ckGrid[saveCol][saveRow] = 0;
       ckGrid[saveCol+2][saveRow-2] = 1;
       ckGrid[saveCol+1][saveRow-1] = 0;
       
     }
    }
         
    
    if (ckGrid[saveCol][saveRow] == 2){
     if (saveCol - i == 1 && saveRow - j == 1 ){
      ckGrid[saveCol][saveRow] = 0;
      ckGrid[i][j] = 2;
     }
     if(saveCol - i == 1 && j - saveRow == 1){
       
      ckGrid[saveCol][saveRow] = 0;
      ckGrid[i][j] = 2;
     }
     
     if(ckGrid[saveCol-1][saveRow-1] == 1){
      
      ckGrid[saveCol][saveRow] = 0;
      ckGrid[saveCol-1][saveRow - 1] = 0;
      ckGrid[saveCol-2][saveRow - 2] = 2;
       
     }
     
     if(ckGrid[saveCol-1][saveRow+1] == 1){
       ckGrid[saveCol][saveRow] = 0;
       ckGrid[saveCol-1][saveRow + 1] = 0;
       ckGrid[saveCol-2][saveRow + 2] = 2;
       }
     
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
  
  
  println(checkCol,checkRow);
  
  
  if (isClicked){
    isClicked = false;
    
    
  }else{
    
   isClicked = true; 
  
  }  
}
