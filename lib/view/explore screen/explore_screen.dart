import 'package:e_com_app/controller/home_provider.dart';
import 'package:e_com_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import '../../model/product_model.dart';
import 'components/top_and_search_bar.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key, this.category = "All"});

  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopAndSearchBar(),
            
            ProductGridViewList(category: category,)
          ],
        ),
      ),
    );
  }
}

class ProductGridViewList extends StatelessWidget {
  const ProductGridViewList({
    super.key, required this.category,
  });

  final String category;

  @override
  Widget build(BuildContext context) {


    var homeProviderT = Provider.of<HomeProvider>(context);
    var homeProviderF = Provider.of<HomeProvider>(context, listen: false);

    List<Products> productList = homeProviderF.getCategoryList(category);

    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      shrinkWrap: true,
      itemCount: productList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: defaultPadding,
        crossAxisSpacing: defaultPadding,
      ),
      itemBuilder: (context, index) {
        return Container(
          height: 500,
          width: 500,
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
        );
      },
    );
  }
}
