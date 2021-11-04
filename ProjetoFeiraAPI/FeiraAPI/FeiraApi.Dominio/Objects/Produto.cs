
using Newtonsoft.Json;

namespace FeiraApi.Dominio
{
    public class Produto
    {        
        public string Descricao { get; set; }
        [JsonIgnore]
        public string modelo { get; set; }
        [JsonIgnore]
        public string marca { get; set; }
    }
}
