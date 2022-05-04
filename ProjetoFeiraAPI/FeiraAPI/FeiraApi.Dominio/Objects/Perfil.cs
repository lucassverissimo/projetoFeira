using System;
using System.Collections.Generic;
using System.Text;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Bson.Serialization.Conventions;
using Newtonsoft.Json;

namespace FeiraApi.Dominio
{
    public class Perfil
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        [JsonIgnore]
        public string Id { get; set; }
        [JsonIgnore]
        public string Nome { get; set; }
        [JsonIgnore]
        public string Sobrenome { get; set; }
        [JsonIgnore]
        public string Avatar { get; set; }
        [JsonIgnore]
        public List<Perfil> Amigos { get; set; }

        public string NomeCompleto()
        {
            return this.Nome + " " + this.Sobrenome;
        }
    }
}
