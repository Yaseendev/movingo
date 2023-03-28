import 'package:flutter/material.dart';
import 'package:moving_app/Utils/constants.dart';

class VehicleSelectListView extends StatelessWidget {
  const VehicleSelectListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Large',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('100 sq ft - 100 kg'),
                      Text('\$10/km'),
                      SizedBox(height: 25),
                    ],
                  ),
                ),
                Expanded(
                    child: Image.asset('${Images.IMAGES_BASE_URI}pickup.png')),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
