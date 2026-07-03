import 'dart:convert';

class UnseenChatModel {
  List<ChatRoom>? data;
  Summary? summary;

  UnseenChatModel({
    this.data,
    this.summary,
  });

  factory UnseenChatModel.fromJson(Map<String, dynamic> json) => UnseenChatModel(
    data: json["data"] == null ? null : List<ChatRoom>.from(json["data"].map((x) => ChatRoom.fromJson(x))),
    summary: json["summary"] == null ? null : Summary.fromJson(json["summary"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
    "summary": summary?.toJson(),
  };
}

class ChatRoom {
  String? id;
  User? buyerId;
  User? sellerId;
  String? vehicleId;
  bool? autoFollowUp;
  DateTime? lastSeenByBuyer;
  DateTime? lastSeenBySeller;
  List<Message>? messages;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int? unseenCount;

  ChatRoom({
    this.id,
    this.buyerId,
    this.sellerId,
    this.vehicleId,
    this.autoFollowUp,
    this.lastSeenByBuyer,
    this.lastSeenBySeller,
    this.messages,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.unseenCount,
  });

  factory ChatRoom.fromJson(Map<String, dynamic> json) => ChatRoom(
    id: json["_id"],
    buyerId: json["buyerId"] == null ? null : User.fromJson(json["buyerId"]),
    sellerId: json["sellerId"] == null ? null : User.fromJson(json["sellerId"]),
    vehicleId: json["vehicleId"],
    autoFollowUp: json["autoFollowUp"],
    lastSeenByBuyer: json["lastSeenByBuyer"] == null ? null : DateTime.parse(json["lastSeenByBuyer"]),
    lastSeenBySeller: json["lastSeenBySeller"] == null ? null : DateTime.parse(json["lastSeenBySeller"]),
    messages: json["messages"] == null ? null : List<Message>.from(json["messages"].map((x) => Message.fromJson(x))),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    unseenCount: json["unseenCount"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "buyerId": buyerId?.toJson(),
    "sellerId": sellerId?.toJson(),
    "vehicleId": vehicleId,
    "autoFollowUp": autoFollowUp,
    "lastSeenByBuyer": lastSeenByBuyer?.toIso8601String(),
    "lastSeenBySeller": lastSeenBySeller?.toIso8601String(),
    "messages": messages == null ? null : List<dynamic>.from(messages!.map((x) => x.toJson())),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "unseenCount": unseenCount,
  };
}

class User {
  String? id;
  String? userName;
  List<String>? userProfileImage;

  User({
    this.id,
    this.userName,
    this.userProfileImage,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    userName: json["userName"],
    userProfileImage: json["userProfileImage"] == null ? null : List<String>.from(json["userProfileImage"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userName": userName,
    "userProfileImage": userProfileImage == null ? null : List<dynamic>.from(userProfileImage!.map((x) => x)),
  };
}

class Message {
  User? senderId;
  String? senderRole;
  String? messageType;
  String? text;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;

  Message({
    this.senderId,
    this.senderRole,
    this.messageType,
    this.text,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    senderId: json["senderId"] == null ? null : User.fromJson(json["senderId"]),
    senderRole: json["senderRole"],
    messageType: json["messageType"],
    text: json["text"],
    id: json["_id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "senderId": senderId?.toJson(),
    "senderRole": senderRole,
    "messageType": messageType,
    "text": text,
    "_id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class Summary {
  int? totalUnseen;
  int? buyerUnseen;
  int? sellerUnseen;

  Summary({
    this.totalUnseen,
    this.buyerUnseen,
    this.sellerUnseen,
  });

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
    totalUnseen: json["totalUnseen"],
    buyerUnseen: json["buyerUnseen"],
    sellerUnseen: json["sellerUnseen"],
  );

  Map<String, dynamic> toJson() => {
    "totalUnseen": totalUnseen,
    "buyerUnseen": buyerUnseen,
    "sellerUnseen": sellerUnseen,
  };
}