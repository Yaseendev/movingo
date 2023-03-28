import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moving_app/Order/blocs/address_form_bloc/address_form_bloc.dart';

class DropoffForm extends StatefulWidget {
  final Function(bool value) onFocus;
  final GlobalKey<FormState> formKey;
  const DropoffForm({
    super.key,
    required this.onFocus,
    required this.formKey,
  });

  @override
  State<DropoffForm> createState() => _DropoffFormState();
}

class _DropoffFormState extends State<DropoffForm> {
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
      nameCont.text = context.read<AddressFormBloc>().dropOffFormAddress.name;
      areaCont.text = context.read<AddressFormBloc>().dropOffFormAddress.area;
      streetCont.text =
          context.read<AddressFormBloc>().dropOffFormAddress.street;
      buildingCont.text =
          context.read<AddressFormBloc>().dropOffFormAddress.building;
      floorCont.text = context.read<AddressFormBloc>().dropOffFormAddress.floor;
      otherCont.text =
          context.read<AddressFormBloc>().dropOffFormAddress.otherDetails;
      phoneCont.text =
          context.read<AddressFormBloc>().dropOffFormAddress.phoneNumber;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressFormBloc, AddressFormState>(
      listener: (context, state) {
        if (state is DropoffAddressFetched) {
          if (state.area.isNotEmpty) areaCont.text = state.area;
          if (state.street.isNotEmpty) streetCont.text = state.street;
        }
      },
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            Text(
              "Drop off address",
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
                          .add(SetName(name: value, isPickup: false));
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
                                .add(SetArea(area: value, isPickup: false));
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
                                .add(SetStreet(street: value, isPickup: false));
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
                                SetBuilding(building: value, isPickup: false));
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
                                .add(SetFloor(floor: value, isPickup: false));
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
                          .add(SetOther(other: value, isPickup: false));
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
                          .add(SetPhone(phone: value, isPickup: false));
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
