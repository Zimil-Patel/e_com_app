import 'package:e_com_app/utils/color_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class CartProductList extends StatelessWidget {
  const CartProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          10,
          (index) => const CartProductBox(),
        ),
      ],
    );
  }
}

class CartProductBox extends StatelessWidget {
  const CartProductBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: defaultPadding,
        horizontal: defaultPadding,
      ),
      child: SizedBox(
        width: width,
        child: const Row(
          children: [

            // IMAGE
            Row(
              children: [
                ImageBox(),

                SizedBox(
                  width: defaultPadding,
                ),


                // PRODUCT DETAILS
                ProductDetails(),
              ],
            ),

            Spacer(),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // REMOVE ITEM BUTTON
                RemoveItemButton(),

                SizedBox(
                  height: defaultPadding * 2,
                ),

                // QUANTITY BUTTON
                Row(
                  children: [
                    // MINUS QUANTITY BUTTON
                    MinusButton(),

                    SizedBox(
                      width: defaultPadding,
                    ),

                    // QUANTITY COUNT
                    Text('5'),

                    SizedBox(
                      width: defaultPadding,
                    ),

                    // ADD QUANTITY BUTTON
                    AddButton(),
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
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TITLE
        const Text(
          'product.title',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),

        // DESCRIPTION
        Text(
          'product.description',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: Theme.of(context).textTheme.bodySmall,
        ),

        const SizedBox(
          height: defaultPadding / 2,
        ),

        // PRICE
        Text(
          '\$ 9.99',
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyMedium!,
        ),
      ],
    );
  }
}

class ImageBox extends StatelessWidget {
  const ImageBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.08,
      width: height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: bgColorList[0],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            offset: const Offset(6, 6),
            blurRadius: 20,
          ),
        ],
        image: const DecorationImage(
          image: NetworkImage(
              'https://cdn.dummyjson.com/products/images/groceries/Fish%20Steak/1.png'),
        ),
      ),
    );
  }
}

class RemoveItemButton extends StatelessWidget {
  const RemoveItemButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.all(defaultPadding / 2),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.close,
          color: Colors.grey,
          size: height * 0.016,
        ),
      ),
      onPressed: () {},
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.all(defaultPadding / 2),
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              offset: const Offset(2, 2),
              blurRadius: 10,
            ),
          ],
        ),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: height * 0.014,
        ),
      ),
      onPressed: () {},
    );
  }
}

class MinusButton extends StatelessWidget {
  const MinusButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.all(defaultPadding / 2),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
        child: Icon(
          Icons.remove,
          color: Colors.black,
          size: height * 0.014,
        ),
      ),
      onPressed: () {},
    );
  }
}
