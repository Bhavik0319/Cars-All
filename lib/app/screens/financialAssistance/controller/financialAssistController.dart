import 'package:cars_and_alll/app/data/api/api_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FinancialAssistController extends GetxController {

  RxInt stepperIndex = 1.obs;

  RxString vehicleType = 'Vehicle 1'.obs;

  List<String> allVehicleType = [
    'Vehicle 1',
    'Vehicle 2',
    'Vehicle 3',

  ];

  Rx<bool> agreeTerms = false.obs;

  List<String> financialAssistComponent = [
    'Loan Type',
    'Loan Amount',
    'Submitted on',
    'Application ID',
  ];

  List<String> financialAssistComponentValues = [
    'Vehicle Loan',
    '₹ 7,19,000',
    '30-MAY-2025',
    'VLOAN2025-8937',
  ];
  void changeStepperIndex({int? val}) {
    if (val == null) {
      if (stepperIndex.value < 3) {
        stepperIndex.value = stepperIndex.value + 1;
      } else if (stepperIndex.value == 3) {
        ///TODO Submit functionality
      }
    } else {
      stepperIndex.value = val;
    }
  }

  void changeVehicleType(String s) {
    vehicleType.value = s;
  }

  void updateTermsConditions(val) {
    agreeTerms.value = val;
  }

}