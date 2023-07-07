public class User
{
  public int Id { get; set;}
  public required string Name { get; set;}
  public required byte[] Password { get; set;}
  public required int RolId { get; set; }
  public required bool IsActive { get; set; }

}
