import 'dart:convert';
import 'package:antio_books/infraestructure/models/server_response.dart';
import 'package:http/http.dart' as http;

class CenterApi {
  static const String connectionError = "Error en la conexión";

  static Map<String, String> get _headers {
    return {
      "Content-Type": "application/json",
    };
  }

  static Future<ServerResponse> get({required String urlSpecific}) async {
    try {
      final response =
          await http.get(Uri.parse(urlSpecific), headers: _headers);
      final dataDecode = response.body != ""
          ? json.decode(utf8.decode(response.bodyBytes))
          : [];
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
          message: "Error",
          result: [],
          statusCode: response.statusCode,
        );
      }
    } catch (error) {
      return ServerResponse(
        isSuccess: false,
        message: connectionError,
        result: [],
        statusCode: 500,
      );
    }
  }

  static Future<ServerResponse> put({required String urlSpecific, dynamic data,}) async {
    try {
      String dataParse = data.isNotEmpty ? json.encode(data) : "";
      final response = await http.put(Uri.parse(urlSpecific), headers: _headers, body: dataParse);
      final dataDecode = response.body != ""
          ? json.decode(utf8.decode(response.bodyBytes))
          : [];
      if (response.statusCode >= 200 && response.statusCode <= 204) {
        return ServerResponse(
          isSuccess: true,
          message: 'PUT realizada con exito',
          result: dataDecode,
          statusCode: response.statusCode,
        );
      } else {
        return ServerResponse(
          isSuccess: false,
          message: "Error",
          result: dataDecode,
          statusCode: response.statusCode,
        );
      }
    } catch (error) {
      return ServerResponse(
        isSuccess: false,
        message: connectionError,
        result: [],
        statusCode: 500,
      );
    }
  }
}
