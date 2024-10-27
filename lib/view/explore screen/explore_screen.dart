import 'package:e_com_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/home_provider.dart';
import 'components/product_grid_view_list.dart';
import 'components/top_and_search_bar.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {

    var homeProviderF = Provider.of<HomeProvider>(context, listen: false);
    homeProviderF.getCategoryList(category);

    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopAndSearchBar(),
            
            ProductGridViewList(),

            SizedBox(
              height: defaultPadding * 2,
            ),
          ],
        ),
      ),
    );
  }
}

