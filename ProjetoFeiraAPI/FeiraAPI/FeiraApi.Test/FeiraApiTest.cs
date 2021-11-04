using Microsoft.VisualStudio.TestTools.UnitTesting;
using FeiraApi.Util.Helpers;
namespace FeiraApi.Test
{
    [TestClass]
    public class FeiraApiTest
    {
        [TestMethod]
        public void EncryptTest()
        {
            string valor = "";

            var enc = valor.Encrypt();
        }
    }
}
