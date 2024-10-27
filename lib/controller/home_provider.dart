import 'package:e_com_app/model/product_model.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {

  late ProductModel productModel;
  List<Products> offerProducts = [];
  List<Products> newArrivalList = [];

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
  List<Products> getCategoryList(String category){
    if (category == 'All'){
      return productModel.productList;
    } else {
      List<Products> newList = [];
      for (var product in productModel.productList){
        if (product.category == category){
          newList.add(product);
        }
      }
      return newList;
    }
  }

}
