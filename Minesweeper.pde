import de.bezier.guido.*;
public final int NUM_ROWS = 20;
public final int NUM_COLS = 20;
public final int NUM_BOMBS = 10;//Declare and initialize NUM_ROWS and NUM_COLS = 20
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> bombs = new ArrayList <MSButton>();
//ArrayList of just the minesweeper buttons that are mine
void setup ()
{
    
    size(400, 400);
    textAlign(CENTER,CENTER);
    
    // make the manager
    Interactive.make( this );
    buttons = new MSButton[20][20];
    int row, col =(int)(Math.random()*20);
    for(int r = 0; r < buttons.length; r++){
        for(int c = 0; c < buttons[0].length; c++){
            buttons[r][c] = new MSButton(r,c);
        }
    }
    //your code to initialize buttons goes here
    setBombs();
}
public void setBombs()
{
    
    while(bombs.size() < NUM_BOMBS){
    int row = (int)(Math.random()*20);
    int col = (int)(Math.random()*20);
    if(bombs.contains(buttons) == false)
        bombs.add(buttons[row][col]);
    System.out.println(row + "," + col);
    }
}
public void draw ()
{
    background( 0 );
    if(isWon())
        displayWinningMessage();
}
public boolean isWon()
{
    //your code here
    return false;
}
public void displayLosingMessage()
{
    //your code here
}
public void displayWinningMessage()
{
    //your code here
}

public class MSButton
{
    private int r, c;
    private float x,y, width, height;
    private boolean clicked, marked;
    private String label;
    
    public MSButton ( int rr, int cc )
    {
        width = 400/NUM_ROWS;
        height = 400/NUM_COLS;
        r = rr;
        c = cc; 
        x = c*width;
        y = r*height;
        label = "";
        marked = clicked = false;
        Interactive.add( this ); // register it with the manager
    }
    public boolean isMarked()
    {
        return marked;
    }
    public boolean isClicked()
    {
        return clicked;
    }
    // called by manager
    
    public void mousePressed () 
    {
        clicked = true;
        //your code here
    }

    public void draw () 
    {    
        if (marked)
            fill(0);
        else if( clicked && bombs.contains(this) ) 
            fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else 
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(label,x+width/2,y+height/2);
    }
    public void setLabel(String newLabel)
    {
        label = newLabel;
    }
    public boolean isValid(int r, int c)
    {
        if(r <= 19 && r >= 0 && c >= 0 && c <= 19)
        return true;
        return false;
    }
    public int countBombs(int row, int col)
    {
        int numBombs = 0;
        if(isValid(row-1,col)&&bombs.contains(buttons[row-1][col])){
            numBombs++;
        }
        if(isValid(row+1,col)&&bombs.contains(buttons[row+1][col])){
            numBombs++;
        }
        if(isValid(row,col+1)&&bombs.contains(buttons[row][col+1])){
            numBombs++;
        }
        if(isValid(row,col-1)&&bombs.contains(buttons[row][col-1])){
            numBombs++;
        }
        if(isValid(row-1,col-1)&&bombs.contains(buttons[row-1][col-1])){
            numBombs++;
        }
        if(isValid(row+1,col+1)&&bombs.contains(buttons[row+1][col+1])){
            numBombs++;
        }
        if(isValid(row+1,col-1)&&bombs.contains(buttons[row+1][col-1])){
            numBombs++;
        }
        if(isValid(row-1,col+1)&&bombs.contains(buttons[row-1][col+1])){
            numBombs++;
        }
        return numBombs;
    }
}




