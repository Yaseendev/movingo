import 'package:flutter/material.dart';
import '../widgets/app_logo.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final PageController pageController = PageController();
  int _currentIndex = 0;

    Future<void> goToPage(int page) async {
    setState(() {
      _currentIndex = page;
    });
    pageController.animateToPage(page,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),
                      AppLogo(),
                      SizedBox(height: 12),
            Expanded(
              child: PageView(
                children: [
                  
                ],
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}