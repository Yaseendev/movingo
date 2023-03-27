import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moving_app/Order/data/models/form_address.dart';

part 'address_form_event.dart';
part 'address_form_state.dart';

class AddressFormBloc extends Bloc<AddressFormEvent, AddressFormState> {
  FormAddress pickupFormAddress = FormAddress(
    name: '',
    area: '',
    street: '',
    building: '',
    floor: '',
    phoneNumber: '',
  );
  FormAddress dropOffFormAddress = FormAddress(
    name: '',
    area: '',
    street: '',
    building: '',
    floor: '',
    phoneNumber: '',
  );
  AddressFormBloc() : super(AddressFormInitial()) {
    on<FetchAddress>((event, emit) {
      if (event.isPickupAddress) {
        if (event.area.isNotEmpty)
          pickupFormAddress = pickupFormAddress.copyWith(area: event.area);
        if (event.street.isNotEmpty)
          pickupFormAddress = pickupFormAddress.copyWith(street: event.street);
        emit(PickupAddressFetched(
          area: event.area,
          street: event.street,
        ));
      } else {
        dropOffFormAddress = dropOffFormAddress.copyWith(
          area: event.area.isNotEmpty ? event.area : null,
          street: event.street.isEmpty ? null : event.street,
        );
        emit(DropoffAddressFetched(
          area: event.area,
          street: event.street,
        ));
      }
    });

    on<SetName>((event, emit) => event.isPickupAddress ? pickupFormAddress = pickupFormAddress.copyWith(name: event.name) : dropOffFormAddress = dropOffFormAddress.copyWith(name: event.name));
    on<SetArea>((event, emit) => event.isPickupAddress ? pickupFormAddress = pickupFormAddress.copyWith(area: event.area) : dropOffFormAddress = dropOffFormAddress.copyWith(area: event.area));
    on<SetBuilding>((event, emit) => event.isPickupAddress ? pickupFormAddress = pickupFormAddress.copyWith(building: event.building) : dropOffFormAddress = dropOffFormAddress.copyWith(building: event.building));
    on<SetStreet>((event, emit) => event.isPickupAddress ? pickupFormAddress = pickupFormAddress.copyWith(street: event.street) : dropOffFormAddress = dropOffFormAddress.copyWith(street: event.street));
    on<SetFloor>((event, emit) => event.isPickupAddress ? pickupFormAddress = pickupFormAddress.copyWith(floor: event.floor) : dropOffFormAddress = dropOffFormAddress.copyWith(floor: event.floor));
    on<SetOther>((event, emit) => event.isPickupAddress ? pickupFormAddress = pickupFormAddress.copyWith(otherDetails: event.other) : dropOffFormAddress = dropOffFormAddress.copyWith(otherDetails: event.other));
    on<SetPhone>((event, emit) => event.isPickupAddress ? pickupFormAddress = pickupFormAddress.copyWith(phoneNumber: event.phone) : dropOffFormAddress = dropOffFormAddress.copyWith(phoneNumber: event.phone));
  }
}
