abstract class BaseService {
  final String albumBaseUrl = "http://itunes.apple.com/search?term=";

  Future<dynamic> getResponse(String url);

}