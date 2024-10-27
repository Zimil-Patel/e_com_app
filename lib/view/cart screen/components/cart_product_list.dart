import 'package:e_com_app/view/cart%20screen/components/remove_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/home_provider.dart';
import '../../../model/product_model.dart';
import '../../../utils/constants.dart';
import 'add_button.dart';
import 'image_box.dart';
import 'minus_button.dart';

class CartProductList extends StatelessWidget {
  const CartProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    var homeProviderT = Provider.of<HomeProvider>(context);


    return Column(
      children: [
        ...List.generate(
          homeProviderT.cartList.length,
          (index) => CartProductBox(index: index,),
        ),
      ],
    );
  }
}

class CartProductBox extends StatelessWidget {
  const CartProductBox({
    super.key, required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {

    var homeProviderT = Provider.of<HomeProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: defaultPadding,
        horizontal: defaultPadding,
      ),
      child: SizedBox(
        width: width,
        child: Row(
          children: [

            // IMAGE
            ImageBox(product: homeProviderT.cartList[index],),

            const SizedBox(
              width: defaultPadding,
            ),


            // PRODUCT DETAILS
            Expanded(child: ProductDetails(product: homeProviderT.cartList[index],)),


            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // REMOVE ITEM BUTTON
                RemoveItemButton(product: homeProviderT.cartList[index], index: index),

                const SizedBox(
                  height: defaultPadding * 2,
                ),

                // QUANTITY BUTTON
                Row(
                  children: [
                    // MINUS QUANTITY BUTTON
                    MinusButton(product: homeProviderT.cartList[index], index: index,),

                    const SizedBox(
                      width: defaultPadding,
                    ),

                    // QUANTITY COUNT
                    Text('${homeProviderT.cartList[index].quantity}'),

                    const SizedBox(
                      width: defaultPadding,
                    ),

                    // ADD QUANTITY BUTTON
                    AddButton(product: homeProviderT.cartList[index], index: index,),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key, required this.product,
  });

  final Products product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TITLE
        Text(
          product.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),

        // DESCRIPTION
        Text(
          product.description,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: Theme.of(context).textTheme.bodySmall,
        ),

        const SizedBox(
          height: defaultPadding / 2,
        ),

        // PRICE
        Text(
          '\$ ${product.price}',
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyMedium!,
        ),
      ],
    );
  }
}


