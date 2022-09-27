namespace FinanceController.Auth.Data.Model
{
    [Serializable]
    public class JwtAuthResponse
    {
        private string Token { get; set; }
        private string User { get; set; }
        private int Expire_data { get; set; }

    }
}
