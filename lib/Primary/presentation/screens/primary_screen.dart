import 'package:fancy_bar/fancy_bar.dart';
import 'package:flutter/material.dart';
import 'package:moving_app/Home/presentation/screens/home_screen.dart';
import 'package:moving_app/Utils/constants.dart';

class PrimaryScreen extends StatefulWidget {
  const PrimaryScreen({super.key});

  @override
  State<PrimaryScreen> createState() => _PrimaryScreenState();
}

class _PrimaryScreenState extends State<PrimaryScreen>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  late final TabController controller;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(Images.LOGO),
            backgroundColor: Colors.transparent,
          ),
        ),
        title: Text('MovinGo'),
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 20,
          color: AppColors.PRIMARY_COLOR,
          //Colors.white,
          fontWeight: FontWeight.bold,
        ),
        // backgroundColor: AppColors.BG_COLOR,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))),
        toolbarHeight: 60,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TabBarView(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            HomeScreen(),
            Center(
              child: Text('2'),
            ),
            Center(
              child: Text('3'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FancyBottomBar(
        selectedIndex: _currentIndex,
        type: FancyType.FancyV2,
        items: [
          FancyItem(
            textColor: AppColors.BG_COLOR,
            title: 'Home',
            icon: Icon(Icons.home),
          ),
          FancyItem(
            textColor: AppColors.BG_COLOR,
            title: 'Search',
            icon: Icon(Icons.search),
          ),
          FancyItem(
            textColor: AppColors.BG_COLOR,
            title: 'Settings',
            icon: Icon(Icons.settings),
          ),
        ],
        onItemSelected: (index) {
          controller.animateTo(index);
        },
      ),
    );
  }
}
