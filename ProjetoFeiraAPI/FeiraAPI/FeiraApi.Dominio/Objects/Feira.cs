using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace FeiraApi.Dominio
{
    public class Feira
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        [JsonIgnore]
        public string Id { get; set; }
        public string Titulo { get; set; }
        public Perfil Autor { get; set; }
        [JsonIgnore]
        public List<ProdutoFeira> Itens { get; set; }
        public DateTime Data { get; set; }
        [JsonIgnore]
        public string Local { get; set; }
        [JsonIgnore]
        public List<Perfil> participantes { get; set; }
    }
}
