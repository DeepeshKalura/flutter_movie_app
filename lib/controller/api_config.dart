class ApiConfing {
  static const _baseUrl = 'https://api.themoviedb.org/3/';
  static const _apiKey = '1ebbfcca4eb85cfdc5f50e9d9ac00dd0';

  static Uri gerateUrl({required String path, String query = ''}) {
    if (query == '') {
      final url = '$_baseUrl$path?api_key=$_apiKey';
      final uri = Uri.parse(url);
      return uri;
    } else {
      final url = '$_baseUrl$path?api_key=$_apiKey?query=$query';
      final uri = Uri.parse(url);
      return uri;
    }
  }
}
