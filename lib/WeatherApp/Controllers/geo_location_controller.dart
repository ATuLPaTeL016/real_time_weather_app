import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  RxDouble latitute = 0.0.obs;
  RxDouble longitute = 0.0.obs;
  var address = 'Get Address...'.obs;
  StreamSubscription<Position>? streamSubscription;

  @override
  void onInit() async {
    super.onInit();
    getLocation();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    streamSubscription!.cancel();
  }

  getLocation() async {
    bool serviceEnabaled;

    LocationPermission permission;
    serviceEnabaled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabaled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location services are disabled.');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
      latitute.value = position.latitude;
      longitute.value = position.longitude;
      getAddressFromLatLang(position);
    });
  }

  Future<void> getAddressFromLatLang(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    address.value = '${place.locality}';

    update();
  }
}
