import 'package:flutter/material.dart';
import 'package:moving_app/Utils/constants.dart';

import 'vehicle_card.dart';

class VehicleSelectListView extends StatefulWidget {
  final Function(int index) onSelect;
  const VehicleSelectListView({
    super.key,
    required this.onSelect,
  });

  @override
  State<VehicleSelectListView> createState() => _VehicleSelectListViewState();
}

class _VehicleSelectListViewState extends State<VehicleSelectListView> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        VehicleCard(
          label: 'Large',
          desc: '100 sq ft - 100 kg',
          price: 12,
          imgUri: '${Images.IMAGES_BASE_URI}pickup.png',
          selected: selectedIndex == 0,
          onSelect: () {
            setState(() {
              selectedIndex = 0;
            });
            widget.onSelect(selectedIndex!);
          },
        ),
        VehicleCard(
          label: 'Medium',
          desc: '100 sq ft - 100 kg',
          price: 10,
          imgUri: '${Images.IMAGES_BASE_URI}pickup.png',
          selected: selectedIndex == 1,
          onSelect: () {
             setState(() {
              selectedIndex = 1;
            });
            widget.onSelect(selectedIndex!);
          },
        ),
        VehicleCard(
          label: 'Mini-Open',
          desc: '100 sq ft - 100 kg',
          price: 6,
          imgUri: '${Images.IMAGES_BASE_URI}pickup.png',
          selected: selectedIndex == 2,
          onSelect: () {
             setState(() {
              selectedIndex = 2;
            });
            widget.onSelect(selectedIndex!);
          },
        ),
      ],
    );
  }
}
