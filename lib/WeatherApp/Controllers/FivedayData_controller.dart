// ignore_for_file: invalid_use_of_protected_member

import 'dart:async';

import 'package:get/get.dart';
import 'package:weather/WeatherApp/Controllers/geo_location_controller.dart';
import 'package:weather/WeatherApp/Helper/http_helper.dart';

const weatherAPIUrl = 'https://api.openweathermap.org/data/2.5/forecast';

class FiveDayData extends GetxController {
  StreamSubscription<LocationController>? streamSubscription;

  RxList fiveDaysHour = [].obs;
  RxList fiveDaysMinute = [].obs;
  RxList fiveDaysIcon = [].obs;
  RxList fiveDaysTemp = [].obs;

  RxInt minute = 00.obs;
  RxInt hour = 00.obs;
  RxString icon = ''.obs;
  RxDouble temp = 0.0.obs;

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

    var fivedayForecast = await networkHelper.getData();

    for (int i = 0; i <= 39; i++) {
      hour.value = DateTime.fromMillisecondsSinceEpoch(
              fivedayForecast['list'][i]['dt'] * 1000)
          .hour;
      minute.value = DateTime.fromMillisecondsSinceEpoch(
              fivedayForecast['list'][i]['dt'] * 1000)
          .minute;
      temp.value = fivedayForecast['list'][i]['main']['temp'] + 0.0;
      icon.value =
          '${"http://openweathermap.org/img/w/" + fivedayForecast['list'][i]['weather'][0]['icon']}.png';

      fiveDaysHour.value.add(hour.value);
      fiveDaysMinute.value.add(minute.value);
      fiveDaysIcon.value.add(icon.value);
      fiveDaysTemp.value.add(temp.value);
      update();
    }
  }
}
