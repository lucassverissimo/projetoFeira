using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FeiraApi.Dominio;
using FeiraApi.Util.Connections;
using MongoDB.Driver;

namespace FeiraAPI.Services
{
    public class PerfilService
    {
        private readonly IMongoCollection<Perfil> _lista;


        public PerfilService(IFeiraApiStoreDatabaseSettings settings)
        {
            var client = new MongoClient(ConnectionDB.GetConnectionString(settings.ConnectionString, settings.UserDatabase, settings.PasswordDatabase));
            var database = client.GetDatabase(settings.DatabaseName);

            _lista = database.GetCollection<Perfil>("Perfil");
        }
        public List<Perfil> Get() => _lista.Find(listProd => true).ToList();

        public Perfil Get(string id) => _lista.Find(list => list.Id == id).FirstOrDefault();

        public Perfil Insert(Perfil perfil)
        {
            _lista.InsertOne(perfil);
            return perfil;
        }
        public void Update(string id, Perfil lista) =>
            _lista.ReplaceOne(listProd => listProd.Id == id, lista);

        public void Remove(Perfil listaIn) =>
            _lista.DeleteOne(listProd => listProd.Id == listaIn.Id);

        public void Remove(string id) =>
            _lista.DeleteOne(list => list.Id == id);
    }
}
