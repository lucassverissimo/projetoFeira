
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using Newtonsoft.Json;

namespace FeiraApi.Dominio
{
    public class Produto
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        [JsonIgnore]
        public string Id { get; set; }
        public string Descricao { get; set; }
        [JsonIgnore]
        public string Modelo { get; set; }
        [JsonIgnore]
        public string Marca { get; set; }
    }
}
