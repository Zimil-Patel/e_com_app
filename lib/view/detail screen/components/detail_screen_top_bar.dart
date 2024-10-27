import 'package:e_com_app/controller/home_provider.dart';
import 'package:e_com_app/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants.dart';

class DetailScreenTopBar extends StatelessWidget {
  const DetailScreenTopBar({
    super.key,
    required this.products,
  });

  final Products products;

  @override
  Widget build(BuildContext context) {

    var homeProviderF = Provider.of<HomeProvider>(context, listen: false);


    return Padding(
      padding: EdgeInsets.only(
        left: defaultPadding * 2,
        right: defaultPadding * 2,
        top: height * 0.060,
        bottom: defaultPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // BACK BUTTON
          CupertinoButton(
            padding: EdgeInsets.zero,
            child: Container(
              padding: const EdgeInsets.all(defaultPadding * 0.8),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    offset: const Offset(6, 6),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),

          const SizedBox(
            width: defaultPadding * 2,
          ),

          // PADDING
          const Spacer(),

          // GRID ICON
          CupertinoButton(
            child: Icon(
              !products.isFavourite ? Icons.favorite_border_rounded : Icons.favorite_rounded,
              color: !products.isFavourite ? Colors.black : Colors.redAccent,
            ),
            onPressed: () {
              homeProviderF.toggleFavorite(products.id);
            },
          ),
          CupertinoButton(
            child: const Icon(
              Icons.share,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
