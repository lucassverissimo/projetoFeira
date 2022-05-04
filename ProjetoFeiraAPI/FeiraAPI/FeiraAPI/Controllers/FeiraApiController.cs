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
    public class FeiraApiController : ControllerBase
    {
        private readonly FeiraService _feiraService;

        public FeiraApiController(FeiraService feiraService)
        {
            _feiraService = feiraService;
        }

        [HttpPut("AdicionarProduto/{idLista}")]
        public async Task<IActionResult> AdicionarProduto(string idLista, [FromBody] ProdutoFeira produtoLista)
        {
            Feira lista = await Task.Run(() => _feiraService.Get(idLista));
            if (lista != null)
            {
                lista.Itens.Add(produtoLista);
                _feiraService.Update(lista.Id, lista);
            }
            else
            {
                return StatusCode(StatusCodes.Status400BadRequest);
            }

            return StatusCode(StatusCodes.Status200OK);
        }
    }
}
