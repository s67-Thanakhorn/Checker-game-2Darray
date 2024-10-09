PImage img;
int[][] ckGrid = {{0,1,0,1,0,1,0,1},
                  {1,0,1,0,1,0,1,0},
                  {0,0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0,0},
                  {0,2,0,2,0,2,0,2},
                  {2,0,2,0,2,0,2,0}};

boolean turn = false;
boolean restartClicked = false;
int checkRow,checkCol,saveCol,saveRow,saveColred,saveRowred,saveColblue,saveRowblue;

int redWins_count,blueWins_count;
float sizeSave = 1;
float sizeLoad = 1;
boolean saveClicked = false;
boolean loadClicked = false;

boolean eatStreaks_right = false;
boolean eatStreaks_left = false;

void setup(){
 background(0);
 size(1100,800);
 img = loadImage("wood.jpg");
 
}

void drawBoard(){
  rectMode(CORNER);
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
  
  for (int i = 0; i < col; i++){
    for (int j = 0; j < row; j++){
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
  if(turn){
    
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
     
     if(eatStreaks_right == false){
       
     if (ckGrid[i+1][j-1] == 0){ // left down
       square((j*100)-100,(i*100)+100,100);
     
       
     }
    }
       
      if (ckGrid[i+1][j-1] == 2 || ckGrid[i+1][j-1] == 4){                      
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

   if (j+1 < 8 && i+1 < 8){
     
    if(eatStreaks_left == false){
     if (ckGrid[i+1][j+1] == 0){// right down
      square((j*100)+100,(i*100)+100,100);
      
      }
     }
      
        if (ckGrid[i+1][j+1] == 2 || ckGrid[i+1][j+1] == 4){
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
     if(ckGrid[saveCol-l][saveRow-l] != 1 && ckGrid[saveCol-l][saveRow-l] != 3 ){
      fill(0,255,0,100);
      noStroke();
      square((j*100)-100*l,(i*100)-100*l,100);
      if(i - l >= 0 && j - l >= 0){
       if(ckGrid[i-l][j-l] == 2 ||ckGrid[i-l][j-l] == 4){
        fill(255,0,0,150);
        square((j*100)-100*l,(i*100)-100*l,100);
        
        }
       
       }
      
      }
     }
    }
    
    
     for(int r = 1; r < height/100; r++){ //right up
      if(saveCol - r >= 0 && saveRow + r < 8 ){
       if(ckGrid[saveCol-r][saveRow+r] != 1 && ckGrid[saveCol-r][saveRow+r] != 3 ){
         noStroke();
        fill(0,255,0,100);
        square((j*100)+100*r,(i*100)-100*r,100); 
      
         if(i - r >= 0 && j + r < 8){
          if(ckGrid[i-r][j+r] == 2 || ckGrid[i-r][j+r] == 4){
        
           fill(255,0,0,150);
           square((j*100)+100*r,(i*100)-100*r,100);
        }
       
       }
      }
     }
    }
     
     for(int r = 1; r < height/100; r++){ // right down
      if(saveCol + r < 8 && saveRow + r < 8 ){
       if(ckGrid[saveCol+r][saveRow+r] != 1 && ckGrid[saveCol+r][saveRow+r] != 3 ){ 
        noStroke();
        fill(0,255,0,100);
        square((j*100)+100*r,(i*100)+100*r,100); 
      
        if(i + r < 8 && j + r < 8){
         if(ckGrid[i+r][j+r] == 2 || ckGrid[i+r][j+r] == 4){
        
          fill(255,0,0,150);
          square((j*100)+100*r,(i*100)+100*r,100);
         }
       
        }
       }
      }
     }
     
     for(int r = 1; r < height/100; r++){  // left down
     
     if(saveCol + r < 8 && saveRow - r >= 0 ){
      if(ckGrid[saveCol+r][saveRow-r] != 1 && ckGrid[saveCol+r][saveRow-r] != 3 ){  
        noStroke();
       fill(0,255,0,100);
       square((j*100)-100*r,(i*100)+100*r,100); 
      
       if(i + r < 8 && j - r >= 0){
        if(ckGrid[i+r][j-r] == 2 || ckGrid[i+r][j-r] == 4){
       
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
     if(eatStreaks_right == false){
       
     if (ckGrid[i-1][j-1] == 0){ //top left
      square((j*100)-100,(i*100)-100,100);
    
     }
     }
       if (ckGrid[i-1][j-1] == 1|| ckGrid[i-1][j-1] == 3){
         
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
   if (j+1 < 8 && i-1 >= 0){
    
    if(eatStreaks_left == false){
     if (ckGrid[i-1][j+1] == 0){//top right
      square((j*100)+100,(i*100)-100,100);
      
     }
     }
       if (ckGrid[i-1][j+1] == 1 || ckGrid[i-1][j+1] == 3){
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
      if(i+l < 8 && j+l < 8 ){
       if(ckGrid[i+l][j+l] != 2 && ckGrid[i+l][j+l] != 4){
        square((j*100)+100*l,(i*100)+100*l,100); // right down
       }
      }
      
      if(i-l >= 0 && j+l < 8){
       if(ckGrid[i-l][j+l] != 2 && ckGrid[i-l][j+l] != 4){
        square((j*100)+100*l,(i*100)-100*l,100); // right up
       }
      }
      
      if( i + l < 8 && j - l >= 0){
       if(ckGrid[i+l][j-l] != 2 && ckGrid[i+l][j-l] != 4){
        square((j*100)-100*l,(i*100)+100*l,100); // left down
       }
      }
      
      if(i - l >= 0 && j - l >= 0){
       if(ckGrid[i-l][j-l] != 2 && ckGrid[i-l][j-l] != 4 ){
        square((j*100)-100*l,(i*100)-100*l,100);
       }
      }
      
      // target
     if(i + l < 8 && j + l < 8){
       fill(255,0,0,200);
      if(ckGrid[i+l][j+l] == 1 || ckGrid[i+l][j+l] == 3){ // right down
        square((j*100)+100*l,(i*100)+100*l,100);
      }
     }
     if(i + l < 8 && j - l >= 0){
      if(ckGrid[i+l][j-l] == 1 ||ckGrid[i+l][j-l] == 3){ // left down
        fill(255,0,0,200);
        square((j*100)-100*l,(i*100)+100*l,100);
      }
     }
     if(i - l >= 0 && j + l < 8){
      if(ckGrid[i-l][j+l] == 1 || ckGrid[i-l][j+l] == 3){ // right up
        fill(255,0,0,200);
        square((j*100)+100*l,(i*100)-100*l,100);
      }
     }
     if(i - l >= 0 && j - l >= 0){
      if(ckGrid[i-l][j-l] == 1 || ckGrid[i-l][j-l] == 3){ // left up
        fill(255,0,0,200);
        square((j*100)-100*l,(i*100)-100*l,100);
      }
     }
    }
     
   }
   
  }
  
  // move and eat
  if (ckGrid[i][j] == 0){
  
    //red move
   
   if(ckGrid[saveCol][saveRow] == 1){ 
     
    if(eatStreaks_left == false){
     if(saveCol + 1 == i && saveRow + 1 == j){ // right down
      ckGrid[i][j] = 1;
      ckGrid[saveCol][saveRow] = 0;
      turn = false;
     
     }
    }
    
    if(eatStreaks_right == false){
     if(saveCol + 1 == i && saveRow - 1 == j){ //left down
      ckGrid[i][j] = 1;
      ckGrid[saveCol][saveRow] = 0;
      turn = false;
     }
    }
    
    //red eat
   
   if(i-2 >= 0 && j - 2 >= 0){ 
    if (ckGrid[i-2][j-2] == 1){ // right down
     if(ckGrid[i-1][j-1] == 2 || ckGrid[i-1][j-1] == 4){
      ckGrid[i][j] = 1;
      ckGrid[saveCol+1][saveRow+1] = 0;
      ckGrid[saveCol][saveRow] = 0;
      turn = false;
      
      //eat Streaks right down
      if(i+1 < 8 && j+1 < 8 && i+2 <8 && j+2 < 8){ //error protect
      if(ckGrid[i+1][j+1] == 2 || ckGrid[i+1][j+1] == 4){
        eatStreaks_right = true;
       if(ckGrid[i+2][j+2] == 0){
           turn = true;
           
         }
        }
      }else{
         turn = false;
         eatStreaks_right = false;
        
       }
     }
    }
   }
   
   if(i - 2 >= 0 && j + 2 < 8){
   if(ckGrid[i-2][j+2] == 1){ // left down
    if(ckGrid[i-1][j+1] == 2 || ckGrid[i-1][j+1] == 4){
     ckGrid[i][j] = 1;
     ckGrid[i-1][j+1] = 0;
     ckGrid[i-2][j+2] = 0;
     turn = false;
     
     //eat Streaks left down
    if(i+1 < 8 && j-1 >= 0 && j-2 >= 0){ //error protect
      if(ckGrid[i+1][j-1] == 2 || ckGrid[i+1][j-1] == 4){
        eatStreaks_left = true;
       if(ckGrid[i+2][j-2] == 0){
          turn = true;
          
         }
        }
      }else{
         turn = false;
         eatStreaks_left = false;
         
       }
     }
    }
   }
    
  }
   
   //blue
   if(ckGrid[saveCol][saveRow] == 2){
    if(saveCol - 1 == i && saveRow - 1 == j){
     ckGrid[i][j] = 2;
     ckGrid[saveCol][saveRow] = 0;
     turn = true;

    }
    if(saveCol - 1 == i && saveRow + 1 == j){
     ckGrid[i][j] = 2;
     ckGrid[saveCol][saveRow] = 0;
     turn = true;

    }
    if(i + 2 < 8 && j - 2 >= 0){
      if(ckGrid[i+2][j-2] == 2){  //top right
       if(ckGrid[i+1][j-1] == 1 || ckGrid[i+1][j-1] == 3){
        ckGrid[i][j] = 2;
        ckGrid[i+1][j-1] = 0;
        ckGrid[i+2][j-2] = 0;
        turn = true;
        
         //eat Streaks top right
        if(i-1 >= 0 && j+1 < 8 && i-2 >= 0 && j+2 < 8){ //error protect
         if(ckGrid[i-1][j+1] == 1 || ckGrid[i-1][j+1] == 3){
          if(ckGrid[i-2][j+2] == 0){
            turn = false; 
            eatStreaks_right = true;
          }
         }
        }else{
         turn = true; 
         eatStreaks_right = false;
        }
        
        
      }
     }
    }
    
    if( i + 2 < 8 && j + 2 < 8){
     if(ckGrid[i+2][j+2] == 2){ // top left
      if(ckGrid[i+1][j+1] == 1 || ckGrid[i+1][j+1] == 3){
       ckGrid[i][j] = 2;
       ckGrid[i+1][j+1] = 0;
       ckGrid[i+2][j+2] = 0;
       turn = true;
       
       //eat Streaks top left
        if(i-1 >= 0 && j-1 >= 0 && i-2 >= 0 && j-2 >= 0){ //error protect
         if(ckGrid[i-1][j-1] == 1 || ckGrid[i-1][j-1] == 3){
          if(ckGrid[i-2][j-2] == 0){
            turn = false;
            eatStreaks_left = true;
            
          }
         }
        }else{
         turn = true;
         eatStreaks_left = false;
      }
       
       
      }
     }
    }
   
        
   
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
      turn = false;
      
      for (int back = saveCol; back <= i ; back++){
        int n_back = i - back;
        if(ckGrid[i-n_back][j-n_back] == 2 || ckGrid[i-n_back][j-n_back] == 4){
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
      turn = false;
      
      for (int back = saveCol; back <= i ; back++){
        int n_back = i - back;
       
         if(ckGrid[i-n_back][j+n_back] == 2 || ckGrid[i-n_back][j+n_back] == 4){
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
      turn = false;
      
      for (int back = saveCol; back >= i ; back--){
        int n_back = back - i;
  
        if(ckGrid[i+n_back][j-n_back] == 2 || ckGrid[i+n_back][j-n_back] == 4){
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
      turn = false;
      
      for (int back = saveCol; back >= i ; back--){
        int n_back = back - i;
       if(ckGrid[i+n_back][j+n_back] == 2 || ckGrid[i+n_back][j+n_back] == 4){
        ckGrid[i+n_back][j+n_back] = 0; 
        break;
        
       }
      
      }
     } 
    }
   }
   
   //ulti blue move
   
   if(ckGrid[saveCol][saveRow] == 4){
     
    if(ckGrid[i][j] != 1 & ckGrid[i][j] != 3){
     if(i - saveCol > 0 && j - saveRow > 0){ // right down
    
      int l = saveCol;
      int k = saveRow;
      while(l < i ){
       while(k < j){
        k++; 
       }
       l++; 
      }
      
      ckGrid[l][k] = 4;
      ckGrid[saveCol][saveRow] = 0;
      turn = true;
      
      for (int back = saveCol; back <= i ; back++){
        int n_back = i - back;
        if(ckGrid[i-n_back][j-n_back] == 1 || ckGrid[i-n_back][j-n_back] == 3){
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
      ckGrid[l][k] = 4;
      ckGrid[saveCol][saveRow] = 0;
      turn = true;
      
      for (int back = saveCol; back <= i ; back++){
        int n_back = i - back;
       
         if(ckGrid[i-n_back][j+n_back] == 1 || ckGrid[i-n_back][j+n_back] == 3){
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
      ckGrid[l][k] = 4;
      ckGrid[saveCol][saveRow] = 0;
      turn = true;
      
      for (int back = saveCol; back >= i ; back--){
        int n_back = back - i;
  
        if(ckGrid[i+n_back][j-n_back] == 1 || ckGrid[i+n_back][j-n_back] == 3){
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
      ckGrid[l][k] = 4;
      ckGrid[saveCol][saveRow] = 0;
      turn = true;
      
      for (int back = saveCol; back >= i ; back--){
        int n_back = back - i;
       if(ckGrid[i+n_back][j+n_back] == 1 || ckGrid[i+n_back][j+n_back] == 3){
        ckGrid[i+n_back][j+n_back] = 0; 
        break;
        
       }
      
     }
    }
    
     
    
    }
   }
 
}

void matchWin(){
  //redwins
 int i = 0;
 int j = 0;

  
  for( i = 0 ; i < ckGrid.length  ; i++){
    
    for( j = 0 ; j < ckGrid[0].length ; j++){ 
      
      if(ckGrid[i][j] != 2 && ckGrid[i][j] != 4){        
        redWins_count ++;   

       if(redWins_count > 100){
        noStroke();  
        fill(255);
        rect(0,300,800,200);
        fill(255,0,0);
        textSize(150);
        text("RED WIN!",110,450);
        restart();
        
        redWins_count = 0;
        noLoop();
        
      }
     }else{
       
      redWins_count = 0; 
     }  
     
  //blue win
      
     if(ckGrid[i][j] != 1 && ckGrid[i][j] != 3){
        
        blueWins_count ++;
        
       if(blueWins_count > 100){
        noStroke();
        fill(255);
        rect(0,300,800,200);
        fill(0,0,255);
        textSize(150);
        text("BLUE WIN!",70,450);
        restart();
        
        blueWins_count = 0;
        noLoop();
        
      }
     }else{
      blueWins_count = 0; 
     }
    }
   }
}

void restart(){
  
  
  noStroke();
  fill(255);
  rect(150,525,500,50,10,10,10,10);
  textSize(40);
  fill(0);
  text("press any key to restart",200,560);
  restartClicked = true;

  
}

void showTurn(){
  
 noStroke();
 image(img,800,0,500,800);
 textSize(70);
 if(turn){
   fill(255,255,255,150);
   rect(800,300,300,150);
   fill(255,0,0);
   text("Red turn",830,400);
 }else{
   fill(255,255,255,150);
   rect(800,300,300,150);
   fill(0,0,255);
   text("Blue turn",820,400);
   
 } 
}

void saveGame(){
   rectMode(CENTER);
   fill(255,255,255);
   rect(950,590,200*sizeSave,50*sizeSave,10,10,10,10);
   fill(0);
   textSize(40);
   text("save game",860,600);
   
   fill(255,255,255);
   rect(950,670,200*sizeLoad,50*sizeLoad,10,10,10,10);
   fill(0);
   textSize(40);
   text("load game",860,680);
   
   rectMode(CORNER);
   // save button zone
   if(mouseX >= 850 && mouseY >= 565 && mouseX <= 1050 &&  mouseY <= 615  ){
    sizeSave = 1.1;
     
   }else{
    sizeSave = 1; 
   }
   if(saveClicked){
    
    String[] lines = new String[ckGrid.length];
 
     for (int i = 0; i < ckGrid.length; i++) {
        String[] strRow = new String[ckGrid[i].length];
       for (int j = 0; j < ckGrid[i].length; j++) {
         strRow[j] = str(ckGrid[i][j]); 
      }
      lines[i] = join(strRow, " ");
    }

    saveStrings("save.txt", lines);
    
    String[] booleanString = {Boolean.toString(turn)};
    saveStrings("booleanValue.txt", booleanString);
    
    saveClicked = false;
    
    
    
   }
   
   
   // load button zone
   
   if(mouseX >= 850 && mouseY >= 640 && mouseX <= 1080 &&  mouseY <= 690  ){
    sizeLoad = 1.1;
     
   }else{
    sizeLoad = 1; 
   }
   
   if(loadClicked){
     
     String[] lines = loadStrings("save.txt");
        for (int i = 0; i < lines.length; i++) {
           String[] values = split(lines[i], ' ');
        for (int j = 0; j < values.length; j++) {
            ckGrid[i][j] = int(values[j]);
      }
    }
     
    String[] loadString = loadStrings("booleanValue.txt");
    boolean loadBoolean = Boolean.parseBoolean(loadString[0]);
    turn = loadBoolean;
    println(loadBoolean,turn);
    
    loadClicked = false;
   }
  
}

void draw(){
  
  background(0);
  
  drawBoard();
  drawChecker();
  selectCk(); 
  matchWin();
  showTurn();
  saveGame();
  
}

void mousePressed(){
  //println(mouseX,mouseY);
  if(mouseX >= 800 || saveClicked){
   
  }else{
  checkCol = mouseY/100;
  checkRow = mouseX/100;
  }
  
  if(mouseX >= 850 && mouseY >= 565 && mouseX <= 1050 &&  mouseY <= 615  ){
    saveClicked = true;   
  }
  
  if(mouseX >= 850 && mouseY >= 640 && mouseX <= 1080 &&  mouseY <= 690  ){
   loadClicked = true; 
  }
 
}



void keyPressed(){
  
  if(restartClicked){
  loop();
   ckGrid = new int[][] {{0,1,0,1,0,1,0,1},
                         {1,0,1,0,1,0,1,0},
                         {0,0,0,0,0,0,0,0},
                         {0,0,0,0,0,0,0,0},
                         {0,0,0,0,0,0,0,0},
                         {0,0,0,0,0,0,0,0},
                         {0,2,0,2,0,2,0,2},
                         {2,0,2,0,2,0,2,0}};
    restartClicked = false;
  }
}
