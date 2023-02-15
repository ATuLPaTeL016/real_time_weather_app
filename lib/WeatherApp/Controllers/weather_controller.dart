
import 'dart:async';

import 'package:get/get.dart';
import 'package:weather/WeatherApp/Controllers/geo_location_controller.dart';
import 'package:weather/WeatherApp/Helper/http_helper.dart';

const weatherAPIUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel extends GetxController {
  StreamSubscription<LocationController>? streamSubscription;
  RxBool isLoading = true.obs;

  RxString weatherMain = 'Weather'.obs;
  RxString weatherDescription = 'Weather Description'.obs;
  RxString icon = 'Icon'.obs;

  RxDouble temperature = 0.0.obs;
  RxDouble minTemp = 0.0.obs;
  RxDouble maxTemp = 0.0.obs;
  RxDouble pressure = 0.0.obs;
  RxDouble humidity = 0.0.obs;
  RxDouble clouds = 0.0.obs;
  RxDouble sea_level = 0.0.obs;
  RxDouble visibility = 0.0.obs;
  RxDouble wind = 0.0.obs;

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
    _locationContro.streamSubscription!.cancel();
  }

  Future<dynamic> getLocationWeather(double latitude, double longitude) async {
    NetworkData networkHelper = NetworkData(
        '$weatherAPIUrl?lat=$latitude&lon=$longitude&appid=2555bbf0db6f9428087e920bc77fc685&units=metric');

    var weatherData = await networkHelper.getData();

    weatherMain.value = weatherData['weather'][0]['main'];
    weatherDescription.value = weatherData['weather'][0]['description'];
    icon.value = "http://openweathermap.org/img/w/" +
        weatherData['weather'][0]['icon'] +
        '.png';

    temperature.value = weatherData['main']['temp'] + 0.0;
    minTemp.value = weatherData['main']['temp_min'] + 0.0;
    maxTemp.value = weatherData['main']['temp_max'] + 0.0;
    pressure.value = weatherData['main']['pressure'] + 0.0;
    humidity.value = weatherData['main']['humidity'] + 0.0;
    visibility.value = weatherData['visibility'] + 0.0;
    wind.value = weatherData['wind']['speed'] + 0.0;
  }
}
