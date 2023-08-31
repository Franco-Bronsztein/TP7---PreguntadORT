using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP7_PreguntadORT.Models;

namespace TP7_PreguntadORT.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View("Index");
    }
    public IActionResult ConfigurarJuego()
    {
        Juego.InicializarJuego();
        ViewBag.dificultades = Juego.ObtenerDificultades();
        ViewBag.categorias = Juego.ObtenerCategorias();
        return View("ConfiguracionJuego");
    }

    public IActionResult Comenzar(string username, int dificultad, int categoria)
    {
        Juego.CargarPartida(username, dificultad, categoria);
        if(Juego._preguntas.Count == 0){
            return RedirectToAction("ConfigurarJuego");
        }
        else{
            return RedirectToAction("Jugar");
        }
    }

    public IActionResult Jugar(List<Pregunta> _preguntas, int idPregunta)
    {
        ViewBag.pregunta = Juego.ObtenerProximaPregunta(_preguntas);
        ViewBag.respuestas = Juego.ObtenerProximasRespuestas(idPregunta);
        if(ViewBag.pregunta == null)
        {
            return View("Fin");
        }
        else{
            return View("Juego");
        }
    }

    [HttpPost] public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        Juego.VerificarRespuesta(idPregunta, idRespuesta);
        ViewBag.correctaOno = Juego.VerificarRespuesta(idPregunta, idRespuesta);
        if(ViewBag.correctaOno == false)
        {
            return View("incorrecta");
        }
        else{
            return View("correcta");
        }
        
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
