import 'package:e_com_app/controller/home_provider.dart';
import 'package:e_com_app/model/product_model.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';


class TagsRow extends StatelessWidget {
  const TagsRow({
    super.key,
    required this.product,
  });

  final Products product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: defaultPadding ,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tags', style: Theme.of(context).textTheme.titleMedium,),
          Row(
            children: [
              ...List.generate(product.tags.length, (index) => Container(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                margin: const EdgeInsets.only(right: 6, top: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.grey.withOpacity(0.5),
                ),
                child: Text('# ${product.tags[index]}', style: Theme.of(context).textTheme.bodySmall,),
              ),),
            ],
          ),
        ],
      ),
    );
  }
}
