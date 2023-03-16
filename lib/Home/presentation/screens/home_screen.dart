import 'package:flutter/material.dart';

import '../widgets/loaded/home_loaded_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 4)).then((value) => false);
        },
        child: SafeArea(
            child: HomeLoadedView(
          
        )),
        //  ListView(
        //   physics: NeverScrollableScrollPhysics(),
        //   shrinkWrap: true,
        //   //crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     //HomeLoadingWidget(),
        //     HomeLoadedWidget(),
        //     SizedBox(height: 30),
        //   ],
        // ),
      ),
    );
  }
}
