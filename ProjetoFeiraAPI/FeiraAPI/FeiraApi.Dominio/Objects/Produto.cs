
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using Newtonsoft.Json;

namespace FeiraApi.Dominio
{
    public class Produto
    {
        public string Descricao { get; set; }
        [JsonIgnore]
        public string Modelo { get; set; }
        [JsonIgnore]
        public string Marca { get; set; }
    }
}
