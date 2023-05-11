import 'package:flutter/material.dart';
import 'package:moving_app/Utils/constants.dart';

class VehicleCard extends StatelessWidget {
  final String label;
  final String desc;
  final num price;
  final String imgUri;
  final bool selected;
  final VoidCallback onSelect;
  const VehicleCard({
    super.key,
    required this.label,
    required this.desc,
    required this.price,
    required this.imgUri,
    required this.onSelect,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: selected ? AppColors.BG_COLOR : null,
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
                      label,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: selected ? AppColors.PRIMARY_COLOR : null,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      desc,
                      style: TextStyle(
                        color: selected ? AppColors.PRIMARY_COLOR : null,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '\$$price/km',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: selected ? AppColors.PRIMARY_COLOR : null,
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              Expanded(child: Image.asset(imgUri)),
            ],
          ),
        ),
      ),
    );
  }
}
