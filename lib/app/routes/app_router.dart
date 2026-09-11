import 'package:cars_and_alll/app/bindings/authBinding.dart';
import 'package:cars_and_alll/app/bindings/chatBinding.dart';
import 'package:cars_and_alll/app/bindings/editProfileBinding.dart';
import 'package:cars_and_alll/app/bindings/myListingBinding.dart';
import 'package:cars_and_alll/app/bindings/postNewAddBinding.dart';
import 'package:cars_and_alll/app/bindings/profileBinding.dart';
import 'package:cars_and_alll/app/bindings/ratedSellerBinding.dart';
import 'package:cars_and_alll/app/bindings/recentlyViewBinding.dart';
import 'package:cars_and_alll/app/bindings/reelsBinding.dart';
import 'package:cars_and_alll/app/bindings/savedViewBinding.dart';
import 'package:cars_and_alll/app/screens/auth/signup/sign_up.dart';
import 'package:cars_and_alll/app/screens/car_details/call_user.dart';
import 'package:cars_and_alll/app/screens/chat/chatSpace/buyers_chat_space.dart';
import 'package:cars_and_alll/app/screens/chat/chatSpace/sellers_chat_space.dart';
import 'package:cars_and_alll/app/screens/cibil/cibilLandingScreen.dart';
import 'package:cars_and_alll/app/screens/faq_screen.dart';
import 'package:cars_and_alll/app/screens/financialAssistance/financialAssistanceLandingScreen.dart';
import 'package:cars_and_alll/app/screens/home/home_nav_screen.dart';
import 'package:cars_and_alll/app/screens/chat/chat_space_screen.dart';
import 'package:cars_and_alll/app/screens/home/views/myListingScreen.dart';
import 'package:cars_and_alll/app/screens/home/views/reels_screen.dart';
import 'package:cars_and_alll/app/screens/insurance/compareInsuranceQuote.dart';
import 'package:cars_and_alll/app/screens/onboarding/get_started.dart';
import 'package:cars_and_alll/app/screens/onboarding/select_kyc_mode.dart';
import 'package:cars_and_alll/app/screens/payment/addAddressScreen.dart';
import 'package:cars_and_alll/app/screens/payment/addressSelectionScreen.dart';
import 'package:cars_and_alll/app/screens/payment/initialPaymentScreen.dart';
import 'package:cars_and_alll/app/screens/payment/paymentCheckoutScreen.dart';
import 'package:cars_and_alll/app/screens/payment/paymentMethodSelection.dart';
import 'package:cars_and_alll/app/screens/profile/profileBuying/profileBuying_Screen.dart';
import 'package:cars_and_alll/app/screens/profile/profileBuying/subScreensBuying/share_my_number_screen.dart';
import 'package:cars_and_alll/app/screens/profile/profile_Screen.dart';
import 'package:cars_and_alll/app/screens/search/future_scope_screen.dart';
import 'package:cars_and_alll/app/screens/search/search_screen.dart';
import 'package:cars_and_alll/app/screens/search/select_vehicle_type.dart';
import 'package:cars_and_alll/app/screens/vehicle_details/get_vehicle_details.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../bindings/ViewAllBinding.dart';
import '../bindings/carDetailsBinding.dart';
import '../bindings/chatSpaceBinding.dart';
import '../bindings/pincodeBinding.dart';
import '../bindings/ratingBySellerBinding.dart';
import '../bindings/searchBinding.dart';
import '../screens/auth/login/login_with_email_screen.dart';
import '../screens/auth/login/login_with_phone_screen.dart';
import '../screens/car_details/carDetailScreen.dart';
import '../screens/car_details/car_image_screen.dart';
import '../screens/chat/chat_screen.dart';
import '../screens/chat/user_profile.dart';
import '../screens/cibil/addVehicleDetailsScreen.dart';
import '../screens/cibil/cibilScoreScreen.dart';
import '../screens/cibil/getVehicleDetailsScreen.dart';
import '../screens/cibil/personalInfoScreen.dart';
import '../screens/emergencyScreen.dart';
import '../screens/filter/filterScreen.dart';
import '../screens/financialAssistance/applicationStatusScreen.dart';
import '../screens/financialAssistance/financialAssistFormScreen.dart';
import '../screens/financialAssistance/trackLoanStatusScreen.dart';
import '../screens/financialAssistance/uploadFinancialDocumentScreen.dart';
import '../screens/home/views/home_screen.dart';
import '../screens/home/views/servicesScreen.dart';
import '../screens/home/widgets/view_all_screen.dart';
import '../screens/insurance/insuranceFormScreen.dart';
import '../screens/insurance/uploadDocumentScreen.dart';
import '../screens/medicalEmergency.dart';
import '../screens/nearbyMechanicsScreen.dart';
import '../screens/onboarding/user_selection.dart';
import '../screens/profile/profileBuying/subScreensBuying/addCardScreen.dart';
import '../screens/profile/profileBuying/subScreensBuying/add_bank_screen.dart';
import '../screens/profile/profileBuying/subScreensBuying/edit_profile_screen.dart';
import '../screens/profile/profileBuying/subScreensBuying/payment_method_screen.dart';
import '../screens/profile/profileBuying/subScreensBuying/rated_seller_screen.dart';
import '../screens/profile/profileBuying/subScreensBuying/rating_to_seller_screen.dart';
import '../screens/profile/profileBuying/subScreensBuying/recentlyViewVehicle.dart';
import '../screens/profile/profileBuying/subScreensBuying/saved_vehicle_screen.dart';
import '../screens/profile/profileBuying/subScreensBuying/verify_device_screen.dart';
import '../screens/profile/profileSelling/subScreenSelling/autoFollowUpScreen.dart';
import '../screens/profile/profileSelling/subScreenSelling/businessProfileScreen.dart';
import '../screens/profile/profileSelling/subScreenSelling/contactScreen.dart';
import '../screens/profile/profileSelling/subScreenSelling/postNewAddScreen.dart';
import '../screens/profile/profileSelling/subScreenSelling/ratingOverviewScreen.dart';
import '../screens/profile/profileSelling/subScreenSelling/transactionHistoryScreen.dart';
import '../screens/roadSideAssistance.dart';
import '../screens/search/coming_soon_screen.dart';
import '../screens/serviceHistoryScreen.dart';
import '../screens/splashScreen.dart';
import '../screens/towingServoceScreen.dart';
import '../screens/vehicle_details/pincode_selection_screen.dart';
import '../screens/vehicle_details/success_error_post_screen.dart';
import '../screens/vehicle_details/uploadVehicleImage.dart';
import '../screens/vehicle_details/enter_vehicle_details.dart';
import 'app_routes.dart';

