import 'package:e_com_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/home_provider.dart';

class PricingDetails extends StatelessWidget {
  const PricingDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {


    var homeProviderT = Provider.of<HomeProvider>(context);
    var homeProviderF = Provider.of<HomeProvider>(context, listen: false);

    homeProviderF.calculateBagTotal();

    double subTotal = homeProviderT.subTotal;
    double bagTotal = homeProviderT.bagTotal;
    double shipping = homeProviderT.shipping;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: defaultPadding * 2,
        ),
        const Divider(
          endIndent: defaultPadding * 3,
          indent: defaultPadding * 3,
          thickness: 2,
        ),

        // SUBTOTAL
        LabelPriceRow(
          label: 'Subtotal',
          price: subTotal,
        ),

        const Divider(
          endIndent: defaultPadding * 3,
          indent: defaultPadding * 3,
          thickness: 2,
        ),

        // SHIPPING
        LabelPriceRow(label: 'Shipping', price: shipping),

        const Divider(
          endIndent: defaultPadding * 3,
          indent: defaultPadding * 3,
          thickness: 2,
        ),

        // BagTotal
        LabelPriceRow(label: 'Bag Total', price: bagTotal, showItemCount: true,),

        SizedBox(
          height: height * 0.2,
        ),
      ],
    );
  }
}

class LabelPriceRow extends StatelessWidget {
  const LabelPriceRow({
    super.key,
    required this.label,
    required this.price, this.showItemCount = false,
  });

  final String label;
  final double price;
  final bool showItemCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: defaultPadding / 2, horizontal: defaultPadding * 4),
      child: Row(
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          )
          ,
          const Spacer(),

          if(showItemCount) Padding(
            padding: const EdgeInsets.only(right: defaultPadding),
            child: Text(
              '(4 items)',
              style: Theme.of(context).textTheme.bodySmall!
            ),
          ),


          Text(
            '\$ ${price.toStringAsFixed(2)} USD',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w900,
                ),
          )
        ],
      ),
    );
  }
}
