import 'package:e_com_app/controller/home_provider.dart';
import 'package:e_com_app/view/detail%20screen/components/ProductImageBox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/product_model.dart';
import 'components/add_to_cart_button.dart';
import 'components/detail_screen_top_bar.dart';
import 'components/product_detail_box.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeProviderT = Provider.of<HomeProvider>(context);
    int productId = homeProviderT.productId;
    Products product = homeProviderT.productList[productId];
    return Scaffold(
      backgroundColor: homeProviderT.productList[productId].bgColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                DetailScreenTopBar(
                  products: product,
                ),

                // PRODUCT IMAGE
                ProductImageBox(product: product,),

                // PRODUCT DETAIL BOX
                ProductDetailBox(product: product,),
              ],
            ),
          ),

          // OVER LAY ADD TO CART BUTTON
          AddToCartButton(product: product,),
        ],
      ),
    );
  }
}
