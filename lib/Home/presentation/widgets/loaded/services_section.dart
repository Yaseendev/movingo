import 'package:flutter/material.dart';

import 'home_service_card.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Services',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextButton.icon(
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (ctx) => CategoriesScreen(
                  //         categories: state.categories)));
                },
                label: const Text('View All'),
                icon: Icon(
                  Icons.arrow_back,
                  size: 20,
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                ),
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeServiceCard(),
              HomeServiceCard(),
              HomeServiceCard(),
              HomeServiceCard(),
            ],
          ),
        ),
      ],
    );
  }
}
