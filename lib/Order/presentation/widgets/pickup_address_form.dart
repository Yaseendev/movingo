import 'package:flutter/material.dart';

class PickupForm extends StatefulWidget {
  final Function(bool value) onFocus;
  const PickupForm({
    super.key,
    required this.onFocus,
  });

  @override
  State<PickupForm> createState() => _PickupFormState();
}

class _PickupFormState extends State<PickupForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
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
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: [
              TextFormField(
                // initialValue: _addressName,
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
                  //_addressName = value;
                  widget.onFocus(false);
                },
                onTap: () => widget.onFocus(false),
                validator: (value) {
                  if (value!.trim().isEmpty) return 'This field is required';
                  return null;
                },
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onTap: () => widget.onFocus(true),
                      //initialValue: _area,
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
                        //_area = value;
                        widget.onFocus(true);
                      },
                      validator: (val) =>
                          val!.trim().isEmpty ? 'This field is required' : null,
                    ),
                  ),
                  SizedBox(width: 6),
                  Expanded(
                    child: TextFormField(
                      onTap: () => widget.onFocus(true),
                      // initialValue: _street,
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
                        //_street = value;
                        widget.onFocus(true);
                      },
                      validator: (val) =>
                          val!.trim().isEmpty ? 'This field is required' : null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onTap: () => widget.onFocus(true),
                      //initialValue: _building,
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
                        //  _building = value;
                        widget.onFocus(true);
                      },
                      validator: (val) =>
                          val!.trim().isEmpty ? 'This field is required' : null,
                    ),
                  ),
                  SizedBox(width: 6),
                  Expanded(
                    child: TextFormField(
                      onTap: () => widget.onFocus(true),
                      //initialValue: 'Floor',
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
                        //_floor = value;
                        widget.onFocus(true);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              TextFormField(
                onTap: () => widget.onFocus(true),
                //initialValue: _otherDetails,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  labelText: 'Other Details',
                  hintText: 'Other Details (Apartment Number,Landmark, etc.)',
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
                  //   _otherDetails = value;
                  widget.onFocus(true);
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                onTap: () => widget.onFocus(true),
                // initialValue: _phone,
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
                onChanged: (value) =>
                    widget.onFocus(true), //_phone = value.trim(),
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
        ],
      ),
    );
  }
}
