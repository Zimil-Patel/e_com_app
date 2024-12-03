import 'dart:convert';
import 'dart:developer';

import 'package:e_com_app/helper/api_helper.dart';
import 'package:e_com_app/model/product_model.dart';
import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  late ProductModel productModel;

  // CONVERT JSON TO OBJECTS
  convertJson() async {
    // final json = await rootBundle.loadString('assets/json/products.json');
    // var data = jsonDecode(json);
    // productModel = ProductModel.fromJson(data);

    // ALTERNATIVE

    const url = 'https://dummyjson.com/products';

    try {
      log("pixabay fetch called for---------------");
      String response = await ApiHelper.apiHelper.callApi(url);

      if (response.isNotEmpty) {
        final jsonData = jsonDecode(response);
        productModel = ProductModel.fromJson(jsonData);
        notifyListeners();
      }
    } catch (e) {
      log("Error fetching API records: $e...");
    }
  }
}
