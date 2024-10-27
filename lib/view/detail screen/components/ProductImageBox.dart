import 'package:e_com_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/home_provider.dart';
import '../../../model/product_model.dart';

class ProductImageBox extends StatelessWidget {
  const ProductImageBox({super.key, required this.product});

  final Products product;

  @override
  Widget build(BuildContext context) {

    var homeProviderT = Provider.of<HomeProvider>(context);
    var homeProviderF = Provider.of<HomeProvider>(context, listen: false);

    return Column(
      children: [
        Container(
          height: height * 0.34,
          width: width,
          margin: const EdgeInsets.symmetric(
            vertical: defaultPadding,
            horizontal: defaultPadding,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(product.images[homeProviderT.currentImage]),
              fit: BoxFit.contain,
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ARROW BACK BUTTON
              ArrowBackButton(),

              Spacer(),

              // ARROW FORWARD BUTTON
              ArrowForwardButton(),
            ],
          ),
        ),

        // IMAGE INDEX INDICATOR
        ImageIndexIndicatorBox(product: product,),
      ],
    );
  }
}

class ImageIndexIndicatorBox extends StatelessWidget {
  const ImageIndexIndicatorBox({
    super.key,
    required this.product,
  });

  final Products product;

  @override
  Widget build(BuildContext context) {

    var homeProviderT = Provider.of<HomeProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          product.images.length,
          (index) => Container(
            margin: const EdgeInsets.all(defaultPadding),
            height: height * 0.01,
            width: height * 0.01,
            decoration: index == homeProviderT.currentImage
                ? BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                    ),
                  )
                : BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    var homeProviderF = Provider.of<HomeProvider>(context, listen: false);

    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(defaultPadding / 2),
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              offset: const Offset(2, 2),
              blurRadius: 10,
            ),
          ],
        ),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
          size: height * 0.030,
        ),
      ),
      onPressed: () {
        homeProviderF.previousImage();
      },
    );
  }
}

class ArrowForwardButton extends StatelessWidget {
  const ArrowForwardButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    var homeProviderF = Provider.of<HomeProvider>(context, listen: false);

    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(defaultPadding / 2),
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              offset: const Offset(2, 2),
              blurRadius: 10,
            ),
          ],
        ),
        child: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white,
          size: height * 0.030,
        ),
      ),
      onPressed: () {
        homeProviderF.nextImage();
      },
    );
  }
}
