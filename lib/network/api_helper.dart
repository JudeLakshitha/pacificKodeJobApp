import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:job_app/network/urls.dart';

class ApiHelper {
  ApiHelper();

  Future<dynamic> apiGet(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  }) async {
    Map<String, String>? headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/$endpoint'),
        headers: headers,
      );
      return handleSuccessResponse(response);
    } on SocketException {
      return handleErrorResponse();
    }
  }

  dynamic handleSuccessResponse(http.Response response) {
    final jsonResponse = jsonDecode(response.body);
    final jResponse = jsonResponse["record"];
    if (jResponse['data'] is List) {
      jResponse['data'] = List<Map<String, dynamic>>.from(jResponse['data']);
    }
    jResponse['status'] = response.statusCode.toString();
    return jResponse;
  }

  dynamic handleErrorResponse() {
    Map<String, dynamic> jsonResponse = {};
    jsonResponse['status'] = '500';
    jsonResponse['message'] = "Network Error";
    return jsonResponse;
  }
}
