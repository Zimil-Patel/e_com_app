import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'components/bottom_procced_button.dart';
import 'components/pricing_details.dart';
import 'components/promo_code_box.dart';
import 'components/cart_product_list.dart';
import 'components/cart_top_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // TOP TITLE BAR
                CartTopBar(),

                // PROMO CODE BOX
                PromoCodeBox(),

                // PRODUCT LIST
                CartProductList(),

                PricingDetails(),
              ],
            ),
          ),

          // BOTTOM OVERLAY BUTTON
          BottomProceedButton(),
        ],
      ),
    );
  }
}


