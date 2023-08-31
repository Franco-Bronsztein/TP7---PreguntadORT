public  class Pregunta 
{
    public int  IdPregunta{get; set;}
    public int FK_IdCategoria{get;set;}
    public int FK_IdDificultad{get;set;}
    public string Enunciado{get;set;}
}