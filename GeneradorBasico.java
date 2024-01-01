import java.io.*;
import java.util.ArrayList;
import java.util.Random;

public class GeneradorBasico {

    static BufferedWriter writer;
    static ArrayList<String> Libros = new ArrayList<String>();
    static ArrayList<String> Predecesores = new ArrayList<String>();
    static ArrayList<String> Leidos = new ArrayList<String>();
    static ArrayList<String> Aplanificar = new ArrayList<String>();

    public static void main(String[] args) throws IOException {
        writer = new BufferedWriter(new FileWriter("GproblemaNivelBasico.pddl", true));
        generaLibros();
        defineObjects();
        init();
        goal();
        writer.close();
    }

    public static void defineObjects() throws IOException {
        writer.write("(define (problem nivelBasico) (:domain nivelBasico)\n");
        writer.write("(:objects\n");
        for(int i=0; i<Libros.size();++i)
        {
            writer.write(" "+Libros.get(i));
        }
        writer.write(" - libro");
        writer.write("\n)\n");
    }

    
    public static void init() throws IOException{
        writer.write("(:init \n");
      
        generaPredecesores();
        writer.write(";Juego de Prueba de Predecesores\n");
        for(int i=0; i<Predecesores.size()-1;++i)
        {   
            writer.write("   (esPredecesor "+Predecesores.get(i)+" "+Predecesores.get(i+1)+")\n");
        }

        generaLeidos();
        writer.write(";Juego de Prueba de Leidos\n");
        for(int i=0; i<Leidos.size();++i)
        {   
            writer.write("   (libroLeido "+Leidos.get(i)+")\n");
        }

        generaAplanificar();
        writer.write(";Juego de Prueba de Aplanificar\n");
        for(int i=0; i<Aplanificar.size();++i)
        {   
            writer.write("   (libroAPlanificar "+Aplanificar.get(i)+")\n");
        }
        
        writer.write(")\n");
    }

    private static void generaPredecesores(){
        Random rand = new Random();
        int numPred = rand.nextInt(Libros.size());
        ArrayList<String> LibrosAux = new ArrayList<String>();

        for(int i=0; i<numPred ; ++i)
        {
            int libro = rand.nextInt(Libros.size());    //Escojo un libro de forma aleatoria
            Predecesores.add(Libros.get(libro));        //lo meto en el array de predecesores
            LibrosAux.add(Libros.get(libro));           //Añadimos los libros que vamos a quitar para generar los leidos
            Libros.remove(libro);                       //lo quito del array de libros para que no vuelva a salir
        }
        Libros.addAll(LibrosAux);                       //Añadimos los libros previamente borrados
    }

    private static void generaLeidos(){
        Random rand = new Random();
        int numPred = rand.nextInt(Libros.size());
        ArrayList<String> LibrosAux = new ArrayList<String>();

        for(int i=0; i<numPred ; ++i)
        {
            int libro = rand.nextInt(Libros.size());    //Escojo un libro de forma aleatoria
            Leidos.add(Libros.get(libro));              //lo meto en el array de Leidos
            LibrosAux.add(Libros.get(libro));           //Añadimos los libros que vamos a quitar para generar los Aplanificar
            Libros.remove(libro);                       //lo quito del array de libros para que no vuelva a salir
        }
        Libros.addAll(LibrosAux);                       //Añadimos los libros previamente borrados
    }

    private static void generaAplanificar(){
        Random rand = new Random();
        int numPred = rand.nextInt(Libros.size());
        ArrayList<String> LibrosAux = new ArrayList<String>();

        for(int i=0; i<numPred ; ++i)
        {
            int libro = rand.nextInt(Libros.size());    //Escojo un libro de forma aleatoria
            Aplanificar.add(Libros.get(libro));         //lo meto en el array de Aplanificar
            LibrosAux.add(Libros.get(libro));           //Añadimos los libros que vamos a quitar
            Libros.remove(libro);                       //lo quito del array de libros para que no vuelva a salir
        }
        Libros.addAll(LibrosAux);                       //Añadimos los libros previamente borrados
    }

    private static void generaLibros(){
        Random rand = new Random();
        int libro = rand.nextInt(150);
        
        for(int i=0; i<libro ; ++i)
        {
            String str = "book" + i;
            Libros.add(str);
        }
    }

    public static void goal() throws IOException{
        writer.write("(:goal (not (exists (?l - libro) \n" + //
                "                (and (libroAPlanificar ?l) (not (libroPlanificado ?l)))\n" + //
                "              )\n" + //
                "          )\n" + //
                "    )\n");
        writer.write(")"); //cierra el define
    }
    
}