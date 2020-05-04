/**
 * Permet de Representer La Matrice tableau[i][j]
 */
class TableauDouble {
    public static void main(String[] arg) {
       int[][] tableau;
       int i, j;
 
       tableau = new int[11][11];
       for (i = 1;i < tableau.length; i++) {
          for (j = 1;j < tableau[i].length;j++) {
             tableau[i][j] = i * j;
          }
          System.out.println();
       }
       System.out.println();
       System.out.println("Affichage");
       
       for (  i = 1;i < tableau.length; i++) {
        for (  j = 1;j < tableau[i].length;j++) {
            
           System.out.print("|"+tableau[i][j] + "");
        }
        System.out.println("");
     }
 }
}