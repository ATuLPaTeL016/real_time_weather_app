import 'package:get/get.dart';
import 'dart:async';

import 'package:weather/WeatherApp/Controllers/geo_location_controller.dart';
import 'package:weather/WeatherApp/Helper/http_helper.dart';

const pollutionAPIUrl = 'http://api.openweathermap.org/data/2.5/air_pollution';

class AirPollution extends GetxController {
  StreamSubscription<LocationController>? streamSubscription;
  RxInt aqi = 0.obs;

  RxDouble co = 0.0.obs;
  RxDouble no = 0.0.obs;
  RxDouble no2 = 0.0.obs;
  RxDouble o3 = 0.0.obs;
  RxDouble so2 = 0.0.obs;
  RxDouble nh3 = 0.0.obs;
  RxDouble pm10 = 0.0.obs;

  final LocationController _locationContro = Get.put(LocationController());

  @override
  void onInit() async {
    super.onInit();
    _locationContro.getLocation();
    getLocationWeather(
      _locationContro.latitute.value,
      _locationContro.longitute.value,
    );
  }

  @override
  void onClose() {
    super.onClose();
    _locationContro.streamSubscription!.cancel();
  }

  Future<dynamic> getLocationWeather(double latitude, double longitude) async {
    NetworkData networkHelper = NetworkData(
        '$pollutionAPIUrl?lat=$latitude&lon=$longitude&appid=2555bbf0db6f9428087e920bc77fc685&units=metric');

    var pollutoinData = await networkHelper.getData();
    print(pollutoinData);

    aqi.value = pollutoinData['list'][0]['main']['aqi'] + 0;
    co.value = pollutoinData['list'][0]['components']['co'] + 0.0;
    no.value = pollutoinData['list'][0]['components']['no'] + 0.0;
    no2.value = pollutoinData['list'][0]['components']['no2'] + 0.0;
    o3.value = pollutoinData['list'][0]['components']['o3'] + 0.0;
    so2.value = pollutoinData['list'][0]['components']['so2'] + 0.0;
    nh3.value = pollutoinData['list'][0]['components']['nh3'] + 0.0;
    pm10.value = pollutoinData['list'][0]['components']['pm10'] + 0.0;
  }

}
