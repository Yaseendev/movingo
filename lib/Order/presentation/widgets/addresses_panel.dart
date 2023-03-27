import 'package:flutter/material.dart';
import 'package:moving_app/Order/blocs/address_form_cubit/address_form_cubit.dart';
import 'package:moving_app/Order/data/models/order_address.dart';

import 'pickup_address_form.dart';

class AddressesPanel extends StatefulWidget {
  final ScrollController scrollController;
  final Function(bool value) onResize;
  final PageController pageController;
  final GlobalKey<FormState> pickupFormKey;
  final GlobalKey<FormState> dropoffFormKey;
  final OrderAddress? pickupAddress;
  const AddressesPanel({
    super.key,
    required this.onResize,
    required this.scrollController,
    required this.pageController,
    required this.pickupFormKey,
    required this.dropoffFormKey,
    required this.pickupAddress,
  });

  @override
  State<AddressesPanel> createState() => _AddressesPanelState();
}

class _AddressesPanelState extends State<AddressesPanel> {
  late String? name;

  @override
  void initState() {
    name = widget.pickupAddress?.name;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('Dependencies Changed');
    super.didChangeDependencies();
  }

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
                formKey: widget.pickupFormKey,
              ),
              // PickupForm(
              //   onFocus: widget.onResize,
              //   formKey: widget.pickupFormKey,
              // ),
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
