import 'package:equatable/equatable.dart';

class FormAddress extends Equatable {
  final String name;
  final String area;
  final String street;
  final String building;
  final String floor;
  final String otherDetails;
  final String phoneNumber;

  FormAddress({
    required this.name,
    required this.area,
    required this.street,
    required this.building,
    required this.floor,
     this.otherDetails = '',
    required this.phoneNumber,
  });

  FormAddress copyWith({

    String? name,
    String? area,
    String? street,
    String? building,
    String? floor,
    String? otherDetails,
    String? phoneNumber,
  }) {
    return FormAddress(
      name: name ?? this.name,
      area: area ?? this.area,
      street: street ?? this.street,
      building: building ?? this.building,
      floor: floor ?? this.floor,
      otherDetails: otherDetails ?? this.otherDetails,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
  
  @override
  List<Object?> get props => [name, area, street, building, floor, otherDetails, phoneNumber];
}