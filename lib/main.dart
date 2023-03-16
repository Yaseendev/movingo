import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moving_app/Primary/presentation/screens/primary_screen.dart';
import 'package:moving_app/Settings/cubit/settings_cubit.dart';
import 'package:moving_app/Splash/presentation/screens/splash_screen.dart';
import 'package:moving_app/Utils/constants.dart';
import 'Settings/data/models/settings.dart';
import 'Splash/presentation/screens/onboarding_screen.dart';
import 'Utils/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await locatorsSetup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsCubit>(
          create: (context) => SettingsCubit(),
        ),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
      child: BlocBuilder<SettingsCubit, Settings>(
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: AppColors.PRIMARY_COLOR,
                primarySwatch: AppColors.PRIMARY_SWATCH,
              ),
              home: !state.isIntro
                  ? const OnboardingScreen()
                  : const PrimaryScreen()
              //: const SplashScreen(),
              );
        },
      ),
    );
  }
}
