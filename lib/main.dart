import 'package:e_com_app/controller/data_provider.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
