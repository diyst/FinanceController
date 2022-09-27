using Oracle.ManagedDataAccess.Client;

namespace FinanceController.Config
{
    public class Connection
    {
        public OracleConnection Connect()
        {
            var StringConnection = "DATA SOURCE = (DESCRIPTION ="
                              + "(ADDRESS = (PROTOCOL = TCP)(HOST=192.168.100.1)(PORT=1521))"
                              + "(CONNECT_DATA =(SERVER = DEDICATED)"
                              + "(SERVICE_NAME = XE))));"
                              + "User Id=SYSTEM;Password=123;";

            return new OracleConnection(StringConnection);
        }
    }
}
