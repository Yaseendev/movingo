import 'package:flutter/material.dart';

import 'pickup_address_form.dart';

class AddressesPanel extends StatefulWidget {
  final ScrollController scrollController;
  final Function(bool value) onResize;
  final PageController pageController;
  const AddressesPanel({
    super.key,
    required this.onResize,
    required this.scrollController,
    required this.pageController,
  });

  @override
  State<AddressesPanel> createState() => _AddressesPanelState();
}

class _AddressesPanelState extends State<AddressesPanel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
              ),
            ],
          ),
        ),
        Expanded(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: widget.pageController,
            children: [
              PickupForm(
                onFocus: widget.onResize,
              ),
              Text('Page 2'),
              //   Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[

              //   ],
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
