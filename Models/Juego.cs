public static class Juego
{
    private static string username;
    private static int _puntajeActual;
    private static int _cantidadPreguntasCorrectas;
    public static List<Pregunta> _preguntas = new List<Pregunta>();
    private static List<Respuesta> _respuestas = new List<Respuesta>();

    public static void InicializarJuego()
    {
        username = "";
        _puntajeActual = 0;
        _cantidadPreguntasCorrectas = 0;
    }

    public static List<Categoria> ObtenerCategorias()
    {
        return BD.ObtenerCategoria();
    }

    public static List<Dificultad> ObtenerDificultades()
    {
        return BD.ObtenerDificultad();
    }

    public static void CargarPartida(string username, int dificultad, int categoria)
    {
        _preguntas = BD.ObtenerPreguntas(dificultad,categoria);
        _respuestas = BD.ObtenerRespuestas(_preguntas);
    }   

    public static Pregunta ObtenerProximaPregunta(List<Pregunta> _preguntas)
    {
        Random random = new Random();
        int numeroAleatorio = random.Next(0, _preguntas.Count);
        Pregunta pregunta = _preguntas[numeroAleatorio];
        return pregunta;
    }

    public static List<Respuesta> ObtenerProximasRespuestas(int idPregunta)
    {
        List<Respuesta> listaRespuestas = new List<Respuesta>();
        foreach (var item in _respuestas)
        {
            if(idPregunta == item.FK_IdPregunta)
            {
                listaRespuestas.Add(item);
            }
        } 
        return listaRespuestas;
    }
    public static bool VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        bool trueorfalse = false;
        foreach (Respuesta item in _respuestas)
        {
            if(item.IdRespuesta == idRespuesta && item.Correcta == true)
            {
                _puntajeActual = _puntajeActual + 5;
                _cantidadPreguntasCorrectas++;
                _preguntas.Remove(_preguntas[idPregunta]);
                trueorfalse = true;
            }
            else
            {
                trueorfalse = false;
            }
        }
        return trueorfalse;
    }
}