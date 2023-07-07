using Microsoft.AspNetCore.Mvc;

namespace webapi.Controllers;

[ApiController]
[Route("[controller]")]
public class UserController : ControllerBase
{
  private readonly ILogger<UserController> _logger;
  private readonly IUserRepository _userRepository;

  public UserController(ILogger<UserController> logger, IUserRepository userRepository)
  {
      this._logger = logger;
      this._userRepository = userRepository;
  }

  [HttpPost(Name = "PostSession")]
  public async Task<IActionResult> postSession([FromBody] LoginDTO loginDTO){
    try
    {
      var user = await this._userRepository.GetUser(loginDTO.password, loginDTO.name);

      if(user == null)
        return Unauthorized("incorrect credentials");

      this._logger.LogInformation(user?.Name);

      var data = new{token = "asdasdsada"};

      return Ok(new {data});
    }
    catch (System.Exception ex)
    {
      this._logger.LogError(ex.Message);

      return StatusCode(500, ex.Message);
    }
  }
}
