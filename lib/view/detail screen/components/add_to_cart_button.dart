import 'package:e_com_app/controller/home_provider.dart';
import 'package:e_com_app/view/cart%20screen/cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/product_model.dart';
import '../../../utils/constants.dart';


class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key, required this.product,
  });

  final Products product;

  @override
  Widget build(BuildContext context) {

    var homeProviderF = Provider.of<HomeProvider>(context, listen: false);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.060, horizontal: width * 0.12),
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: (){
            if (product.isInCart){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen(),),);
            } else {
              homeProviderF.addToCart(product.id);
            }
          },
          child: SizedBox(
            height: 60,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(6, 6),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Text(
                !product.isInCart ?'Add to cart' : 'Go to cart',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
