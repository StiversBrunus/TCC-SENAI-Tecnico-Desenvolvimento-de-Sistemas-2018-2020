class Api {

  static const String BASE_URL = 'http://192.168.0.100:8080/photo/';
  static const Map<String, String> BASE_HEADER = {'Content-type': 'application/json'};
  static const Map<String, String> IMAGE_BASE_HEADER = {
      'Accept': 'application/json',
      'content-type': 'application/json'
    };
}