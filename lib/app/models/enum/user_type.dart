
enum UserType {
  INDIVIDUAL,
  DEALER
}

String userTypeFromEnum(UserType userType){
  switch(userType){
    case UserType.INDIVIDUAL:
      return "Individual";
    case UserType.DEALER:
      return "Dealer";
  }
}

UserType userTypeToEnum(String userType){
  switch(userType){
    case "Individual":
      return UserType.INDIVIDUAL;
    case "Dealer":
      return UserType.DEALER;
    default:
      return UserType.INDIVIDUAL;
  }
}