import 'package:bloc/bloc.dart';
import 'package:moving_app/Order/data/models/form_address.dart';

class AddressFormCubit extends Cubit<FormAddress> {
  AddressFormCubit()
      : super(FormAddress(
          name: '',
          area: '',
          street: '',
          building: '',
          floor: '',
          phoneNumber: '',
        ));

  void setName(String name) => emit(state.copyWith(name: name));
  void setArea(String area) => emit(state.copyWith(area: area));
  void setBuilding(String building) => emit(state.copyWith(building: building));
  void setStreet(String street) => emit(state.copyWith(street: street));
  void setFloor(String floor) => emit(state.copyWith(floor: floor));
  void setOther(String other) => emit(state.copyWith(otherDetails: other));
  void setPhone(String phone) => emit(state.copyWith(phoneNumber: phone));
}
