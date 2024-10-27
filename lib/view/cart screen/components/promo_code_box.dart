import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class PromoCodeBox extends StatelessWidget {
  const PromoCodeBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: defaultPadding / 2, horizontal: defaultPadding * 2),
      width: width,
      padding:
      const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding,),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            offset: const Offset(6, 6),
            blurRadius: 20,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Promo Code', style: TextStyle(color: Colors.grey,),),

          const Spacer(),

          // PROMO CODE APPLY BUTTON
          CupertinoButton(
              padding: EdgeInsets.zero,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding * 2,
                  vertical: defaultPadding,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  'Apply',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: () {})
        ],
      ),
    );
  }
}
