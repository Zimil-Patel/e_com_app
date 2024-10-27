import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../utils/constants.dart';


class TopAndSearchBar extends StatelessWidget {
  const TopAndSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: defaultPadding * 2,
        right: defaultPadding * 2,
        top: height * 0.060,
        bottom: defaultPadding,
      ),
      child: Column(
        children: [
          // EXPLORE TITLE AND GRID SVG ICON
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // BACK BUTTON
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: Container(
                  padding: const EdgeInsets.all(defaultPadding * 0.8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        offset: const Offset(6, 6),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),

              const SizedBox(
                width: defaultPadding * 2,
              ),

              // EXPLORE TITLE
              Text(
                'Explore',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(),
              ),

              // PADDING
              const Spacer(),

              // GRID ICON
              SvgPicture.asset(
                'assets/svg/grid_icon.svg',
                height: height * 0.027,
                width: height * 0.027,
              ),
            ],
          ),

          // SEARCH BAR
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: defaultPadding * 2,
            ),
            height: height * 0.050,
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  offset: const Offset(6, 6),
                  blurRadius: 20,
                ),
              ],
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.search),
                Spacer(),
                Icon(Icons.filter_alt_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
