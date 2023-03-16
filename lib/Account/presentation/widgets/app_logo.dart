import 'package:flutter/material.dart';
import 'package:moving_app/Utils/constants.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 45,
        foregroundImage:
            AssetImage(Images.LOGO),
        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}