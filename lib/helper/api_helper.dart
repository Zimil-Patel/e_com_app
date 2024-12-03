// IMPORT HTTP AND RESPONSE FILE
import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._instance();

  // SINGLETON OBJECT
  static ApiHelper apiHelper = ApiHelper._instance();

  // FINAL STRING API VARIABLE
  String api = "";

  // API CALLING METHOD
  Future<String> callApi(String api) async {
    this.api = api;

    // CONVERT API TO URI
    Uri uri = Uri.parse(this.api);

    // CALL API USING CORRESPONDING METHOD
    http.Response response = await http.get(uri);

    //CHECK STATUS AND PROCESS ACCORDINGLY
    if (response.statusCode == 200) {
      log("API CALLED SUCCESSFULLY...");
      return response.body;
    } else {
      log("API CALLING FAILED!!!");
      return "";
    }
  }
}
