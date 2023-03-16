import 'package:flutter/material.dart';
import 'package:moving_app/Utils/constants.dart';

import 'offers_section.dart';
import 'search_box.dart';
import 'services_section.dart';

class HomeLoadedView extends StatelessWidget {
  const HomeLoadedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchBox(),
        const SizedBox(height: 8),
        ServicesSection(),
        const SizedBox(height: 8),
        OffersSection(),
      ],
    );
  }
}
