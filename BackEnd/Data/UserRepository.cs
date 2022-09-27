using Dapper;
using FinanceController.Config;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Linq;
using FinanceController.Auth.Data.Model;
using Microsoft.AspNetCore.Identity;

namespace FinanceController.Data
{
    public class UserRepository
    {
        public JwtAuthResponse Authenticate(LoginForm inputs)
        {
            Connection c = new Connection();
            using var DBConnection = c.Connect();
            string method = "";
            switch (inputs.Method)
            {
                case LoginForm.LoginMethod.Email:
                    method = "email";
                    break;
                case LoginForm.LoginMethod.Username:
                    method = "username";
                    break;
                default:
                    break;
            }
        }

    }
}
