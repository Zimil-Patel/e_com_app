import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:e_com_app/controller/home_provider.dart';
import 'package:e_com_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/product_model.dart';
import '../../../utils/color_list.dart';

class ProductGridViewList extends StatelessWidget {
  const ProductGridViewList({
    super.key,
  });


  @override
  Widget build(BuildContext context) {

    var homeProviderT = Provider.of<HomeProvider>(context);
    var homeProviderF = Provider.of<HomeProvider>(context, listen: false);


    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      shrinkWrap: true,
      itemCount: homeProviderT.categoryList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: defaultPadding,
        crossAxisSpacing: defaultPadding,
      ),
      itemBuilder: (context, index) {
        return GridProductBox(
          product: homeProviderT.categoryList[index],
        );
      },
    );
  }
}

class GridProductBox extends StatelessWidget {
  const GridProductBox({
    super.key,
    required this.product,
  });

  final Products product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: defaultPadding / 2,
      ),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: product.bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // IMAGE
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: height * 0.1,
              width: width * 0.5,
              child: Image.network(
                product.images[0],
                fit: BoxFit.contain,
              ),
            ),
          ),

          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoButton(
                onPressed: (){},
                padding: EdgeInsets.zero,
                child: BlurryContainer(
                    blur: 5,
                    elevation: 0,
                    color: Colors.white.withOpacity(0.4),
                    padding: const EdgeInsets.all(0),
                    borderRadius: BorderRadius.circular(100),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding / 2, vertical: defaultPadding / 2),
                      child: Icon(
                        Icons.favorite_border_rounded,
                      ),
                    )),
              ),
            ),
          ),

          BlurryContainer(
              blur: 5,
              elevation: 0,
              color: Colors.white.withOpacity(0.4),
              padding: const EdgeInsets.all(0),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding / 2),
                child: BottomDetails(product: product),
              )),
        ],
      ),
    );
  }
}

class BottomDetails extends StatelessWidget {
  const BottomDetails({
    super.key,
    required this.product,
  });

  final Products product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // PRODUCT NAME
        Text(
          product.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontSize: height * 0.018),
        ),

        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // PRICE
                Text(
                  '\$ ${product.price}',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: height * 0.014),
                ),
              ],
            ),

            const Spacer(),

            // CART
            CircleAvatar(
              radius: height * 0.018,
              backgroundColor: Colors.black,
              child: Icon(
                Icons.card_travel_rounded,
                size: height * 0.02,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
