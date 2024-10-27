import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../model/product_model.dart';
import '../../../utils/constants.dart';

class TitleDesAndReview extends StatelessWidget {
  const TitleDesAndReview({
    super.key,
    required this.product,
  });

  final Products product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        children: [
          // TITLE AND DESCRIPTION
          TitleAndDescription(product: product),

          const SizedBox(
            width: defaultPadding,
          ),

          // RATINGS
          RatingBox(product: product),
        ],
      ),
    );
  }
}

class RatingBox extends StatelessWidget {
  const RatingBox({
    super.key,
    required this.product,
  });

  final Products product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        // PRICE
        Text(
          '\$ ${product.price}',
          style: Theme.of(context).textTheme.titleLarge,
        ),

        // PRICE
        Text(
          '-${product.discountPercentage} %',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Colors.redAccent,
          ),
        ),

        const SizedBox(
          height: defaultPadding,
        ),

        // RATING
        RatingBar.builder(
          itemSize: 20,
          initialRating: product.rating,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          ignoreGestures: true,
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: product.bgColor,
          ),
          onRatingUpdate: (value) {},
        ),


        Text(
          '(${product.rating} Rating)',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class TitleAndDescription extends StatelessWidget {
  const TitleAndDescription({
    super.key,
    required this.product,
  });

  final Products product;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TITLE
          Text(
            product.title,
            style: Theme.of(context).textTheme.titleLarge,
            overflow: TextOverflow.visible,
            softWrap: true,
          ),

          const SizedBox(
            height: defaultPadding,
          ),

          // DESCRIPTION
          Text(
            product.description,
            style: Theme.of(context).textTheme.bodySmall,
            overflow: TextOverflow.visible,
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
