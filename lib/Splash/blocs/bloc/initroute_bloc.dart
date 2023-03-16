import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:moving_app/Utils/services/service_locator.dart';

part 'initroute_event.dart';
part 'initroute_state.dart';

class InitrouteBloc extends Bloc<InitrouteEvent, InitrouteState> {
  InitrouteBloc() : super(InitrouteInitial()) {
    final Connectivity connectivity = locator.get<Connectivity>();
    // final AccountRepository accoountRepository =
    //     locator.get<AccountRepository>();
    on<InitrouteEvent>((event, emit) async {
      final connStatus = await connectivity.checkConnectivity();
      if (event is UserCheckEvent) {
        if (connStatus != ConnectivityResult.none) {
          // await accoountRepository.tokenCheck().then((value) {
          //   if (value == null) {
               emit(InitrouteNoToken());
          //   } else {
          //     if (value) {
          //       emit(InitrouteValidToken());
          //     } else {
          //       emit(InitrouteInValidToken());
          //     }
          //   }
          // }).onError((error, stackTrace) {
          //   emit(InitrouteError());
          // });
        } else
          emit(InitrouteNoInternet());
      }
    });
  }
}
