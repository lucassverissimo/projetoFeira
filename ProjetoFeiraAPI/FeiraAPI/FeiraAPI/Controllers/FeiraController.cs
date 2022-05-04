using FeiraApi.Dominio;
using FeiraAPI.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FeiraAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FeiraController : ControllerBase
    {
        private readonly FeiraService _listaProdutoService;   

        public FeiraController(FeiraService listaProdutoService)
        {
            _listaProdutoService = listaProdutoService;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Feira>>> GetListaProdutos()
        {
            try
            {
                List<Feira> listasProdutos = new List<Feira>();

                await Task.Run(() => listasProdutos = _listaProdutoService.Get());

                return Ok(listasProdutos);
            }
            catch 
            {
                //_logErroService.Insert(new LogFile { Mensagem = ex.Message, DataHora = DateTime.Now, Classe = ExtensionHelper.GetCurrentClass(), Projeto = ExtensionHelper.GetProjectName() });
                return NotFound();
            }
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Feira>> GetListaProduto(string id)
        {
            try
            {
                Feira listaProduto = null;

                await Task.Run(() => listaProduto = _listaProdutoService.Get(id));

                if (listaProduto == null)
                    return NotFound();

                return Ok(listaProduto);
            }
            catch
            {
                //_logErroService.Insert(new LogFile { Mensagem = ex.Message, DataHora = DateTime.Now, Classe = ExtensionHelper.GetCurrentClass(), Projeto = ExtensionHelper.GetProjectName() });
                return NotFound();
            }
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Feira listaProduto)
        {
            try
            {
                await Task.Run(() => _listaProdutoService.Insert(listaProduto));

                return Ok();
            }
            catch (Exception ex)
            {
                //_logErroService.Insert(new LogFile { Mensagem = ex.Message, DataHora = DateTime.Now, Classe = ExtensionHelper.GetCurrentClass(), Projeto = ExtensionHelper.GetProjectName() });
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Put(string id, [FromBody] Feira listaProdutoIn)
        {
            try
            {
                Feira listaProduto = null;

                await Task.Run(() => listaProduto = _listaProdutoService.Get(id));

                if (listaProduto == null)
                    return NotFound();

                await Task.Run(() => _listaProdutoService.Update(id, listaProdutoIn));

                return Ok();
            }
            catch
            {
                //_logErroService.Insert(new LogFile { Mensagem = ex.Message, DataHora = DateTime.Now, Classe = ExtensionHelper.GetCurrentClass(), Projeto = ExtensionHelper.GetProjectName() });
                return NotFound();
            }
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(string id)
        {
            try
            {
                Feira listaProduto = null;

                await Task.Run(() => _listaProdutoService.Get(id));

                if (listaProduto == null)
                    return NotFound();

                await Task.Run(() => _listaProdutoService.Remove(listaProduto.Id));

                return Ok();
            }
            catch
            {
                //_logErroService.Insert(new LogFile { Mensagem = ex.Message, DataHora = DateTime.Now, Classe = ExtensionHelper.GetCurrentClass(), Projeto = ExtensionHelper.GetProjectName() });
                return NotFound();
            }
        }
    }
}
