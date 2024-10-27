import 'package:e_com_app/controller/data_provider.dart';
import 'package:e_com_app/controller/home_provider.dart';
import 'package:e_com_app/utils/constants.dart';
import 'package:e_com_app/utils/theme.dart';
import 'package:e_com_app/view/splash%20screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DataProvider dataProvider = DataProvider();
  HomeProvider homeProvider = HomeProvider();
  await dataProvider.convertJson();
  homeProvider.productList = dataProvider.productModel.productList;
  homeProvider.getOfferProductList();
  homeProvider.getNewArrivalList();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => dataProvider,
        ),
        ChangeNotifierProvider(
          create: (context) => homeProvider,
        ),
      ],
      builder: (context, child) => const EComApp(),
    ),
  );
}

class EComApp extends StatelessWidget {
  const EComApp({super.key});

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
