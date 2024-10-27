import 'package:e_com_app/controller/home_provider.dart';
import 'package:e_com_app/model/product_model.dart';
import 'package:e_com_app/utils/color_list.dart';
import 'package:e_com_app/utils/constants.dart';
import 'package:e_com_app/view/detail%20screen/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OfferProductRow extends StatelessWidget {
  const OfferProductRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var homeProviderT = Provider.of<HomeProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // OFFERED PRODUCT TITLE
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            'Offers',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: height * 0.024,
                ),
          ),
        ),

        // OFFER PRODUCT LIST
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                homeProviderT.offerProducts.length,
                (index) => OfferProductBox(
                  product: homeProviderT.offerProducts[index],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class OfferProductBox extends StatelessWidget {
  const OfferProductBox({
    super.key,
    required this.product,
  });

  final Products product;

  @override
  Widget build(BuildContext context) {
    var homeProviderF = Provider.of<HomeProvider>(context, listen: false);

    return SizedBox(
      height: height * 0.32,
      width: width * 0.44,
      child: CupertinoButton(
        onPressed: () {
          homeProviderF.setProductId(product.id - 1);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DetailScreen(),
            ),
          );
        },
        padding: EdgeInsets.zero,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // PRODUCT DETAILS NAME, DESCRIPTION, PRICE, CART
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: defaultPadding / 2,
              ),
              alignment: Alignment.bottomCenter,
              height: height * 0.24,
              width: width * 0.44,
              decoration: BoxDecoration(
                color: bgColorList[3],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical: defaultPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // PRODUCT NAME
                    Text(
                      product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge!,
                    ),

                    const SizedBox(
                      height: defaultPadding / 2,
                    ),

                    Row(
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // DESCRIPTION
                              Text(
                                product.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
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
                          ),
                        ),
                        const SizedBox(
                          width: defaultPadding,
                        ),

                        // CART
                        CircleAvatar(
                          radius: height * 0.025,
                          backgroundColor: Colors.red.withOpacity(0.9),
                          child: Text(
                            '-${product.discountPercentage.toInt()}%',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: defaultPadding / 2,
                ),
                height: height * 0.20,
                child: Image.network(product.images[0]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
