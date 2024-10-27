
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
  double subTotal = 0, bagTotal = 0, shipping = 0;

  // Get offer product list
  getOfferProductList() {
    for (var product in productList) {
      if (product.discountPercentage > 15) {
        offerProducts.add(product);
      }
    }
  }

  // get New Arrival list
  getNewArrivalList() {
    List<Products> list = [];
    list.addAll(productList);
    list.shuffle();
    for (int i = 0; i < 6; i++) {
      newArrivalList.add(list[i]);
    }
  }

  // getCategoryList
  getCategoryList(String value) {
    value = value.toLowerCase();
    categoryList.clear();
    if (value == 'all') {
      categoryList.addAll(productList);
    } else {
      for (var product in productList) {
        if (product.category == value) {
          categoryList.add(product);
        }
      }
    }
  }

  // set index for detail page product
  setProductId(int value) {
    productId = value;
    imageListLength = productList[value].images.length;
    currentImage = 0;
    notifyListeners();
  }

  // change image according product image list
  nextImage() {
    if (currentImage < (imageListLength - 1)) {
      currentImage++;
    }
    notifyListeners();
  }

  previousImage() {
    if (currentImage > 0) {
      currentImage--;
    }
    notifyListeners();
  }

  // make product favorite
  toggleFavorite(int value) {
    productList[value - 1].isFavourite = !productList[value - 1].isFavourite;

    // Update categoryList
    for (int i = 0; i < categoryList.length; i++) {
      if (categoryList[i].id == value) {
        categoryList[i].isFavourite = productList[value - 1].isFavourite;
      }
    }

    notifyListeners();
  }

  // add to cart list
  addToCart(int value) {
    value--;
    // Update in productList
    productList[value].isInCart = true;
    productList[value].quantity = 1;
    cartList.add(productList[value]);
    notifyListeners();
  }

  // increase quantity
  increaseQuantity(int index) {

    cartList[index].quantity++;

    notifyListeners();
  }

  // decrease quantity
  decreaseQuantity(int index) {
    if (cartList[index].quantity > 1){
      cartList[index].quantity--;
    }

    notifyListeners();
  }


  // remove from cart list
  removeFromCart(int index){
    int productIndex = cartList[index].id - 1;
    cartList.removeAt(index);
    productList[productIndex].isInCart = false;
    productList[productIndex].quantity = 0;

    notifyListeners();
  }


  // method to calculate total
  void calculateBagTotal() {
    if (cartList.isNotEmpty){
      shipping = 4.99;
    } else {
      shipping = 0;
    }
    double result = 0;
    for (var i in cartList){
      result += (i.price * i.quantity);
    }
    subTotal = result;
    bagTotal = subTotal + shipping;
  }
}
