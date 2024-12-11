import 'dart:convert' as convert;

import 'package:testflutter/app/configs/app_configs.dart';
import 'package:http/http.dart' as http;

class RequestHttp {
  static get(String path, {Map<String, String>? queryParameters}) async {
    final uri = Uri.https(AppConfigs.authority, path, queryParameters);
    //final header = await getHeader();

    http.Response response = await http.get(uri);

    return progressResponse(response);
  }

  static progressResponse(http.Response response) {
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      return jsonResponse;
    }
    throw Exception("Error Code: ${response.statusCode}");
  }
}
