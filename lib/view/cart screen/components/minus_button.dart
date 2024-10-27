import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/home_provider.dart';
import '../../../model/product_model.dart';
import '../../../utils/constants.dart';

class MinusButton extends StatelessWidget {
  const MinusButton({
    super.key, required this.product, required this.index,
  });

  final Products product;
  final int index;

  @override
  Widget build(BuildContext context) {

    var homeProviderF = Provider.of<HomeProvider>(context, listen: false);

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
      onPressed: () {
        homeProviderF.decreaseQuantity(index);
      },
    );
  }
}
