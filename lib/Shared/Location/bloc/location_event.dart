// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class DetectCurrentLocation extends LocationEvent {
  @override
  List<Object> get props => [];
}

class FetchLocationAddress extends LocationEvent {
  final LatLng location;

  FetchLocationAddress({
    required this.location,
  });

  @override
  List<Object> get props => [location];
}

class CancelLocationEvent extends LocationEvent {
  @override
  List<Object> get props => [];
}
