using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using FeiraApi.Dominio;
using FeiraAPI.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace FeiraAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PerfilController : ControllerBase
    {
        private readonly PerfilService _perfilService;

        public PerfilController(PerfilService perfilService)
        {
            _perfilService = perfilService;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Perfil>>> GetPerfis()
        {
            try
            {
                List<Perfil> listaPerfis = new List<Perfil>();

                await Task.Run(() => listaPerfis = _perfilService.Get());

                return Ok(listaPerfis);
            }
            catch
            {
                //_logErroService.Insert(new LogFile { Mensagem = ex.Message, DataHora = DateTime.Now, Classe = ExtensionHelper.GetCurrentClass(), Projeto = ExtensionHelper.GetProjectName() });
                return NotFound();
            }
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Perfil perfil)
        {
            try
            {
                await Task.Run(() => _perfilService.Insert(perfil));

                return Ok();
            }
            catch (Exception ex)
            {
                //_logErroService.Insert(new LogFile { Mensagem = ex.Message, DataHora = DateTime.Now, Classe = ExtensionHelper.GetCurrentClass(), Projeto = ExtensionHelper.GetProjectName() });
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

    }
}
