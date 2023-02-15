// import 'dart:async';
// import 'package:get/get.dart';
// import 'package:weather_app/WeatherApp/Controller/geo_location_controller.dart';
// import 'package:weather_app/WeatherApp/Helper/http_helper.dart';
//
//
// const hourlyAPIUrl = 'https://pro.openweathermap.org/data/2.5/forecast/hourly';
//
// class HourlyData extends GetxController {
//   StreamSubscription<LocationController>? streamSubscription;
//
//   RxInt dt = 0.obs;
//   RxDouble temperature = 0.0.obs;
//   RxString icon = 'Icon'.obs;
//
//   final LocationController _locationContro = Get.put(LocationController());
//
//   @override
//   void onInit() async {
//     super.onInit();
//     _locationContro.getLocation();
//     getLocationWeather(
//       _locationContro.latitute.value,
//       _locationContro.longitute.value,
//     );
//   }
//
//   @override
//   void onClose() {
//     super.onClose();
//     _locationContro.streamSubscription!.cancel();
//   }
//
//   Future<dynamic> getLocationWeather(double latitude, double longitude) async {
//     NetworkData networkHelper = NetworkData(
//         '$hourlyAPIUrl?lat={lat}&lon={lon}&appid=2555bbf0db6f9428087e920bc77fc685&units=metric');
//
//     var hourlyData = await networkHelper.getData();
//     print(hourlyData);
//
//     dt.value = hourlyData['list']['dt'] + 0.0;
//     temperature.value = hourlyData['list']['main']['temp'] + 0.0;
//     icon.value = hourlyData['list']['weather']['icon'] + 0.0;
//   }
// }
