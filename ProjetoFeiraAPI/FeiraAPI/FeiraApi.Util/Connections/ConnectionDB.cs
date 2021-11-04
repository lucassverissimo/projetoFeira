using FeiraApi.Util.Helpers;

namespace FeiraApi.Util.Connections
{
    public class ConnectionDB
    {
        public static string GetConnectionString(string connectionString, string user, string password)
        {
            return string.Format(connectionString, user.Decrypt(), password.Decrypt());
        }
    }
}
