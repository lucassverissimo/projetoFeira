using FeiraApi.Dominio;
using FeiraApi.Util.Connections;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FeiraAPI.Services
{
    public class FeiraService
    {
        private readonly IMongoCollection<Feira> _lista;
        

        public FeiraService(IFeiraApiStoreDatabaseSettings settings)
        {
            var client = new MongoClient(ConnectionDB.GetConnectionString(settings.ConnectionString, settings.UserDatabase, settings.PasswordDatabase));
            var database = client.GetDatabase(settings.DatabaseName);

            _lista = database.GetCollection<Feira>("Feira");
        }

        public List<Feira> Get() => _lista.Find(listProd => true).ToList();

        public Feira Get(string id) => _lista.Find(list => list.Id == id).FirstOrDefault();

        public Feira Insert(Feira listaProduto)
        {
            _lista.InsertOne(listaProduto);
            return listaProduto;
        }
        public void Update(string id, Feira lista) =>
            _lista.ReplaceOne(listProd => listProd.Id == id, lista);

        public void Remove(Feira listaIn) =>
            _lista.DeleteOne(listProd => listProd.Id == listaIn.Id);

        public void Remove(string id) =>
            _lista.DeleteOne(list => list.Id == id);
    }
}

