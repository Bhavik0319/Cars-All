import 'package:cars_and_alll/app/data/api/api_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {

  List<String> paymentInitialComponent = [
    'Car Price',
    'Registration',
    'Insurance',
    'Accessories',
  ];

  List<String> paymentInitialComponentAmount = [
    '₹45,00,000',
    '₹1,25,000',
    '₹85,000',
    '₹45,000',
  ];
  List<String> allPaymentMethods = [
    'Select payment method',
    'Payment Method 1',
    'Payment Method 2',
    'Payment Method 3',
  ];
  RxString paymentMethod = 'Select payment method'.obs;


  PageController paymentMethodPageController = PageController(viewportFraction: 0.8, initialPage: 0);

  RxInt paymentMethodIndex = 0.obs;

  void changePaymentMethod(val) {
    paymentMethod.value = val;
  }

  void changePaymentMethodPageIndex(index) {
    paymentMethodIndex.value = index;
  }

}