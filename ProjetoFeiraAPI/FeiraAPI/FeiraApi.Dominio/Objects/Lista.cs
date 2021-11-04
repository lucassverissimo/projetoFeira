using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace FeiraApi.Dominio
{
    public class Lista
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        [JsonIgnore]
        public string Id { get; set; }
        public string Descricao { get; set; }
        [JsonIgnore]
        public List<ProdutoLista> Produtos { get; set; }
        public DateTime Data { get; set; }
        [JsonIgnore]
        public string Local { get; set; }
    }
}
