using System.Text;

namespace FinanceController.Auth.Data.Model
{
    public class LoginForm
    {
        public enum LoginMethod
        {
            Username,
            Email
        }

        public string LoginCredential { get; private set; }
        public string LoginPassword { get; private set; }
        public LoginMethod Method { get; private set; }

        public LoginForm(string loginCredential, string loginPassword)
        {
            LoginCredential = loginCredential;
            LoginPassword = loginPassword;
            Method = GetLoginMethod();
        }

        private LoginMethod GetLoginMethod()
        {
            if (LoginCredential.Contains("@") && LoginCredential.EndsWith(".com"))
            {
                return LoginMethod.Email;
            }
            else
            {
                return LoginMethod.Username;
            }
        }
    }
}
