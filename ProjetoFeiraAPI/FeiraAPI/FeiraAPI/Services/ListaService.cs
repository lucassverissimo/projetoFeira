using FeiraApi.Dominio;
using FeiraApi.Util.Connections;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FeiraAPI.Services
{
    public class ListaService
    {
        private readonly IMongoCollection<Lista> _lista;
        

        public ListaService(IFeiraApiStoreDatabaseSettings settings)
        {
            var client = new MongoClient(ConnectionDB.GetConnectionString(settings.ConnectionString, settings.UserDatabase, settings.PasswordDatabase));
            var database = client.GetDatabase(settings.DatabaseName);

            _lista = database.GetCollection<Lista>("Lista");
        }

        public List<Lista> Get() => _lista.Find(listProd => true).ToList();

        public Lista Get(string id) => _lista.Find(list => list.Id == id).FirstOrDefault();

        public Lista Insert(Lista listaProduto)
        {
            _lista.InsertOne(listaProduto);
            return listaProduto;
        }
        public void Update(string id, Lista lista) =>
            _lista.ReplaceOne(listProd => listProd.Id == id, lista);

        public void Remove(Lista listaIn) =>
            _lista.DeleteOne(listProd => listProd.Id == listaIn.Id);

        public void Remove(string id) =>
            _lista.DeleteOne(list => list.Id == id);
    }
}

