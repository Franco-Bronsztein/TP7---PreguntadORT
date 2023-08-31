public class Respuesta
{
    public int IdRespuesta{get; set;}
    public int FK_IdPregunta{get; set;}
    public int opcion{get; set;}
    public string Contenido{get; set;}
    public bool  Correcta{get; set;}
}