class AppRouter {

  static final router = [
    GetPage(
      name: AppRoutes.loginWithPhone,
      page: () => LoginWithPhoneScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.reelsScreen,
      page: () => const ReelsScreen(),
      binding: ReelsBinding(),
    ),
    GetPage(
      name: AppRoutes.pincodeSelection,
      page: () => const PinCodeSelectionScreen(),
      binding: PincodeBinding(),
    ),
    GetPage(
      name: AppRoutes.successErrorPostScreen,
      page: () => const SuccessErrorPostScreen(),
    ),
    GetPage(
      name: AppRoutes.carImageScreen,
      page: () => const CarImageScreen(),
    ),
    GetPage(
      name: AppRoutes.loginWithEmail,
      page: () => const LoginWithEmailScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.getStarted,
      page: () => const GetStarted(),
    ),
    GetPage(
      name: AppRoutes.selectKycMode,
      page: () => const SelectKycMode(),
    ),
    GetPage(
      name: AppRoutes.profileScreen,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.selectVehicleType,
      page: () => const SelectVehicleType(),
    ),
    GetPage(
      name: AppRoutes.comingSoonScreen,
      page: () => const ComingSoonScreen(),
    ),
    GetPage(
      name: AppRoutes.futureScopeScreen,
      page: () => const FutureScopeScreen(),
    ),
    GetPage(
      name: AppRoutes.viewAllVehicles,
      page: () => const ViewAllVehicles(),
      binding: ViewAllBinding(),
    ),
    GetPage(
      name: AppRoutes.getVehicleDetails,
      page: () => const GetVehicleDetails(),
      binding: PostNewAddBinding(),
    ),
    GetPage(
      name: AppRoutes.faqScreen,
      page: () => const FaqScreen(),
    ),
    GetPage(
      name: AppRoutes.enterVehicleDetails,
      page: () => EnterVehicleDetails(),
      binding: PostNewAddBinding(),
    ),
    GetPage(
      name: AppRoutes.callUser,
      page: () => const CallUserScreen(),
    ),
    GetPage(
      name: AppRoutes.uploadVehicleImage,
      page: () => const UploadVehicleImage(),
    ),
    GetPage(
      name: AppRoutes.userSelection,
      page: () => const UserSelection(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.homeNav,
      page: () => const HomeNavScreen(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.savedVehicle,
      page: () => const SavedVehicleScreen(),
      binding: SavedVehicleBinding(),
    ),
    GetPage(
      name: AppRoutes.recentlyViewVehicle,
      page: () => const RecentlyViewVehicle(),
      binding: RecentlyViewBinding(),
    ),
    GetPage(
      name: AppRoutes.shareMyNumber,
      page: () => const ShareMyNumberScreen(),
    ),
    // GetPage(
    //   name: AppRoutes.addCardScreen,
    //   page: () => const AddCardScreen(),
    // ),
    GetPage(
      name: AppRoutes.ratingToSeller,
      page: () => const RatingToSellerScreen(),
    ),
    GetPage(
      name: AppRoutes.ratedSeller,
      page: () => const RatedSellerScreen(),
      binding: RatedSellerBinding(),
    ),
    GetPage(
      name: AppRoutes.editProfileScreen,
      page: () => const EditProfileScreen(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.paymentMethodScreen,
      page: () => const PaymentMethodScreen(),
    ),
    GetPage(
      name: AppRoutes.addBankScreen,
      page: () => const AddBankScreen(),
    ),
    GetPage(
      name: AppRoutes.verifyDeviceScreen,
      page: () => const VerifyDeviceScreen(),
    ),
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.searchScreen,
      page: () => const SearchScreen(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: AppRoutes.carDetailScreen,
      page: () => const CarDetailScreen(),
      binding: CarDetailsBinding(),
    ),

    GetPage(
      name: AppRoutes.filterScreen,
      page: () => const FilterScreen(),
    ),

    GetPage(
      name: AppRoutes.initialPaymentScreen,
      page: () => const InitialPaymentScreen(),
    ),

    GetPage(
      name: AppRoutes.paymentMethodSelection,
      page: () => const PaymentMethodSelection(),
    ),
    GetPage(
      name: AppRoutes.paymentCheckoutScreen,
      page: () => const PaymentCheckoutScreen(),
    ),
    // GetPage(
    //   name: AppRoutes.insuranceFormScreen,
    //   page: () => const InsuranceFormScreen(),
    // ),
    GetPage(
      name: AppRoutes.compareInsuranceQuote,
      page: () => const CompareInsuranceQuote(),
    ),
    GetPage(
      name: AppRoutes.uploadDocumentScreen,
      page: () => const UploadDocumentScreen(),
    ),
    GetPage(
      name: AppRoutes.financialAssistLandingScreen,
      page: () => const FinancialAssistanceLandingScreen(),
    ),
    GetPage(
      name: AppRoutes.financialAssistFormScreen,
      page: () => const FinancialAssistFormScreen(),
    ),
    GetPage(
      name: AppRoutes.uploadFinancialDocumentScreen,
      page: () => const UploadFinancialDocumentScreen(),
    ),
    GetPage(
      name: AppRoutes.applicationStatusScreen,
      page: () => const ApplicationStatusScreen(),
    ),
    GetPage(
      name: AppRoutes.trackLoanStatusScreen,
      page: () => const TrackLoanStatusScreen(),
    ),
    // GetPage(
    //   name: AppRoutes.cibilPersonalInfoScreen,
    //   page: () => const CibilPersonalInfoScreen(),
    // ),
    GetPage(
      name: AppRoutes.getVehicleDetailsScreen,
      page: () => const GetVehicleDetailsScreen(),
    ),
    // GetPage(
    //   name: AppRoutes.addVehicleDetailsScreen,
    //   page: () => const AddVehicleDetailsScreen(),
    // ),
    GetPage(
      name: AppRoutes.medicalEmergency,
      page: () => const MedicalEmergency(),
    ),
    GetPage(
      name: AppRoutes.emergencyScreen,
      page: () => const EmergencyScreen(),
    ),
    GetPage(
      name: AppRoutes.roadSideAssistance,
      page: () => const RoadSideAssistance(),
    ),
    GetPage(
      name: AppRoutes.nearbyMechanicsScreen,
      page: () => const NearbyMechanicsScreen(),
    ),
    GetPage(
      name: AppRoutes.towingServiceScreen,
      page: () => const TowingServiceScreen(),
    ),
    GetPage(
      name: AppRoutes.serviceHistoryScreen,
      page: () => const ServiceHistoryScreen(),
    ),
    GetPage(
      name: AppRoutes.serviceScreen,
      page: () => const ServicesScreen(),
    ),
    GetPage(
      name: AppRoutes.cibilLandingScreen,
      page: () => const CibilLandingScreen(),
    ),
    // GetPage(
    //   name: AppRoutes.cibilScoreScreen,
    //   page: () => const CibilScoreScreen(),
    // ),



    GetPage(
      name: AppRoutes.autoFollowUpScreen,
      page: () => const AutoFollowUpScreen(),
    ),
    GetPage(
      name: AppRoutes.myListingScreen,
      page: () => const MyListingScreen(),
      binding: MyListingBinding(),
    ),
    GetPage(
      name: AppRoutes.postNewAddsScreen,
      page: () => const PostNewAddScreen(),
    ),
    GetPage(
      name: AppRoutes.transactionHistoryScreen,
      page: () => const TransactionHistoryScreen(),
    ),
    GetPage(
      name: AppRoutes.businessProfileScreen,
      page: () => const BusinessProfileScreen(),
    ),
    GetPage(
      name: AppRoutes.ratingOverviewScreen,
      page: () => const RatingOverviewScreen(),
      binding: RatingBySellerBinding(),
    ),
    GetPage(
      name: AppRoutes.contactScreen,
      page: () => const ContactScreen(),
    ),
    GetPage(
      name: AppRoutes.chatScreen,
      page: () => const ChatScreen(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: AppRoutes.chatUserProfile,
      page: () => const ChatUserProfile(),
    ),
    GetPage(
      name: AppRoutes.sellersChatSpace,
      page: () => const ChatSpaceScreen(),
      binding: ChatSpaceBinding(),
    ),
    GetPage(
      name: AppRoutes.buyersChatSpace,
      page: () => const ChatSpaceScreen(),
      binding: ChatSpaceBinding(),
    ),
  ];
}
