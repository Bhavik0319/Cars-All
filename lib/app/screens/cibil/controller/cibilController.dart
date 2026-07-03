
import 'package:cars_and_alll/app/screens/cibil/model/chartData.dart';
import 'package:flutter/cupertino.dart';

class CibilController with ChangeNotifier {

  bool agreeTerms = false;
  bool enterVehicleDetailsAgreeTerms = false;
  final List<ChartData> chartData = [
    ChartData(xAxis: 'Nov',yAxis: 350),
    ChartData(xAxis: 'Dec',yAxis: 450),
    ChartData(xAxis: 'Jan',yAxis: 550),
    ChartData(xAxis: 'Feb',yAxis: 650),
    ChartData(xAxis: 'Mar',yAxis: 750),
  ];
  void updateTermsConditions(bool val) {
    agreeTerms = val;
    notifyListeners();
  }

  void updateEnterVehicleDetailsAgreeTerms(bool val) {
    enterVehicleDetailsAgreeTerms = val;
    notifyListeners();
  }



}