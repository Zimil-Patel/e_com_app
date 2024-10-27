import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/home_provider.dart';
import '../../../model/product_model.dart';
import '../../../utils/constants.dart';


class RemoveItemButton extends StatelessWidget {
  const RemoveItemButton({
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
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.close,
          color: Colors.grey,
          size: height * 0.016,
        ),
      ),
      onPressed: () {
        homeProviderF.removeFromCart(index);
      },
    );
  }
}

