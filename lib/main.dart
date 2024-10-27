import 'package:e_com_app/controller/data_provider.dart';
import 'package:e_com_app/utils/constants.dart';
import 'package:e_com_app/utils/theme.dart';
import 'package:e_com_app/view/home%20screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DataProvider dataProvider = DataProvider();
  await dataProvider.convertJson();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => dataProvider,
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
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
