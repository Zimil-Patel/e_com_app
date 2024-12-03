import 'package:e_com_app/controller/data_provider.dart';
import 'package:e_com_app/controller/home_provider.dart';
import 'package:e_com_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/bottom_navigation_bar.dart';
import 'components/category_list_row.dart';
import 'components/home_top_bar.dart';
import 'components/new_arrivals_column.dart';
import 'components/offer_product_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeProviderT = Provider.of<HomeProvider>(context);

    return Scaffold(
      body: homeProviderT.productList.isNotEmpty
          ? Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // GREET USER, GRID ICON, PROFILE
                      const HomeTopBar(),

                      // CATEGORY LIST
                      const CategoryListRow(),

                      // DISCOUNT
                      const OfferProductRow(),

                      // NEW ARRIVAL SECTION
                      const NewArrivalsColumn(),

                      SizedBox(
                        height: height * 0.2,
                      ),
                    ],
                  ),
                ),

                // NAVIGATION BAR FOR FAVORITE, EXPLORE, CART
                const BottomNavigationBarCustom(),
              ],
            )
          : const Center(
              child: CupertinoActivityIndicator(),
            ),
    );
  }
}
