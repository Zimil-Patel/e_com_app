import 'package:e_com_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: defaultPadding,
        right: defaultPadding,
        top: height * 0.055,
        bottom: defaultPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // GREET USER
          Text(
            'Hi,\nStaR Girl',
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

          // PADDING
          const SizedBox(
            width: defaultPadding,
          ),

          // PROFILE
          CircleAvatar(
            radius: height * 0.025,
            backgroundImage: const AssetImage('assets/images/profile.png'),
          ),
        ],
      ),
    );
  }
}
