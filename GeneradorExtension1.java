import java.io.*;
import java.util.ArrayList;
import java.util.Random;

public class GeneradorExtension1 {

    static BufferedWriter writer;
    static ArrayList<String> Libros = new ArrayList<String>();
    static ArrayList<ArrayList<String>> Predecesores = new ArrayList<ArrayList<String>>();
    static ArrayList<String> Leidos = new ArrayList<String>();
    static ArrayList<String> Aplanificar = new ArrayList<String>();

    public static void main(String[] args) throws IOException {
        writer = new BufferedWriter(new FileWriter("GproblemaExtension1.pddl", true));
        generaLibros();
        defineObjects();
        init();
        goal();
        writer.close();
    }

    public static void defineObjects() throws IOException {
        writer.write("(define (problem extension1) (:domain extension1)\n");
        writer.write("(:objects\n");
        for(int i=0; i<Libros.size();++i)
        {
            writer.write(" "+Libros.get(i));
        }
        writer.write(" - libro\n");
        writer.write(" enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre - mes");
        writer.write("\n)\n");
    }

    
    public static void init() throws IOException{
        writer.write("(:init \n");
        writer.write(";Juego de Prueba meses\n");
        writer.write("    (= (mesANumero enero) 1)\n" + //
                "    (= (mesANumero febrero) 2)\n" + //
                "    (= (mesANumero marzo) 3)\n" + //
                "    (= (mesANumero abril) 4)\n" + //
                "    (= (mesANumero mayo) 5)\n" + //
                "    (= (mesANumero junio) 6)\n" + //
                "    (= (mesANumero julio) 7)\n" + //
                "    (= (mesANumero agosto) 8)\n" + //
                "    (= (mesANumero septiembre) 9)\n" + //
                "    (= (mesANumero octubre) 10)\n" + //
                "    (= (mesANumero noviembre) 11)\n" + //
                "    (= (mesANumero diciembre) 12)\n");

        writer.write(";Juego de Prueba de mes libro Planificado\n");
        for(int i=0; i<Libros.size();++i)
        {
            writer.write("    (= (mesLibroPlanificado "+Libros.get(i)+") 0)\n");
        }
        generaPredecesores();
        writer.write(";Juego de Prueba de Predecesores\n");
        for(int i=0; i<Predecesores.size();++i)
        {   
            ArrayList<String> PredecesoresLibros = Predecesores.get(i);
            for(int j=0;j<PredecesoresLibros.size()-1;++j)
            {
                writer.write("   (esPredecesor "+ PredecesoresLibros.get(j+1)+" "+PredecesoresLibros.get(0)+")\n");
            }
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

    //generar libros con mas de 1 predecensia
    private static void generaPredecesores(){
        Random rand = new Random();
        int numPred = rand.nextInt(Libros.size());
        ArrayList<String> LibrosAux = new ArrayList<String>();
        
        for(int i=0; i<numPred ; ++i)
        {
            int numPredLibro = rand.nextInt(5);
            int libro = rand.nextInt(Libros.size());    //Escojo un libro de forma aleatoria 
            ArrayList<String> PredecesoresLibros = new ArrayList<String>();
            PredecesoresLibros.add(Libros.get(libro));  //Añadimos el libro al que le vamos a calcular sus predecesores

            for(int j=1;j<numPredLibro;++j) 
            {
                //calculamos los predecesores del libro escogido de forma aleatoria
                int predecesor = rand.nextInt(Libros.size());
                PredecesoresLibros.add(Libros.get(predecesor));
            }
            Predecesores.add(PredecesoresLibros);
            LibrosAux.add(Libros.get(libro));           //Añadimos los libros que vamos a quitar para generar los leidos
            Libros.remove(libro);                       //Lo eliminamos de libros para no generar ciclos de dependencia
        }
        Libros.addAll(LibrosAux);                       //Añadimos los libros previamente borrados
    }

    private static void generaLeidos(){
        Random rand = new Random();
        int numPred = rand.nextInt(Libros.size());

        for(int i=0; i<numPred ; ++i)
        {
            int libro = rand.nextInt(Libros.size());    //Escojo un libro de forma aleatoria
            Leidos.add(Libros.get(libro));              //lo meto en el array de Leidos
            Libros.remove(libro);                       //lo quito del array de libros para que no vuelva a salir
        }
    }

    private static void generaAplanificar(){
        Random rand = new Random();
        int numPred = rand.nextInt(Libros.size());

        for(int i=0; i<numPred ; ++i)
        {
            int libro = rand.nextInt(Libros.size());    //Escojo un libro de forma aleatoria de los no leidos
            Aplanificar.add(Libros.get(libro));         //lo meto en el array de Aplanificar
            Libros.remove(libro);                       //lo quito del array de libros para que no vuelva a salir
        }
    }

    private static void generaLibros(){
        Random rand = new Random();
        int libro = rand.nextInt(50);
        
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

