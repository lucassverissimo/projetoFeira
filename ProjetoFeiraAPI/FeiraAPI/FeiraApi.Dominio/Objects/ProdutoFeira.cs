

using Newtonsoft.Json;

namespace FeiraApi.Dominio
{
    public class ProdutoFeira
    {
        public Produto Produto { get; set; }
        public int quantidade { get; set; }
        [JsonIgnore]
        public string unidadeMedida { get; set; }
        [JsonIgnore]
        public double valor { get; set; }
        [JsonIgnore]
        public string Imagem { get; set; }
    }
}
