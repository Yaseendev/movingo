import 'package:flutter/material.dart';
import 'package:moving_app/Utils/constants.dart';

import '../widgets/splash_loading_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BG_COLOR,
      body: SplashLoadingWidget());
  }
}