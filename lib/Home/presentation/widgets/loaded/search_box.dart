import 'package:flutter/material.dart';
import 'package:moving_app/Order/presentation/screens/addresses_screen.dart';
import 'package:moving_app/Utils/constants.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          fillColor: Colors.grey[350],
          filled: true,
          prefixIcon: Icon(Icons.search_rounded),
          hintText: 'Move From...',
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              VerticalDivider(
                //color: Colors.black,
                thickness: 2,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.history_toggle_off_rounded),
                label: Text('Now'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
        readOnly: true,
        textAlignVertical: TextAlignVertical.bottom,
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => AddressesScreen()));
        },
      ),
    );
    // Container(
    //   height: 45,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(8),
    //     color: Colors.grey,
    //   ),
    //   child: Row(
    //     children: [
    //       Text('Move From...'),
    //     ],
    //   ),
    // );
  }
}
