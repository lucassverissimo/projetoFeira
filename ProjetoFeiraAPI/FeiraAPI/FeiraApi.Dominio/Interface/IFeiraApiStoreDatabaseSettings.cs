using System;
using System.Collections.Generic;
using System.Text;

namespace FeiraApi.Dominio
{
    public interface IFeiraApiStoreDatabaseSettings
    {
        public string FeiraApiCollectionName { get; set; }
        public string ConnectionString { get; set; }
        public string DatabaseName { get; set; }
        public string UserDatabase { get; set; }
        public string PasswordDatabase { get; set; }
    }
}
