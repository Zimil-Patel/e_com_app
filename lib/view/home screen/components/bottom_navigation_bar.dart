import 'package:e_com_app/utils/constants.dart';
import 'package:e_com_app/view/cart%20screen/cart_screen.dart';
import 'package:e_com_app/view/explore%20screen/explore_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarCustom extends StatelessWidget {
  const BottomNavigationBarCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.060, horizontal: width * 0.12),
        child: SizedBox(
          height: 60,
          width: 150,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: const Offset(6, 6),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  child: const Icon(Icons.explore, color: Colors.black,),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ExploreScreen(category: "All"),
                      ),
                    );
                  },
                ),
                CupertinoButton(
                  child: const Icon(Icons.shopping_cart, color: Colors.black,),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
