// ignore_for_file: body_might_complete_normally_nullable

import 'package:http/http.dart' as http;

class BaseService {
  static const baseUri = 'http://api.weatherstack.com/';
  static const apiKey = "3c4cfe1cd41cf761c64fb822040f1918";

  static final Map<String, String> headers = {
    'Content-type': 'application/json',
  };

  static Future<http.Response?> makeRequest(String url,
      {String method = "POST",
      body,
      mergeDefaultHeader = true,
      Map<String, String>? extraHeaders}) async {
    try {
      extraHeaders ??= {};
      var sentHeaders =
          mergeDefaultHeader ? {...headers, ...extraHeaders} : extraHeaders;

      switch (method) {
        case 'POST':
          body ??= {};
          return http.post(Uri.parse(url), headers: sentHeaders, body: body);

        case 'GET':
          body ??= {};
          return http.get(Uri.parse(url), headers: sentHeaders);

        case 'PUT':
          body ??= {};
          return http.put(Uri.parse(url), headers: sentHeaders, body: body);

        case 'PATCH':
          body ??= {};
          return http.patch(Uri.parse(url), headers: sentHeaders, body: body);

        case 'DELETE':
          body ??= {};
          return http.delete(Uri.parse(url), headers: sentHeaders, body: body);

        default:
          return http.post(Uri.parse(url), headers: sentHeaders, body: body);
      }
      // ignore: empty_catches
    } catch (err) {}
  }
}
