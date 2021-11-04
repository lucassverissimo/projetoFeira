using System;

namespace FeiraApi.Dominio.Exception
{
    public class ProdutoNotFoundException : SystemException
    {
        public ProdutoNotFoundException()
        {
        }

        public ProdutoNotFoundException(string message)
            : base(message)
        {
        }

        public ProdutoNotFoundException(string message, SystemException inner)
            : base(message, inner)
        {
        }
    }
}
