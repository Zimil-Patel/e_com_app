import 'package:e_com_app/controller/data_provider.dart';
import 'package:e_com_app/controller/home_provider.dart';
import 'package:e_com_app/model/product_model.dart';
import 'package:e_com_app/utils/color_list.dart';
import 'package:e_com_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../detail screen/detail_screen.dart';

class NewArrivalsColumn extends StatelessWidget {
  const NewArrivalsColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var homeProviderT = Provider.of<HomeProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: defaultPadding * 3,
        horizontal: defaultPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'New Arrivals',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: height * 0.024,
                ),
          ),

          // PRODUCT LIST
          ...List.generate(
            homeProviderT.newArrivalList.length,
            (index) => NewArrivalProductBox(
              product: homeProviderT.newArrivalList[index],
            ),
          ),
        ],
      ),
    );
  }
}

class NewArrivalProductBox extends StatelessWidget {
  const NewArrivalProductBox({
    super.key,
    required this.product,
  });

  final Products product;

  @override
  Widget build(BuildContext context) {
    var homeProviderF = Provider.of<HomeProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
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
        child: SizedBox(
          width: width,
          child: Row(
            children: [
              Container(
                height: height * 0.07,
                width: height * 0.07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: product.bgColor,
                  image: DecorationImage(
                    image: NetworkImage(product.images[0]),
                  ),
                ),
              ),
              const SizedBox(
                width: defaultPadding,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TITLE
                    Text(
                      product.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),

                    // DESCRIPTION
                    Text(
                      product.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: defaultPadding * 10,
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
      ),
    );
  }
}
