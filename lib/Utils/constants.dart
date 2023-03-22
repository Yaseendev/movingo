import 'package:flutter/material.dart';

class AppColors {
  static const Color PRIMARY_COLOR = Color(0xFFf7dda4);
  static const Color BG_COLOR = Color(0xFF464d5c);
  // ignore: non_constant_identifier_names
  static final MaterialColor PRIMARY_SWATCH =
      MaterialColor(BG_COLOR.value, <int, Color>{
    50: PRIMARY_COLOR,
    100: PRIMARY_COLOR,
    200: PRIMARY_COLOR,
    300: PRIMARY_COLOR,
    400: PRIMARY_COLOR,
    500: PRIMARY_COLOR,
    600: PRIMARY_COLOR,
    700: PRIMARY_COLOR,
    800: PRIMARY_COLOR,
    900: PRIMARY_COLOR,
  });
}

class Urls {
  // static const String DOMAIN = 'https://fashion.almotawer.net';
  static const String LOCATION_DOMAIN = 'https://eu1.locationiq.com';
  static const String LOCATION_BASE_API = LOCATION_DOMAIN + '/v1';
  // static const String BASE_API = DOMAIN + '/wp-json/woo';

  ///Location Urls
  static const String LOCATION_AUTOCOMPLETE =
      '$LOCATION_BASE_API/autocomplete.php';
  static const String LOCATION_REVERSE = '$LOCATION_BASE_API/reverse.php';
}

const String locationKey = 'pk.0b821f869258d4129c196400ab4927f0';

class Images {
  static const String IMAGES_BASE_URI = 'assets/images/';
  static const String INTRO1 = IMAGES_BASE_URI + 'intro1.png';
  static const String INTRO2 = IMAGES_BASE_URI + 'intro2.png';
  static const String INTRO3 = IMAGES_BASE_URI + 'intro3.png';
  static const String LOGO = IMAGES_BASE_URI + 'logo.png';
  static const String LOGO_TRANSPARENT = IMAGES_BASE_URI + 'logo_transparent.png';
}

// class Boxes {
//   static Future<Box<User>> getUserBox() async {
//     if (Hive.isBoxOpen('userBox'))
//       return Hive.box<User>('userBox');
//     else
//       return await Hive.openBox<User>('userBox');
//   }

//   static Future<Box<String>> getSearchBox() async {
//     if (Hive.isBoxOpen('searchHistory'))
//       return Hive.box<String>('searchHistory');
//     else
//       return await Hive.openBox<String>('searchHistory');
//   }
// }

enum PaymentMethod { cash, creditCard }
