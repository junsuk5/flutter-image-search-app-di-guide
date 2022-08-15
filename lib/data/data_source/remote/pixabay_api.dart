import 'dart:async';

import 'package:http/http.dart' as http;

class PixabayApi {
  final http.Client _client;

  PixabayApi({http.Client? client}) : _client = client ?? http.Client();

  Future<http.Response> getImages(String query) async {
    Uri url = Uri.parse(
        'https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=$query&image_type=photo');

    return await _client.get(url);
  }
}
