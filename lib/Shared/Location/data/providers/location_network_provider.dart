import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moving_app/Utils/constants.dart';
import 'package:moving_app/Utils/services/api_service.dart';

class LocationNetworkProvider extends ApiService {
  LocationNetworkProvider(Dio dio) : super(dio);
  
    Future<List<dynamic>> searchLocation(String text) async {
    Response response = await dio.get(
      Urls.LOCATION_AUTOCOMPLETE,
      options: Options(
        contentType: 'application/json',
      ),
      queryParameters: {
        'q': text,
        'key': locationKey,
      },
      //cancelToken: cancelToken,
    );
    return response.data;
  }

    Future<Map<String, dynamic>?> reverseGeoLocation(LatLng location, [CancelToken? cToken]) async {
    Response response = await dio.get(
      Urls.LOCATION_REVERSE,
      queryParameters: {
        'lat': location.latitude,
        'lon': location.longitude,
        //'countrycodes': 'eg',
        'key': locationKey,
        'format': 'json',
      },
      options: Options(
        contentType: 'application/json',
      ),
      cancelToken: cToken,
    );
    return response.data;
  }

  @override
  String getErrorMsg(Object error) {
    return '';
  }
}
