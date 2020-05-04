/**
 * Permet de Visualiser la question 5.1
*
*/
public class TabMult{
    

    public static void main(String[] args) {
        

     System.out.print("X*Y\t| ");
     for(int x = 1 ; x <= 10; x++)
        System.out.print(x+"\t");
     System.out.println();
     for(int x = 1 ; x <= 10; x++)
         System.out.print("=========");
     System.out.println();
     for(int x = 1 ; x <= 10; x++){
      System.out.print(x+"\t| ");
      for(int y = 1 ; y <= 10; y++){
           
           System.out.print(x*y+"\t");
      }
      System.out.println();
     }
      
    }

   }