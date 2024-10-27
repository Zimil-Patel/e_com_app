import 'package:e_com_app/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../utils/constants.dart';

class ReviewBox extends StatelessWidget {
  const ReviewBox({
    super.key,
    required this.review,
  });

  final Review review;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(review.date);

    return Column(
      children: [
        Container(
          width: width,
          margin: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 6.0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Reviewer Name & Email
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      review.reviewerName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),

                  const SizedBox(
                    width: defaultPadding * 2,
                  ),

                  Expanded(
                    flex: 3,
                    child: Text(
                      textAlign: TextAlign.end,
                      review.reviewerEmail,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8.0),

              // Rating & Date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Rating
                  RatingBar.builder(
                    itemSize: 16,
                    initialRating: review.rating.toDouble(),
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    ignoreGestures: true,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (value) {},
                  ),

                  Text(
                    '${dateTime.day}/${dateTime.month}/${dateTime.year}',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8.0),

              // Comment
              Text(
                review.comment,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
