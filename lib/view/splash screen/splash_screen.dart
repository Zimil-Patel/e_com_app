import 'package:e_com_app/utils/constants.dart';
import 'package:e_com_app/view/home%20screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set your desired background color
      body: Column(
        children: [
          Spacer(),

          // Top half for the image
          Center(
            child: Image.asset(
              'assets/images/splash.png',
              fit: BoxFit.contain,
            ),
          ),

          const Spacer(),
          // Bottom half for the app name or other widgets
          const Text(
            'Multi-Product',
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            child: Text(
                'It is now very easy to reach the best quality among all',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: height * 0.018)),
          ),

          const SizedBox(height: 20.0),

          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding),
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding * 5, vertical: defaultPadding),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Let\'s go',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),

          Spacer(),
        ],
      ),
    );
  }
}
