using System.Collections.Generic;
using System.Data.SqlClient;
using Dapper;


public static class BD
{
    private static string _connectionString = @"Server=Localhost;DataBase=PreguntadORT;Trusted_Connection=True;";
    static List<Dificultad> _ListadoDificultad = new List<Dificultad>();
    static List<Categoria> _ListadoCategorias = new List<Categoria>();
    static List<Pregunta> _ListadoPregunta = new List<Pregunta>();
    static List<Respuesta> _ListadoRespuestas = new List<Respuesta>();
    public static List<Categoria> ObtenerCategoria()
    {
        
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Categoria";
            _ListadoCategorias = db.Query<Categoria>(sql).ToList();
        }
        return _ListadoCategorias;
    }

    public static List<Dificultad> ObtenerDificultad()
    {
        
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM Dificultad";
            _ListadoDificultad = db.Query<Dificultad>(sql).ToList();
        }
        return _ListadoDificultad;
    }

    public static List<Pregunta> ObtenerPreguntas(int dificultad, int categoria)
    {
        
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            if (dificultad == -1 & categoria == -1)
            {
                string sql = "SELECT * FROM Preguntas";
                _ListadoPregunta = db.Query<Pregunta>(sql).ToList();
            }
            else if(dificultad == -1 )
            {
                string sql = "SELECT * FROM Preguntas WHERE FK_IdCategoria = @pCategoria";
                _ListadoPregunta = db.Query<Pregunta>(sql, new {pCategoria = categoria}).ToList();
            }
            else if(categoria == -1)
            {
                string sql = "SELECT * FROM Preguntas WHERE FK_IdDificultad = @pDificultad";
                _ListadoPregunta = db.Query<Pregunta>(sql, new { pDificultad = dificultad}).ToList();
            }
            else
            {
                string sql = "SELECT * FROM Preguntas WHERE FK_IdDificultad = @pDificultad AND FK_IdCategoria = @pCategoria";
                _ListadoPregunta = db.Query<Pregunta>(sql, new { pDificultad = dificultad,pCategoria = categoria} ).ToList();
            }
            return _ListadoPregunta;
        }  
    }

    public static List<Respuesta> ObtenerRespuestas(List<Pregunta> preguntas)
    {
        
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "";
            foreach (Pregunta item in _ListadoPregunta)
            {
                sql = "SELECT * FROM Respuestas WHERE FK_IdPregunta = @pPreguntas";
                _ListadoRespuestas = db.Query<Respuesta>(sql, new{pPreguntas = item.IdPregunta}).ToList();
            }
        }
        return _ListadoRespuestas;
    }
}