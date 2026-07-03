
import 'dart:developer';

import 'package:cars_and_alll/app/screens/filter/enum/transmissionType.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterController extends GetxController{

  String filterCategory = "";

  FilterController({this.filterCategory = "cars"});

  TextEditingController rtoTextField = TextEditingController();
  TextEditingController searchFieldController = TextEditingController();

  ///Values which will change according to user selection
  RxInt currentTab = 0.obs;
  Rx<bool> isSelectAll = false.obs;
  RxBool isSearchEnable = false.obs;
  RxList<String> searchFields = <String>[].obs;

  RxList<String> selectedBrandName = <String>[].obs;
  RxList<String> selectedModelName = <String>[].obs;
  RxList<String> selectedBodyType = <String>[].obs;
  RxList<String> selectedFuelType = <String>[].obs;
  RxList<String> selectedNoOfOwner = <String>[].obs;
  RxList<String> selectedRtoCodes = <String>[].obs;
  RxList<String> selectedSittingCapacity = <String>[].obs;


  Rx<TransmissionType> transmissionType = TransmissionType.MANUAL.obs;
  Rx<SfRangeValues> priceRange = SfRangeValues(0, 1000000).obs;
  Rx<SfRangeValues> manufacturer = SfRangeValues(2000, DateTime.now().year).obs;
  Rx<SfRangeValues> kmDriven = SfRangeValues(0, 500000).obs;
  Rx<SfRangeValues> hoursOperator = SfRangeValues(0, 500000).obs;

  ///Values To Take From Backend
  List<dynamic> allBrandName = [];
  List<dynamic> allModelName = [];
  List<dynamic> allFuelType = [];
  List<String> allNoOfOwner = ["1st Owner", "2nd Owner", "3rd Owner", "4th Owner", "4+"];
  List<dynamic> allBodyType = [];
  List<dynamic> allSeatingCapacity = [];
  List<String> allRtoCodes = [
    "AN01 - Port Blair",
    "AP01 - Adilabad",
    "AP02 - Anantapur",
    "AP03 - Chittoor",
    "AP04 - Kadapa",
    "AP05 - East Godavari",
    "AP06 - Kakinada",
    "AP07 - Guntur",
    "AP08 - Krishna",
    "AP09 - Hyderabad Central",
    "AP10 - Hyderabad North",
    "AP11 - Hyderabad East",
    "AP12 - Hyderabad South",
    "AP13 - Hyderabad West",
    "AP14 - Karimnagar",
    "AP15 - Khammam",
    "AP16 - Nalgonda",
    "AP17 - Nellore",
    "AP18 - Nizamabad",
    "AP19 - Prakasam",
    "AP20 - Srikakulam",
    "AP21 - Visakhapatnam",
    "AP22 - Vizianagaram",
    "AP23 - West Godavari",
    "AP24 - Kurnool",
    "AP25 - Anantapur (Hindupur)",
    "AR01 - Itanagar",
    "AR02 - Itanagar",
    "AR03 - Tawang",
    "AR04 - Bomdila",
    "AR05 - Seppa",
    "AR06 - Ziro",
    "AR07 - Daporijo",
    "AR08 - Along",
    "AR09 - Pasighat",
    "AR10 - Anini",
    "AS01 - Guwahati",
    "AS02 - Nagaon",
    "AS03 - Jorhat",
    "AS04 - Sibsagar",
    "AS05 - Golaghat",
    "AS06 - Dibrugarh",
    "AS07 - Lakhimpur",
    "AS08 - Dima Hasao",
    "AS09 - Karbi Anglong",
    "AS10 - Karimganj",
    "AS11 - Cachar",
    "AS12 - Sonitpur",
    "AS13 - Darrang",
    "AS14 - Nalbari",
    "AS15 - Barpeta",
    "AS16 - Kokrajhar",
    "BR01 - Patna",
    "BR02 - Gaya",
    "BR03 - Bhojpur",
    "BR04 - Chapra",
    "BR05 - Motihari",
    "BR06 - Muzaffarpur",
    "BR07 - Darbhanga",
    "BR08 - Munger",
    "BR09 - Begusarai",
    "BR10 - Bhagalpur",
    "BR11 - Purnea",
    "BR12 - Katihar",
    "CG04 - Raipur",
    "CG05 - Durg",
    "CG07 - Bilaspur",
    "CH01 - Chandigarh",
    "DD01 - Daman",
    "DD02 - Diu",
    "DL01 - Delhi North",
    "DL02 - Delhi South",
    "DL03 - Delhi East",
    "DL04 - Delhi West",
    "DL05 - Delhi North East",
    "DL06 - Delhi Central",
    "DL07 - Delhi South East",
    "DL08 - Delhi North West",
    "DL09 - Delhi South West",
    "GA01 - Panaji",
    "GA02 - Margao",
    "GJ01 - Ahmedabad",
    "GJ02 - Mehsana",
    "GJ03 - Rajkot",
    "GJ04 - Bhavnagar",
    "GJ05 - Surat",
    "GJ06 - Vadodara",
    "GJ07 - Nadiad",
    "GJ08 - Palanpur",
    "GJ09 - Himmatnagar",
    "GJ10 - Jamnagar",
    "GJ11 - Junagadh",
    "GJ12 - Bhuj",
    "GJ13 - Surendranagar",
    "HR01 - Ambala",
    "HR02 - Yamunanagar",
    "HR03 - Panchkula",
    "HR04 - Naraingarh",
    "HR05 - Karnal",
    "HR06 - Panipat",
    "HR07 - Kurukshetra",
    "HR08 - Kaithal",
    "HR09 - Guhla",
    "HR10 - Sonepat",
    "HR11 - Gohana",
    "HR12 - Rohtak",
    "HR13 - Bahadurgarh",
    "HR14 - Jhajjar",
    "HR15 - Meham",
    "HP01 - Shimla",
    "HP02 - Shimla",
    "HP03 - Shimla",
    "HP04 - Dharamshala",
    "HP05 - Mandi",
    "HP06 - Rampur",
    "JK01 - Srinagar",
    "JK02 - Jammu",
    "JK03 - Anantnag",
    "JK04 - Budgam",
    "JK05 - Baramulla",
    "JK06 - Doda",
    "JK07 - Kargil",
    "JK08 - Leh",
    "KA01 - Bangalore Central",
    "KA02 - Bangalore West",
    "KA03 - Bangalore East",
    "KA04 - Bangalore North",
    "KA05 - Bangalore South",
    "KA06 - Tumkur",
    "KA07 - Kolar",
    "KA08 - KGF",
    "KA09 - Mysuru",
    "KA10 - Chamrajnagar",
    "KL01 - Thiruvananthapuram",
    "KL02 - Kollam",
    "KL03 - Pathanamthitta",
    "KL04 - Alappuzha",
    "KL05 - Kottayam",
    "KL06 - Idukki",
    "KL07 - Ernakulam",
    "KL08 - Thrissur",
    "KL09 - Palakkad",
    "KL10 - Malappuram",
    "KL11 - Kozhikode",
    "KL12 - Wayanad",
    "KL13 - Kannur",
    "KL14 - Kasaragod",
    "MH01 - Mumbai Central",
    "MH02 - Mumbai West",
    "MH03 - Mumbai East",
    "MH04 - Thane",
    "MH05 - Kalyan",
    "MH06 - Raigad",
    "MH07 - Sindhudurg",
    "MH08 - Ratnagiri",
    "MH09 - Kolhapur",
    "MH10 - Sangli",
    "MH11 - Satara",
    "MH12 - Pune",
    "MH13 - Solapur",
    "MH14 - Pimpri Chinchwad",
    "MH15 - Nashik",
    "MH16 - Ahmednagar",
    "MH17 - Shrirampur",
    "MH18 - Dhule",
    "MH19 - Jalgaon",
    "MH20 - Aurangabad",
    "MH21 - Jalna",
    "MH22 - Parbhani",
    "MH23 - Beed",
    "MH24 - Latur",
    "MH25 - Osmanabad",
    "MH26 - Nanded",
    "MH27 - Amravati",
    "MH28 - Buldhana",
    "MH29 - Yavatmal",
    "MH30 - Akola",
    "MH31 - Nagpur",
    "MH32 - Wardha",
    "MH33 - Gadchiroli",
    "MH34 - Chandrapur",
    "MH35 - Gondia",
    "MH36 - Bhandara",
    "MH37 - Washim",
    "MH38 - Hingoli",
    "MH39 - Nandurbar"
  ].obs;

  List<dynamic> allTransmissionTypes = [];
  List<int> rangeManufacturer = [1950, DateTime.now().year];
  List<int> rangeKmDriven = [0, 10000000];
  List<int> availablePriceRange = [0, 10000000];
  List<int> hoursOperatorRange = [0, 1000000];

  @override
  void onInit() {
    super.onInit();
    allBrandName = mockFilterData[filterCategory]?["brands"]!.map((e) => e["brand"]).toList()?? [];
    allFuelType = mockFilterData[filterCategory]?["fuelTypes"]?? [];
    allBodyType = mockFilterData[filterCategory]?["bodyTypes"]?? [];
    allSeatingCapacity = mockFilterData[filterCategory]!["seatingCapacities"]?? [];
    allTransmissionTypes = mockFilterData[filterCategory]!["transmissionTypes"]?? [];
    searchFields.value = [...allRtoCodes];
  }

  Map<String, dynamic> mockFilterData = {
    "cars": {
      "brands": [
        { "brand": "Maruti Suzuki", "models": ["Swift", "WagonR", "Baleno", "Brezza"] },
        { "brand": "Hyundai", "models": ["i10 Grand", "i20 Elite", "Creta", "Venue"] },
        { "brand": "Tata", "models": ["Nexon", "Punch", "Tiago", "Harrier"] },
        { "brand": "Mahindra", "models": ["Thar", "Scorpio-N", "XUV700", "Bolero"] },
        { "brand": "Toyota", "models": ["Fortuner", "Innova Crysta", "Glanza"] },
      ],
      "fuelTypes": ["Petrol", "Diesel", "CNG"],
      "transmissionTypes": ["Manual", "Automatic"],
      "bodyTypes": ["Hatchback", "SUV", "Sedan", "MUV"],
      "seatingCapacities": ["5", "7"],
    },
    "bikes": {
      "brands": [
        { "brand": "Hero", "models": ["Splendor Plus", "Passion Pro"] },
        { "brand": "Honda", "models": ["Shine", "Unicorn"] },
        { "brand": "Royal Enfield", "models": ["Classic 350", "Himalayan"] },
      ],
      "fuelTypes": ["Petrol"],
      "transmissionTypes": ["Manual", "Automatic (Scooter)"],
      "bodyTypes": ["Commuter", "Sports", "Cruiser"],
      "seatingCapacities": ["2"],
    },
    "ev": {
      "brands": [
        { "brand": "Tata", "models": ["Nexon EV", "Tiago EV"] },
        { "brand": "Ather", "models": ["450X"] },
      ],
      "fuelTypes": ["Electric"],
      "transmissionTypes": ["Automatic"],
      "bodyTypes": ["SUV", "Scooter"],
      "seatingCapacities": ["2", "5", "7"],
    },
    "commercial": {
      "brands": [
        { "brand": "Tata Motors", "models": ["Ace Gold", "Intra"] },
        { "brand": "Ashok Leyland", "models": ["Dost"] },
      ],
      "fuelTypes": ["Diesel", "CNG"],
      "transmissionTypes": ["Manual"],
      "bodyTypes": ["Truck", "Bus", "LCV"],
      "seatingCapacities": ["2", "20", "40"],
    },
    "machinery": {
      "brands": [
        { "brand": "Tata Motors", "models": ["Ace Gold", "Intra"] },
        { "brand": "Ashok Leyland", "models": ["Dost"] },
      ],
      "fuelTypes": ["Diesel", "CNG"],
      "transmissionTypes": ["Manual"],
      "bodyTypes": ["Truck", "Bus", "LCV"],
      "seatingCapacities": ["2", "20", "40"],
    },
  };



  void changeFilterTab(int i) {
    currentTab.value = i;
    checkSelectAll();
  }

  void checkSelectAll() {
    switch(currentTab.value) {
      case 0:
        if(allBrandName.length == selectedBrandName.length && allBrandName.isNotEmpty){
          isSelectAll.value = true;
        }else {
          isSelectAll.value = false;
        }
        break;
      case 1:
        if(allModelName.length == selectedModelName.length && allModelName.isNotEmpty){
          isSelectAll.value = true;
        }else {
          isSelectAll.value = false;
        }
        break;
      case 2:
        if(allBodyType.length == selectedBodyType.length && allBodyType.isNotEmpty){
          isSelectAll.value = true;
        }else {
          isSelectAll.value = false;
        }
        break;
      case 4:
        if(allFuelType.length == selectedFuelType.length && allFuelType.isNotEmpty){
          isSelectAll.value = true;
        }else {
          isSelectAll.value= false;
        }
        break;
      case 8:
        if(allNoOfOwner.length == selectedNoOfOwner.length && allNoOfOwner.isNotEmpty){
          isSelectAll.value = true;
        }else {
          isSelectAll.value = false;
        }
        break;
      case 7:
        if(allRtoCodes.length == selectedRtoCodes.length && allRtoCodes.isNotEmpty){
          isSelectAll.value = true;
        }else {
          isSelectAll.value = false;
        }
        break;
      case 10:
        if(allSeatingCapacity.length == selectedSittingCapacity.length && allSeatingCapacity.isNotEmpty){
          isSelectAll.value = true;
        }else {
          isSelectAll.value = false;
        }
        break;
      default: break;
    }
  }

  String getHintText() {
    switch(currentTab.value){
      case 0: return 'Search Brands';
      case 1: return 'Search Models';
      case 2: return 'Search Variants';
      case 4: return 'Search Fuel Type';
      case 7: return 'Search RTO, eg: MH-12 or Pune';
      default: return '';
    }
  }

  void selectAllTrigger() {
    List options = getCurrentTabOptions();
    if(!isSelectAll.value){
      for (var option in options) {
        selectCheckBoxOption(option);
        if(currentTab.value == 0){
          addEligibleModelChoice();
        }
      }
      isSelectAll.value = true;
    } else {
      for (var option in options) {
        unSelectCheckBoxOption(option);
        if(currentTab.value == 0){
          removeEligibleModelChoice(option);
        }
      }
      isSelectAll.value = false;
    }
  }

  void clearSelectedOptionsList(){
    switch(currentTab.value) {
      case 0:
        selectedBrandName.value.clear();
        selectedBrandName.refresh();
        break;
      case 1:
        selectedModelName.value.clear();
        break;
      case 2:
        selectedBodyType.value.clear();
        break;
      case 4:
        selectedFuelType.value.clear();
        break;
      case 7:
        selectedRtoCodes.value.clear();
        break;
      case 8:
        selectedNoOfOwner.value.clear();
        break;
      case 10:
        selectedSittingCapacity.value.clear();
        break;
      default: break;
    }
  }

  List<dynamic> getCurrentTabOptions() {
    switch(currentTab.value) {
      case 0: return allBrandName;
      case 1: return allModelName;
      case 2: return allBodyType;
      case 4: return allFuelType;
      case 7: return allRtoCodes;
      case 8: return allNoOfOwner;
      case 10: return allSeatingCapacity;
      default: return [];
    }
  }

  void selectCheckBoxOption(option) {
    switch(currentTab.value) {
      case 0:
        if(!selectedBrandName.value.any((e) => e == option)){
          selectedBrandName.value.add(option);
          selectedBrandName.refresh();
        }
        break;
      case 1:
        if(!selectedModelName.value.any((e) => e == option)){
          selectedModelName.value.add(option);
          selectedModelName.refresh();
        }
        break;
      case 2:
        if(!selectedBodyType.value.any((e) => e == option)){
          selectedBodyType.value.add(option);
          selectedBodyType.refresh();
        }
        break;
      case 4:
        if(!selectedFuelType.value.any((e) => e == option)){
          selectedFuelType.value.add(option);
          selectedFuelType.refresh();
        }
        break;
      case 7:
        if(!selectedRtoCodes.value.any((e) => e == option)){
          selectedRtoCodes.value.add(option);
          selectedRtoCodes.refresh();
        }
        break;
      case 8:
        if(!selectedNoOfOwner.value.any((e) => e == option)){
          selectedNoOfOwner.value.add(option);
          selectedNoOfOwner.refresh();
        }
        break;
      case 10:
        if(!selectedSittingCapacity.value.any((e) => e == option)){
          selectedSittingCapacity.value.add(option);
          selectedSittingCapacity.refresh();
        }
        break;
      default: break;
    }
  }

  bool checkPresentOrNot(option) {
    switch(currentTab.value) {
      case 0: return selectedBrandName.value.any((e) => e == option);
      case 1: return selectedModelName.value.any((e) => e == option);
      case 2: return selectedBodyType.value.any((e) => e == option);
      case 4: return selectedFuelType.value.any((e) => e == option);
      case 7: return selectedRtoCodes.value.any((e) => e == option);
      case 8: return selectedNoOfOwner.value.any((e) => e == option);
      case 10: return selectedSittingCapacity.value.any((e) => e == option);
      default: return false;
    }
  }

  void unSelectCheckBoxOption(option) {
    switch(currentTab.value) {
      case 0:
        selectedBrandName.value.removeWhere((e) => e == option);
        selectedBrandName.refresh();
        break;
      case 1:
        selectedModelName.value.removeWhere((e) => e == option);
        selectedModelName.refresh();
        break;
      case 2:
        selectedBodyType.value.removeWhere((e) => e == option);
        selectedBodyType.refresh();
        break;
      case 4:
        selectedFuelType.value.removeWhere((e) => e == option);
        selectedFuelType.refresh();
        break;
      case 7:
        selectedRtoCodes.value.removeWhere((e) => e == option);
        selectedRtoCodes.refresh();
        break;
      case 8:
        selectedNoOfOwner.value.removeWhere((e) => e == option);
        selectedNoOfOwner.refresh();
        break;
      case 10:
        selectedSittingCapacity.value.removeWhere((e) => e == option);
        selectedSittingCapacity.refresh();
        break;
      default: break;
    }
  }

  void updateManufacturerRange(SfRangeValues values) {
    manufacturer.value = values;
    
  }

  void updateKmDrivenRange(SfRangeValues values) {
    kmDriven.value = values;
  }


  void updateHoursOperatorRange(SfRangeValues values) {
    hoursOperator.value = values;
  }

  void updatePriceRange(SfRangeValues values) {
    priceRange.value = values;
    
  }

  void updateTransmissionSelection(TransmissionType t) {
    transmissionType.value = t;
    
  }

  void rtoSearch() {
    searchFields.clear();
    if(rtoTextField.text.isNotEmpty){
      isSearchEnable.value = true;
      for (var element in allRtoCodes){
        if(element.toLowerCase().startsWith(rtoTextField.text.toLowerCase())){
          print(element);
          searchFields.add(element);
        }
      }
      searchFields.refresh();
    } else {
      isSearchEnable.value = false;
      searchFields.value = [...allRtoCodes];
      searchFields.refresh();
    }
  }

  addEligibleModelChoice() {
    allModelName.clear();
    for(var brands in mockFilterData[filterCategory]["brands"]){
      log(brands.toString());
      if(selectedBrandName.value.contains(brands["brand"])){
        log(brands["models"].toString());
        allModelName.addAll(brands["models"]);
      }
    }
  }

  removeEligibleModelChoice(brandRemoved) {
    log(brandRemoved);
    for(var brands in mockFilterData[filterCategory]["brands"]){
      if(brands["brand"] == brandRemoved){
        for(var model in brands["models"]){
          allModelName.remove(model);
          selectedModelName.removeWhere((e) => e == model);
        }
      }
    }
  }

  clearAllFilter(){
    isSelectAll.value = false;
    isSearchEnable.value = false;
    searchFields.value.clear();

    selectedBrandName.value.clear();
    selectedModelName.value.clear();
    selectedBodyType.value.clear();
    selectedFuelType.value.clear();
    selectedNoOfOwner.value.clear();
    selectedRtoCodes.value.clear();
    selectedSittingCapacity.value.clear();
    rtoTextField.text = "";
    transmissionType.value = TransmissionType.MANUAL;
    priceRange.value = SfRangeValues(0, 1000000);
    manufacturer.value = SfRangeValues(2000, DateTime.now().year);
    kmDriven.value = SfRangeValues(0, 500000);
    hoursOperator.value = SfRangeValues(0, 500000);
  }
}