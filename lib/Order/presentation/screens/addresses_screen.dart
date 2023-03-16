import 'package:flutter/material.dart';
import 'package:moving_app/Utils/constants.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({super.key});

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))),
        title: Text('Select Addresses'),
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 5),
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                      gapPadding: 0,
                    ),
                    icon: Icon(
                      Icons.location_on_rounded,
                      color: AppColors.PRIMARY_COLOR,
                    ),
                    hintText: 'Pick up',
                    fillColor: Colors.grey[350],
                    filled: true,
                  ),
                ),
                SizedBox(height: 4),
                TextFormField(
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    // constraints: ,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                      gapPadding: 0,
                    ),
                    icon: Icon(
                      Icons.location_on_rounded,
                      color: AppColors.PRIMARY_COLOR,
                    ),
                    hintText: 'Drop Off',
                    fillColor: Colors.grey[350],
                    filled: true,
                  ),
                ),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(85),
        ),
      ),
    );
  }
}
