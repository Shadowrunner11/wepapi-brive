public class Session
{ 
  // TODO: is it necessary to have a non natural primary key?
  public int Id { get; set;}
  public required string Token { get; set;}
  public required int ExpiresIn { get; set;}
}
