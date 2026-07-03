class ApiRoutes {

  ApiRoutes._();

  static String baseUrl = 'https://carsandallapi.onrender.com/api/';

  /// User APIs
  static String registerUser = 'user/register';
  static String otpSendToPhone = 'user/otpSendToPhone';
  static String verifyOtpPhone = 'user/verifyOtpPhone';
  static String loginWithPhone = "user/loginWithPhone";
  static String authVerify = "user/authVerify";
  static String updateUserProfile = "user/updateUserProfile";
  static String getAllUsers = "user/getAllUser";

  static String postContact = "contact/postContact";


  /// Category APIs
  static String getAllCategory = "category/getAllCategory";

  /// Vehicle APIs
  static String getAllVehicles = "vehicle/getAllVehicle";
  static String getShortFilterVehicle = "vehicle/getShortFilterVehicle";
  static String performanceOverview = "vehicle/performance-overview";
  static String postVehicle = "vehicle/postVehicle";

  /// View APIs
  static String postRecentView = "recentview/postRecentView";

  /// Wishlist
  static String getWishlist = "wishlist/getWishlistByUserId";
  static String addToWishlist = "wishlist/addToWishlist";
  static String removeFromWishlist = "wishlist/removeFromWishlist";

  /// Filter APIs
  static String applyFilter = "vehicle/getFilteredVehicles";
  static String searchVehicle = "vehicle/searchvehicle";
  static String getRecentViewVehicles = "vehicle/getRecentViewVehicle";
  static String getRecommendedVehicles = "vehicle/getRecommendedVehicles";

  /// Reels
  static String shortReels = "st/stories";
  static String likeStory = "st/story";
  static String addComment = "st/story";

  /// Vehicle Details
  static String getVehicleDetails = "vehicle/getVehicleById";
  static String updateVehicleStatus = "vehicle/updateVehicleStatus";
  static String searchVehicleNumber = "db/searchVehicleNumber";

  /// My Listing
  static String getAllListedVehicleByUser = "vehicle/getAllListedVehicleByUser";


  /// Rating & Review
  static String getRating = "rating/getSellerReview";
  static String getAllRatingByUser = "rating/getAllRatingByUser";
  static String getAllRatingBySeller = "rating/getAllRatingBySeller";
  static String getAllSubmittedRatingByUser = "rating/getAllSubmitatedRatingByUser";
  static String addRating = "rating/addToRating";


  /// Chat APIs
  static String mySellerChat = "chat/my-sellerchat";
  static String myBuyerChat = "chat/my-buyerchat";
  static String createChat = "chat/create-conversation";
  static String getChat = "chat/getMessagesByConversation";
  static String sendMessage = "chat/sendMessage";
  static String unseenMessage = "chat/unseen";

  /// pincode
  static String pincode = "location/getLocationFromPincode";

}