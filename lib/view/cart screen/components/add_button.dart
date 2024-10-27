import 'package:e_com_app/controller/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/product_model.dart';
import '../../../utils/constants.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key, required this.product, required this.index,
  });

  final int index;
  final Products product;

  @override
  Widget build(BuildContext context) {

    var homeProviderF = Provider.of<HomeProvider>(context, listen: false);

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
      onPressed: () {
        homeProviderF.increaseQuantity(index);
      },
    );
  }
}

