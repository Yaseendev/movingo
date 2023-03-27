import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moving_app/Utils/services/service_locator.dart';
import '../data/models/address.dart';
import '../data/repositories/location_repository.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    final Connectivity connectivity = locator.get<Connectivity>();
    final LocationRepository locationRepo = locator.get<LocationRepository>();
    CancelToken? cancelToken;
    on<DetectCurrentLocation>((event, emit) async {
      if (await connectivity.checkConnectivity() != ConnectivityResult.none) {
        emit(LocationLoading());
        try {
          cancelToken = CancelToken();
          final Position? position = await locationRepo.getCurrentPosition();
          if (position != null) {
            await locationRepo
                .getReversedGeoCode(
                    LatLng(position.latitude, position.longitude), cancelToken)
                .then((location) => location == null
                    ? emit(LocationError())
                    : emit(LocationDetected(currentLocation: location)))
                .onError((error, stackTrace) => emit(LocationError()));
          } else {
            emit(LocationError());
          }
        } catch (e) {
          emit(LocationError());
        }
      } else {
        emit(LocationError());
      }
    }, transformer: restartable());

    on<FetchLocationAddress>((event, emit) async {
      if (await connectivity.checkConnectivity() != ConnectivityResult.none) {
        cancelToken = CancelToken();
        await locationRepo
            .getReversedGeoCode(
                LatLng(event.location.latitude, event.location.longitude),
                cancelToken)
            .then((location) => location == null
                ? emit(LocationError())
                : emit(LocationFetched(currentLocation: location)))
            .onError((error, stackTrace) => emit(LocationError()));
      } else {
        emit(LocationError());
      }
      emit(LocationInitial());
    }, transformer: restartable());

    on<CancelLocationEvent>((event, emit) {
      cancelToken?.cancel();
      emit(LocationInitial());
    }, transformer: restartable());
  }
}
