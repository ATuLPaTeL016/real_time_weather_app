// ignore_for_file: invalid_use_of_protected_member


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/WeatherApp/Controllers/FivedayData_controller.dart';

class FivedayDataWidget extends StatefulWidget {
  const FivedayDataWidget({Key? key}) : super(key: key);

  @override
  State<FivedayDataWidget> createState() => _FivedayDataWidgetState();
}

class _FivedayDataWidgetState extends State<FivedayDataWidget> {
  final FiveDayData _fivedaysController = Get.put(FiveDayData());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          alignment: Alignment.topCenter,
          child: const Text(
            'Five Days Weather Data',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
        Container(
          height: 190,
          padding:
              const EdgeInsets.only(top: 10, bottom: 10),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 40,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  width: 130,
                  decoration: BoxDecoration(
                      color: Colors.black12, borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${_fivedaysController.fiveDaysHour.value[index]}:',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '${_fivedaysController.fiveDaysMinute.value[index]}',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: Image.network(
                          '${_fivedaysController.fiveDaysIcon.value[index]}',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Text(
                          '${_fivedaysController.fiveDaysTemp.value[index].toInt()}°C',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
