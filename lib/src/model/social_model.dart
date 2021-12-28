class SocialModel {
  SocialModel({
    required this.id,
    required this.typeId,
    required this.userId,
  });

  int id;
  int typeId;
  int userId;

  Map<String, dynamic> toJson() => {
        "type_id": typeId,
        "user_id": userId,
      };
}
