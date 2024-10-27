import 'package:e_com_app/model/product_model.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class ImageBox extends StatelessWidget {
  const ImageBox({
    super.key, required this.product,
  });

  final Products product;

  @override
  Widget build(BuildContext context) {


    return Container(
      height: height * 0.08,
      width: height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: product.bgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            offset: const Offset(6, 6),
            blurRadius: 20,
          ),
        ],
        image: DecorationImage(
          image: NetworkImage(product.images[0]),
        ),
      ),
    );
  }
}
