import 'package:e_com_app/model/product_model.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import 'general_info_row.dart';

class MetaInfo extends StatelessWidget {
  const MetaInfo({
    super.key,
    required this.product,
  });

  final Products product;

  @override
  Widget build(BuildContext context) {
    DateTime createDate = DateTime.parse(product.meta.createdAt);
    DateTime updateDate = DateTime.parse(product.meta.updatedAt);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: defaultPadding / 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleLabelRow(
              title: 'Created at',
              label:
                  '${createDate.day}/${createDate.month}/${createDate.year}'),
          TitleLabelRow(
            title: 'Updated at',
            label: '${updateDate.day}/${updateDate.month}/${updateDate.year}',
          ),
          TitleLabelRow(
            title: 'Bar code',
            label: product.meta.barcode,
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                image: NetworkImage(product.meta.qrCode),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
