import 'package:flutter/material.dart';
import 'package:moving_app/Utils/constants.dart';

class HomeServiceCard extends StatelessWidget {
  const HomeServiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185,
      width: 195,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: 110,
                  decoration: BoxDecoration(
                      color: AppColors.BG_COLOR, //Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Center(
                    child: Image.asset('${Images.IMAGES_BASE_URI}pickup.png'),
                  ),
                ),
                //SizedBox(height: 5),
                ListTile(
                  title: Text('Mini-Open'),
                  subtitle: Text(
                    '100 sq ft - 100kgs',
                    maxLines: 2,
                  ),
                  trailing: Text('\$6/km'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
