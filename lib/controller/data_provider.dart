import 'dart:convert';
import 'dart:developer';

import 'package:e_com_app/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DataProvider extends ChangeNotifier {
  late ProductModel productModel;

  // CONVERT JSON TO OBJECTS
  convertJson() async {
    final json = await rootBundle.loadString('assets/json/products.json');
    var data = jsonDecode(json);
    productModel = ProductModel.fromJson(data);
  }
}
