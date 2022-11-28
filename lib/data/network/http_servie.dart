import 'package:http/http.dart';

class HttpService {
  static const String _BASE_URL = "https://dog.ceo/api";

  Future<Response> fetchAllBreeds() {
    Uri uri = Uri.parse("$_BASE_URL/breeds/list/all");
    return get(uri);
  }

  Future<Response> fetchRandomDogByBreed(String breed) {
    Uri uri = Uri.parse("$_BASE_URL/breed/$breed/images/random");
    return get(uri);
  }
}
