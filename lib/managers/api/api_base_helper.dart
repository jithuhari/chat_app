import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../config/app/app_config.dart';
import 'api.dart';

class ApiBaseHelper {
  final String _baseUrl =
      "${NMSAppConfigManager.config.httpScheme}://${NMSAppConfigManager.config.backendBaseURL}/${NMSAppConfigManager.config.serviceUrl}/";

  // final Map<String, String> _headers = {
  //   'Content-Type': 'application/json',
  // };

  Future<dynamic> postWithBody(
      {required String endpoint,
      required Map<String, String> params,
      required dynamic body,
      Map<String, String>? headers}) async {
    dynamic responseJson;
    try {
      debugPrint(jsonEncode(body));
      debugPrint(jsonEncode(params));

      var url = Uri.parse('$_baseUrl$endpoint?$params');

      var response = await http.post(url,
          headers: headers,

          // ?? await JBAuthTokenHeader.to.getAuthTokenHeader(),
          body: jsonEncode(body));

      responseJson = _returnResponse(response);
    } on SocketException {
      throw NoNetworkException();
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        debugPrint(responseJson.toString());
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body.toString());
        debugPrint(responseJson.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw BadRequestException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
