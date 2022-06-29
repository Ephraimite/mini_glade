import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mini_glade/components/general_widget/general_widget.dart';

class BaseApiService {
  final client = http.Client();
  BuildContext? context;

  final Map<String, String> _headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'mid': 'GP_9695a6071e26433f929b490d7128ecbb',
    'key': 'b0e25a0647ed4276a42fcab6e1897103'
  };

  Future<dynamic> putRequest({
    var url,
    dynamic payload,
  }) async {
    var _result;
    log("url: $url");
    log("payload: $payload");

    try {
      final _response = await http
          .put(Uri.parse(url), headers: _headers, body: jsonEncode(payload))
          .timeout(Duration(seconds: 20));
      _result = jsonDecode(_response.body);
      print(_response.statusCode);

    } on SocketException {
      return null;
    } catch (e) {
      return null;
    }

    return _result;
  }

}
