import 'dart:convert';

import 'package:book_stack/infraestructure/models/server_response.dart';
import 'package:http/http.dart' as http;

class CenterApi {
  static const String connectionError = 'Error en la conexión';

  static Map<String, String> get _headers {
    return <String, String>{
      'Content-Type': 'application/json',
    };
  }

  static Future<ServerResponse> get({required String urlSpecific}) async {
    try {
      final http.Response response = await http.get(Uri.parse(urlSpecific), headers: _headers);
      final dynamic dataDecode = response.body != '' ? json.decode(utf8.decode(response.bodyBytes)) : <dynamic>[];
      if (response.statusCode >= 200 && response.statusCode <= 204) {
        return ServerResponse(
          isSuccess: true,
          message: 'GET realizada con exito',
          result: dataDecode, 
          statusCode: response.statusCode,
        );
      } else {
        return ServerResponse(
          isSuccess: false,
          message: 'Error',
          result: const <dynamic>[],
          statusCode: response.statusCode,
        );
      }
    } catch (error) {
      return const ServerResponse(
        isSuccess: false,
        message: connectionError,
        result: <dynamic>[],
        statusCode: 500,
      );
    }
  }
}
