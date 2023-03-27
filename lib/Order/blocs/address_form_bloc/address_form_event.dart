part of 'address_form_bloc.dart';

abstract class AddressFormEvent extends Equatable {
  final bool isPickupAddress;
  const AddressFormEvent({required this.isPickupAddress});

  @override
  List<Object> get props => [isPickupAddress];
}

class SetName extends AddressFormEvent {
  final String name;
  SetName({
    required this.name,
    required bool isPickup,
  }) : super(isPickupAddress: isPickup);

  @override
  List<Object> get props => [...super.props, name];
}

class SetArea extends AddressFormEvent {
  final String area;
  SetArea({
    required this.area,
       required bool isPickup,
  }) : super(isPickupAddress: isPickup);

  @override
  List<Object> get props => [...super.props, area];
}

class SetBuilding extends AddressFormEvent {
  final String building;
  SetBuilding({
    required this.building,
     required bool isPickup,
  }) : super(isPickupAddress: isPickup);

  @override
  List<Object> get props => [...super.props, building];
}

class SetStreet extends AddressFormEvent {
  final String street;
  SetStreet({
    required this.street,
    required bool isPickup,
  }) : super(isPickupAddress: isPickup);

  @override
  List<Object> get props => [...super.props, street];
}

class SetFloor extends AddressFormEvent {
  final String floor;
  SetFloor({
    required this.floor,
    required bool isPickup,
  }) : super(isPickupAddress: isPickup);

  @override
  List<Object> get props => [...super.props, floor];
}

class SetOther extends AddressFormEvent {
  final String other;

  SetOther({
    required this.other,
    required bool isPickup,
  }) : super(isPickupAddress: isPickup);

  @override
  List<Object> get props => [...super.props, other];
}

class SetPhone extends AddressFormEvent {
  final String phone;
  SetPhone({
    required this.phone,
    required bool isPickup,
  }) : super(isPickupAddress: isPickup);

  @override
  List<Object> get props => [...super.props, phone];
}

class FetchAddress extends AddressFormEvent {
  final String area;
  final String street;
  FetchAddress({
    required this.area,
    required this.street,
    required bool isPickup,
  }) : super(isPickupAddress: isPickup);

  @override
  List<Object> get props => [...super.props, area];
}