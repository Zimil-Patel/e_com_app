import 'package:e_com_app/model/product_model.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {

  List<Products> productList = [];
  List<Products> offerProducts = [];
  List<Products> newArrivalList = [];
  List<Products> categoryList = [];
  List<Products> cartList = [];
  int productId = 0;
  int imageListLength = 0;
  int currentImage = 0;

  // Get offer product list
  getOfferProductList(){
    for (var product in productList){
      if (product.discountPercentage > 15){
        offerProducts.add(product);
      }
    }
  }

  // get New Arrival list
  getNewArrivalList(){
    List<Products> list = [];
    list.addAll(productList);
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
      categoryList.addAll(productList);
    } else {
      for (var product in productList){
        if (product.category == value){
          categoryList.add(product);
        }
      }
    }
  }

  // set index for detail page product
  setProductId(int value){
    productId = value;
    imageListLength = productList[value].images.length;
    currentImage = 0;
    notifyListeners();
  }

  // change image according product image list
  nextImage(){
    if (currentImage < (imageListLength - 1))
      {
        currentImage++;
      }
    notifyListeners();
  }

  previousImage(){
    if (currentImage > 0)
    {
      currentImage--;
    }
    notifyListeners();
  }


  // make product favorite
  toggleFavorite(int value){
    productList[value - 1].isFavourite = !productList[value - 1].isFavourite;

    // Update categoryList
    for (int i = 0; i < categoryList.length; i++){
      if (categoryList[i].id == value){
        categoryList[i].isFavourite = productList[value - 1].isFavourite;
      }
    }

    notifyListeners();
  }

}
