

using Newtonsoft.Json;

namespace FeiraApi.Dominio
{
    public class ProdutoLista
    {
        public Produto Produto { get; set; }
        public int quantidade { get; set; }
        [JsonIgnore]
        public UnidadeMedidaEnum unidadeMedida { get; set; } = UnidadeMedidaEnum.UND;
        [JsonIgnore]
        public double valor { get; set; }
    }
}
