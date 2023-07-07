using Microsoft.Data.SqlClient;
using System.Data;

public class DapperContext
{
    private readonly IConfiguration _configuration;
    private readonly string _connectionString;

    private ILogger<DapperContext> _logger;

    public DapperContext(IConfiguration configuration, ILogger<DapperContext> logger)
    {
        _logger = logger;

        _configuration = configuration;

        var connectionURI =_configuration.GetConnectionString("SqlConnection");
        
        ArgumentNullException.ThrowIfNull(connectionURI);

        _connectionString = connectionURI;
    }

    public IDbConnection CreateConnection()
        => new SqlConnection(_connectionString);
}
