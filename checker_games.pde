int[][] ckGrid = {{0,1,0,1,0,1,0,1},
                  {1,0,1,0,1,0,1,0},
                  {0,0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0,0},
                  {0,0,3,0,0,0,0,0},
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
      noStroke();
     fill(255,0,0); 
     circle(50+(j*100),50+(i*100),100*ckGrid[i][j]);
    }
    if (ckGrid[i][j] == 2){
     noStroke();
     fill(0,0,255); 
     circle(50+(j*100),50+(i*100),50*ckGrid[i][j]);
    }
    if (ckGrid[i][j] == 4){
     strokeWeight(5);
     fill(0,0,255);
     stroke(#090088);
     circle(40+(j*100),60+(i*100),20*ckGrid[i][j]);
     circle(60+(j*100),40+(i*100),20*ckGrid[i][j]);
    }
    if(ckGrid[i][j] == 3){
     stroke(#990000);
     fill(255,0,0);
     circle(40+(j*100),60+(i*100),27*ckGrid[i][j]);
     circle(60+(j*100),40+(i*100),27*ckGrid[i][j]);
    }
     
      }
      
    
  }

}
void selectCk(){
  int i = checkCol;
  int j = checkRow;
  int forCal2_red = 2;
  int forCal2_blue = 2;
  
  //red zone
  if(isClicked){
    
  if (ckGrid[i][j] == 1){
   saveCol = i;
   saveRow = j;
   
   noFill();
   strokeWeight(5);
   stroke(0,255,0);
   circle(50+(j*100),50+(i*100),100*ckGrid[i][j]);
   noStroke();
   fill(0,255,0,100);
   
   
   if (i+1 < 8 && j-1 >= 0){
     
     if (ckGrid[i+1][j-1] == 0){
       square((j*100)-100,(i*100)+100,100);
       
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
   
   // red ulti
   if(ckGrid[i][j] == 3){
     
    saveCol = i;
    saveRow = j; 
    noFill();
    strokeWeight(5);
    stroke(0,255,0);
    circle(40+(j*100),60+(i*100),27*ckGrid[i][j]);
    circle(60+(j*100),40+(i*100),27*ckGrid[i][j]);
    
      
     for(int l = 1; l < height/100 ; l++){ // left up
     
     if(saveCol - l >= 0 && saveRow - l >= 0 ){
     if(ckGrid[saveCol-l][saveRow-l] != 1 && ckGrid[saveCol-l][saveRow-l] != 3 && ckGrid[saveCol-l][saveRow-l] != 4){
      fill(0,255,0,100);
      noStroke();
      square((j*100)-100*l,(i*100)-100*l,100);
      if(i - l >= 0 && j - l >= 0){
       if(ckGrid[i-l][j-l] == 2){
        fill(255,0,0,150);
        square((j*100)-100*l,(i*100)-100*l,100);
        
        }
       
       }
      
      }
     }
    }
    
    
     for(int r = 1; r < height/100; r++){ //right up
      if(saveCol - r >= 0 && saveRow + r < 8 ){
       if(ckGrid[saveCol-r][saveRow+r] != 1 && ckGrid[saveCol-r][saveRow+r] != 3 && ckGrid[saveCol-r][saveRow+r] != 4){
         noStroke();
        fill(0,255,0,100);
        square((j*100)+100*r,(i*100)-100*r,100); 
      
         if(i - r >= 0 && j + r < 8){
          if(ckGrid[i-r][j+r] == 2){
        
           fill(255,0,0,150);
           square((j*100)+100*r,(i*100)-100*r,100);
        }
       
       }
      }
     }
    }
     
     for(int r = 1; r < height/100; r++){ // right down
      if(saveCol + r < 8 && saveRow + r < 8 ){
       if(ckGrid[saveCol+r][saveRow+r] != 1 && ckGrid[saveCol+r][saveRow+r] != 3 && ckGrid[saveCol+r][saveRow+r] != 4){ 
        noStroke();
        fill(0,255,0,100);
        square((j*100)+100*r,(i*100)+100*r,100); 
      
        if(i + r < 8 && j + r < 8){
         if(ckGrid[i+r][j+r] == 2){
        
          fill(255,0,0,150);
          square((j*100)+100*r,(i*100)+100*r,100);
         }
       
        }
       }
      }
     }
     
     for(int r = 1; r < height/100; r++){  // left down
     
     if(saveCol + r < 8 && saveRow - r >= 0){
      if(ckGrid[saveCol+r][saveRow-r] != 1 && ckGrid[saveCol+r][saveRow-r] != 3 && ckGrid[saveCol+r][saveRow-r] != 4){  
        noStroke();
       fill(0,255,0,100);
       square((j*100)-100*r,(i*100)+100*r,100); 
      
       if(i + r < 8 && j - r >= 0){
        if(ckGrid[i+r][j-r] == 2){
       
         fill(255,0,0,150);
         square((j*100)-100*r,(i*100)+100*r,100);
         }
       
        }
       }
      }
     }
   }
   
   
  //blue zone
  }else{
  
  
  if (ckGrid[i][j] == 2){
   saveCol = i;
   saveRow = j; 
   noFill();
   strokeWeight(5);
   stroke(0,255,0);
   circle(50+(j*100),50+(i*100),50*ckGrid[i][j]);
   noStroke();
   fill(0,255,0,100);
   
   if(j-1 >= 0 && i-1 >= 0){
     if (ckGrid[i-1][j-1] == 0){
      square((j*100)-100,(i*100)-100,100);
    
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
   
   //blue ulti
   if(ckGrid[i][j] == 4){
    saveCol = i;
    saveRow = j; 
    
    noFill();
    strokeWeight(5);
    stroke(0,255,0);
    circle(40+(j*100),60+(i*100),20*ckGrid[i][j]);
    circle(60+(j*100),40+(i*100),20*ckGrid[i][j]);
    
    for(int l = 1; l < height/100; l++){  
      noStroke();
      fill(0,255,0,100);
      square((j*100)+100*l,(i*100)+100*l,100);
      square((j*100)+100*l,(i*100)-100*l,100);
      square((j*100)-100*l,(i*100)+100*l,100);
      square((j*100)-100*l,(i*100)-100*l,100);
      
     if(i + l < 8 && j + l < 8){
       fill(255,0,0,200);
      if(ckGrid[i+l][j+l] == 1){
        square((j*100)+100*l,(i*100)+100*l,100);
      }
     }
     if(i + l < 8 && j - l >= 0){
      if(ckGrid[i+l][j-l] == 1){
        
        square((j*100)-100*l,(i*100)+100*l,100);
      }
     }
     if(i - l >= 0 && j + l < 8){
      if(ckGrid[i-l][j+l] == 1){
        
        square((j*100)+100*l,(i*100)-100*l,100);
      }
     }
     if(i - l >= 0 && j - l >= 0){
      if(ckGrid[i-l][j-l] == 1){
        
        square((j*100)-100*l,(i*100)-100*l,100);
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
  
  if (ckGrid[0][1] == 2){
   ckGrid[0][1] = 4 ; 
  }else if(ckGrid[0][3] == 2){
    ckGrid[0][3] = 4;
  }else if(ckGrid[0][5] == 2){
   ckGrid[0][5] = 4; 
  }else if(ckGrid[0][7] == 2){
   ckGrid[0][7] = 4; 
  }
  
  if(ckGrid[7][0] == 1){
   ckGrid[7][0] = 3;
  }else if(ckGrid[7][2] == 1){
   ckGrid[7][2] = 3; 
  }else if(ckGrid[7][4] == 1){
   ckGrid[7][4] = 3; 
  }else if(ckGrid[7][6] == 1){
   ckGrid[7][6] = 3; 
  }
  
  //ulti red move
  if(ckGrid[saveCol][saveRow] == 3){
   if(ckGrid[i][j] != 2 & ckGrid[i][j] != 4){
    if(i - saveCol > 0 && j - saveRow > 0){ // right down
    
      int l = saveCol;
      int k = saveRow;
      while(l < i ){
       while(k < j){
        k++; 
       }
       l++; 
      }
      
      ckGrid[l][k] = 3;
      ckGrid[saveCol][saveRow] = 0;
      isClicked = false;
      
      for (int back = saveCol; back <= i ; back++){
        int n_back = i - back;
        if(ckGrid[i-n_back][j-n_back] == 2){
         ckGrid[i-n_back][j-n_back] = 0; 
         break;
        }
       
      }
    }
    if(i - saveCol > 0 && j - saveRow < 0){ // left down
    
      int l = saveCol;
      int k = saveRow;
      while(l < i ){
       while(k > j){
        k --; 
       }
       l++; 
      }
      ckGrid[l][k] = 3;
      ckGrid[saveCol][saveRow] = 0;
      isClicked = false;
      
      for (int back = saveCol; back <= i ; back++){
        int n_back = i - back;
       
         if(ckGrid[i-n_back][j+n_back] == 2){
           ckGrid[i-n_back][j+n_back] = 0;
           break;
        
         }
        
      }
    }
    
    if(i - saveCol < 0 && j - saveRow > 0){ // right up
    
      int l = saveCol;
      int k = saveRow;
      while(l > i ){
       while(k < j){
        k ++; 
       }
       l--; 
      }
      ckGrid[l][k] = 3;
      ckGrid[saveCol][saveRow] = 0;
      isClicked = false;
      
      for (int back = saveCol; back >= i ; back--){
        int n_back = back - i;
  
        if(ckGrid[i+n_back][j-n_back] == 2){
         ckGrid[i+n_back][j-n_back] = 0; 
         break;
         
        
       }
      
     }
    }
    
    if(i - saveCol < 0 && j - saveRow < 0){ // left up
    
      int l = saveCol;
      int k = saveRow;
      while(l > i ){
       while(k > j){
        k --; 
       }
       l--; 
      }
      ckGrid[l][k] = 3;
      ckGrid[saveCol][saveRow] = 0;
      isClicked = false;
      
      for (int back = saveCol; back >= i ; back--){
        int n_back = back - i;
       if(ckGrid[i+n_back][j+n_back] == 2){
        ckGrid[i+n_back][j+n_back] = 0; 
        break;
        
       }
      
     }
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

  
}
