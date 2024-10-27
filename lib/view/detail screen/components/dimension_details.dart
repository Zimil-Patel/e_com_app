import 'package:e_com_app/model/product_model.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import 'general_info_row.dart';


class DimensionDetails extends StatelessWidget {
  const DimensionDetails({
    super.key,
    required this.product,
  });

  final Products product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Dimension', style: Theme.of(context).textTheme.titleMedium,),
          TitleLabelRow(title: '\t\t\t\t\tWidth', label: product.dimensions.width.toString(),),
          TitleLabelRow(title: '\t\t\t\t\tHeight', label: product.dimensions.height.toString(),),
          TitleLabelRow(title: '\t\t\t\t\tDepth', label: product.dimensions.depth.toString(),),
        ],
      ),
    );
  }
}

