
public interface IUserRepository
{
    public Task<User> GetUser(string password, string name);
}
