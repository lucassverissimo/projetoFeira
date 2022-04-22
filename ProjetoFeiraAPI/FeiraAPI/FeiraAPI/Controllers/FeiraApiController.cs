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
        private readonly ListaService _listaService;

        public FeiraApiController(ListaService listaService)
        {
            _listaService = listaService;
        }

        [HttpPut("AdicionarProduto/{idLista}")]
        public async Task<IActionResult> AdicionarProduto(string idLista, [FromBody] ProdutoLista produtoLista)
        {
            Lista lista = await Task.Run(() => _listaService.Get(idLista));
            if (lista != null)
            {
                lista.Produtos.Add(produtoLista);
                _listaService.Update(lista.Id, lista);
            }
            else
            {
                return StatusCode(StatusCodes.Status400BadRequest);
            }

            return StatusCode(StatusCodes.Status200OK);
        }
    }
}
