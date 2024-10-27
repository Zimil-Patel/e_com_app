import 'package:e_com_app/utils/category_list.dart';
import 'package:e_com_app/utils/color_list.dart';
import 'package:e_com_app/utils/constants.dart';
import 'package:e_com_app/view/explore%20screen/explore_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CategoryListRow extends StatelessWidget {
  const CategoryListRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(
            width: width * 0.24,
          ),
          ...List.generate(
            categoryList.length,
            (index) => CategoryBox(
              label: categoryList[index],
              index: index,
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryBox extends StatelessWidget {
  const CategoryBox({
    super.key,
    required this.label,
    required this.index,
  });

  final String label;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExploreScreen(
              category: label,
            ),
          ),
        );
      },

      padding: EdgeInsets.zero,
      child: Container(
        margin: const EdgeInsets.all(defaultPadding),
        height: index != 0 ? height * 0.10 : height * 0.12,
        width: index != 0 ? height * 0.10 : height * 0.12,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColorList[index],
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            // SVG ICON
            SizedBox(
              height: height * 0.028,
              width: height * 0.028,
              child: SvgPicture.asset(
                fit: BoxFit.cover,
                'assets/svg/${label.toLowerCase()}.svg',
              ),
            ),

            // CATEGORY NAME
            Text(
              label,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
