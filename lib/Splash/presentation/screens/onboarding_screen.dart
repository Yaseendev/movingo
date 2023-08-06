import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import 'package:moving_app/Primary/presentation/screens/primary_screen.dart';
import 'package:moving_app/Settings/cubit/settings_cubit.dart';
import 'package:moving_app/Utils/constants.dart';
import 'splash_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      introductionList: [
        Introduction(
          title: 'Order',
          subTitle:
              'Get furniture delivered within an hour or move into your new place when it works best for you',
          imageUrl: Images.INTRO1,
          imageHeight: MediaQuery.of(context).size.height * .42,
          titleTextStyle: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.PRIMARY_COLOR,
          ),
          subTitleTextStyle: const TextStyle(
            fontSize: 18,
            color: AppColors.PRIMARY_COLOR,
          ),
        ),
        Introduction(
          title: 'Delivery',
          subTitle: 'Your order will be immediately collected and delivered',
          imageUrl: Images.INTRO2,
          imageHeight: MediaQuery.of(context).size.height * .42,
          titleTextStyle: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.PRIMARY_COLOR,
          ),
          subTitleTextStyle: const TextStyle(
            fontSize: 18,
            color: AppColors.PRIMARY_COLOR,
          ),
        ),
        Introduction(
          title: 'Fast & Save',
          subTitle:
              'Your furniture will be covered for any damages that may occur to them',
          imageUrl: Images.INTRO3,
          imageHeight: MediaQuery.of(context).size.height * .42,
          titleTextStyle: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.PRIMARY_COLOR,
          ),
          subTitleTextStyle: const TextStyle(
            fontSize: 18,
            color: AppColors.PRIMARY_COLOR,
          ),
        ),
      ],
      backgroudColor: AppColors.BG_COLOR,
      foregroundColor: AppColors.PRIMARY_COLOR,
      skipTextStyle: const TextStyle(
        fontSize: 20,
        color: AppColors.PRIMARY_COLOR,
      ),
      onTapSkipButton: () {
        context.read<SettingsCubit>().skipIntro();
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => PrimaryScreen()));
      },
    );
  }
}
