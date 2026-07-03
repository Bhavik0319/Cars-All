class CommentModel {
  final CommentUser? user;
  final String? comment;
  final String? id;
  final DateTime? createdAt;

  CommentModel({
    this.user,
    this.comment,
    this.id,
    this.createdAt,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      // Handling the nested user object
      user: json['userId'] != null ? CommentUser.fromJson(json['userId']) : null,
      comment: json['comment'] as String?,
      id: json['_id'] as String?,
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt'])!.add(Duration(hours: 5, minutes: 30)) : null,
    );
  }
}

class CommentUser {
  final String? id;
  final String? userName;
  final List<String>? userProfileImage;

  CommentUser({
    this.id,
    this.userName,
    this.userProfileImage,
  });

  factory CommentUser.fromJson(Map<String, dynamic> json) {
    return CommentUser(
      id: json['_id'] as String?,
      userName: json['userName'] as String?,
      // Extracting the list of profile image strings
      userProfileImage: json['userProfileImage'] != null
          ? List<String>.from(json['userProfileImage'])
          : [""],
    );
  }

  // Helper to get the first image or a placeholder
  String get profilePicture => (userProfileImage != null && userProfileImage!.isNotEmpty)
      ? userProfileImage!.first
      : 'https://via.placeholder.com/150';
}