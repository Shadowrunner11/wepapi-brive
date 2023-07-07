using Dapper;

public class UserRepository : IUserRepository
{
    private readonly DapperContext _context;
    
    public UserRepository(DapperContext context)
    {
        _context = context;
    }

  public async Task<User> GetUser(string password, string name)
  {
    var query = "SELECT * FROM [TestSchema].[User] WHERE Name=@name";

    using(var connection = _context.CreateConnection())
    { 
      User user = await connection.QuerySingleOrDefaultAsync<User>(query, new {name, password});

      Console.WriteLine(user);

      return user;
    }
  }

}
