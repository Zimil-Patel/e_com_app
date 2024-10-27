import 'package:e_com_app/controller/home_provider.dart';
import 'package:e_com_app/model/product_model.dart';
import 'package:e_com_app/view/detail%20screen/components/ReviewBox.dart';
import 'package:e_com_app/view/detail%20screen/components/tags_row.dart';
import 'package:e_com_app/view/detail%20screen/components/title_des_and_rating.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants.dart';
import 'dimension_details.dart';
import 'general_info_row.dart';

class ProductDetailBox extends StatelessWidget {
  const ProductDetailBox({
    super.key, required this.product,
  });

  final Products product;

  @override
  Widget build(BuildContext context) {

    return Container(
      constraints: BoxConstraints(minHeight: height * 0.6),
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            offset: const Offset(-6, -6),
            blurRadius: 20,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding * 2, vertical: defaultPadding * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // TITLE, DESCRIPTION, RATING, PRICE, DISCOUNT
            TitleDesAndReview(product: product),

            // TAGS
            TagsRow(product: product),

            // BRAND, STOCK, WEIGHT, STATUS
            GeneralInfoRow(product: product),

            const Divider(),

            TitleLabelRow(
              title: 'Warranty Information',
              label: product.warrantyInformation,
            ),

            TitleLabelRow(
              title: 'Shipping Information',
              label: product.shippingInformation,
            ),

            TitleLabelRow(
              title: 'Return Policy',
              label: product.returnPolicy,
            ),

            TitleLabelRow(
              title: 'Minimum Order Quantity',
              label: product.minimumOrderQuantity.toString(),
            ),

            const Divider(),

            // DIMENSION
            DimensionDetails(product: product),

            const Divider(),

            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: defaultPadding / 2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reviews',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  ...List.generate(
                    product.reviewList.length,
                    (index) => ReviewBox(
                      review: product.reviewList[index],
                    ),
                  ),
                ],
              ),
            ),

            // BOTTOM PADDING
            SizedBox(
              height: height * 0.2,
            ),
          ],
        ),
      ),
    );
  }
}
