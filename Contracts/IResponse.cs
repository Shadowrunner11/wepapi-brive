public interface IDataResponse {
  public string token {get; set;}
}

public interface IResponse {
  public IDataResponse? data {get; set;}

  public string? error {get; set;}
}
