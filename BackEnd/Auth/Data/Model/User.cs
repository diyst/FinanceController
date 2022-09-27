using System.ComponentModel.DataAnnotations;

namespace FinanceController.Auth.Data.Model
{
    public class User
    {
        public long Id_usuario { get; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Nickname { get; set; }
        public string Email { get; set; }
        public bool IsValid { get; private set; }

        public User(string username, string password, string nickname, string email)
        {

        }

        private void Validate()
        {
            bool isValid = true;
            Parallel.Invoke(() => { if (!new EmailAddressAttribute().IsValid(this.Email)) isValid = false; }, () => { if (!this.PasswordIsValid()) isValid = false; });
            this.IsValid = isValid;

        }

        private bool PasswordIsValid()
        {
            return this.Password.Length > 7 && this.Password.Length < 255 && this.Password.Any(ch => !Char.IsLetterOrDigit(ch)) && this.Password.Any(ch => Char.IsDigit(ch));
        }
    }
}
