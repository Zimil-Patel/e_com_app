import 'package:e_com_app/model/product_model.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {

  late ProductModel productModel;
  List<Products> offerProducts = [];
  List<Products> newArrivalList = [];
  List<Products> categoryList = [];
  List<Products> cartList = [];

  // Get offer product list
  getOfferProductList(){
    for (var product in productModel.productList){
      if (product.discountPercentage > 15){
        offerProducts.add(product);
      }
    }
  }

  // get New Arrival list
  getNewArrivalList(){
    List<Products> list = productModel.productList;
    list.shuffle();
    for (int i = 0; i < 6; i++){
      newArrivalList.add(list[i]);
    }
  }

  // getCategoryList
  getCategoryList(String value){
    value = value.toLowerCase();
    categoryList.clear();
    if (value == 'all'){
      categoryList.addAll(productModel.productList);
    } else {
      for (var product in productModel.productList){
        if (product.category == value){
          categoryList.add(product);
        }
      }
    }
  }

}
