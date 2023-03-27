part of 'address_form_bloc.dart';

abstract class AddressFormState extends Equatable {
  const AddressFormState();
  
  @override
  List<Object> get props => [];
}

class AddressFormInitial extends AddressFormState {}
class PickupAddressFetched extends AddressFormState {
  final String area;
  final String street;
  PickupAddressFetched({
    required this.area,
    required this.street,
  });

  @override
  List<Object> get props => [area, street];
}

class DropoffAddressFetched extends AddressFormState {
  final String area;
  final String street;
  DropoffAddressFetched({
    required this.area,
    required this.street,
  });

  @override
  List<Object> get props => [...super.props, area];
}