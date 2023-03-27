import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moving_app/Order/blocs/address_form_bloc/address_form_bloc.dart';
import 'package:moving_app/Order/blocs/address_form_cubit/address_form_cubit.dart';
import 'package:moving_app/Order/data/models/form_address.dart';

class PickupForm extends StatefulWidget {
  final Function(bool value) onFocus;
  final GlobalKey<FormState> formKey;
  const PickupForm({
    super.key,
    required this.onFocus,
    required this.formKey,
  });

  @override
  State<PickupForm> createState() => _PickupFormState();
}

class _PickupFormState extends State<PickupForm> {
  final TextEditingController nameCont = TextEditingController(),
      areaCont = TextEditingController(),
      streetCont = TextEditingController(),
      buildingCont = TextEditingController(),
      floorCont = TextEditingController(),
      otherCont = TextEditingController(),
      phoneCont = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      nameCont.text = context.read<AddressFormBloc>().pickupFormAddress.name;
      areaCont.text = context.read<AddressFormBloc>().pickupFormAddress.area;
      streetCont.text = context.read<AddressFormBloc>().pickupFormAddress.street;
      buildingCont.text = context.read<AddressFormBloc>().pickupFormAddress.building;
      floorCont.text = context.read<AddressFormBloc>().pickupFormAddress.floor;
      otherCont.text = context.read<AddressFormBloc>().pickupFormAddress.otherDetails;
      phoneCont.text = context.read<AddressFormBloc>().pickupFormAddress.phoneNumber;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressFormBloc, AddressFormState>(
      listener: (context, state) {
        if (state is PickupAddressFetched) {
          if (state.area.isNotEmpty) areaCont.text = state.area;
          if (state.street.isNotEmpty) streetCont.text = state.street;
        }
      },
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            Text(
              "Pick up address",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 22.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            Divider(),
            SizedBox(height: 12),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: [
                  TextFormField(
                    controller: nameCont,
                    autofocus: false,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelText: 'Address Name',
                      hintText: 'Address Name',
                      prefixIcon: const Icon(Icons.room),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      context
                          .read<AddressFormBloc>()
                          .add(SetName(name: value, isPickup: true));
                      widget.onFocus(false);
                    },
                    onTap: () => widget.onFocus(false),
                    validator: (value) {
                      if (value!.trim().isEmpty)
                        return 'This field is required';
                      return null;
                    },
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          onTap: () => widget.onFocus(true),
                          controller: areaCont,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            labelText: 'Area',
                            hintText: 'Area',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            context
                                .read<AddressFormBloc>()
                                .add(SetArea(area: value, isPickup: true));
                            widget.onFocus(true);
                          },
                          validator: (val) => val!.trim().isEmpty
                              ? 'This field is required'
                              : null,
                        ),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: TextFormField(
                          onTap: () => widget.onFocus(true),
                          controller: streetCont,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            labelText: 'Street Name',
                            hintText: 'Street Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            context
                                .read<AddressFormBloc>()
                                .add(SetStreet(street: value, isPickup: true));
                            widget.onFocus(true);
                          },
                          validator: (val) => val!.trim().isEmpty
                              ? 'This field is required'
                              : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          onTap: () => widget.onFocus(true),
                          controller: buildingCont,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            labelText: 'Building Name/Number',
                            hintText: 'Building Name/Number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            context.read<AddressFormBloc>().add(
                                SetBuilding(building: value, isPickup: true));
                            widget.onFocus(true);
                          },
                          validator: (val) => val!.trim().isEmpty
                              ? 'This field is required'
                              : null,
                        ),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: TextFormField(
                          onTap: () => widget.onFocus(true),
                          controller: floorCont,
                          decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              labelText: 'Floor',
                              hintText: 'Floor',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              )),
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            context
                                .read<AddressFormBloc>()
                                .add(SetFloor(floor: value, isPickup: true));
                            widget.onFocus(true);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    onTap: () => widget.onFocus(true),
                    controller: otherCont,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelText: 'Other Details',
                      hintText:
                          'Other Details (Apartment Number,Landmark, etc.)',
                      prefixIcon: const Icon(Icons.location_on),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    cursorColor: Colors.grey,
                    keyboardType: TextInputType.multiline,
                    maxLines: 2,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      context
                          .read<AddressFormBloc>()
                          .add(SetOther(other: value, isPickup: true));
                      widget.onFocus(true);
                    },
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    onTap: () => widget.onFocus(true),
                    controller: phoneCont,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.phone),
                    ),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    maxLength: 9,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      context
                          .read<AddressFormBloc>()
                          .add(SetPhone(phone: value, isPickup: true));
                      widget.onFocus(true);
                    },
                    validator: (value) {
                      return value!.trim().isNotEmpty
                          ? int.tryParse(value.trim()) == null
                              ? 'Please enter a valid phone Number'
                              : null
                          : 'This field is required';
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
