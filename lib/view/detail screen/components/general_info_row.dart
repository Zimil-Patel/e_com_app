import 'package:e_com_app/model/product_model.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class GeneralInfoRow extends StatelessWidget {
  const GeneralInfoRow({
    super.key,
    required this.product,
  });

  final Products product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          TitleLabelColumnBox(title: 'Brand', label: product.brand,),
          TitleLabelColumnBox(title: 'Stock', label: product.stock.toString(),),
          TitleLabelColumnBox(title: 'Weight', label: product.weight.toString(),),
          TitleLabelColumnBox(title: 'Status', label: product.availabilityStatus.toString(),),
          TitleLabelColumnBox(title: 'sku', label: product.sku,),

        ],
      ),
    );
  }
}

class TitleLabelColumnBox extends StatelessWidget {
  const TitleLabelColumnBox({
    super.key, required this.title, required this.label,
  });

  final String title, label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: defaultPadding, bottom: defaultPadding, right: defaultPadding * 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(title, style: Theme.of(context).textTheme.titleMedium,),
          Text(label, style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}

class TitleLabelRow extends StatelessWidget {
  const TitleLabelRow({
    super.key, required this.label, required this.title,
  });

  final String label, title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$title : ', style: Theme.of(context).textTheme.titleMedium,),
        Text(label, style: Theme.of(context).textTheme.bodySmall,),
      ],
    );
  }
}

