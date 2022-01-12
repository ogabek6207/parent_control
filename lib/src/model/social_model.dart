class SocialModel {
  SocialModel({
    required this.id,
    required this.typeId,
    required this.userId,
    this.selected = false,
  });

  int id;
  int typeId;
  int userId;
  bool selected;

  Map<String, dynamic> toJson() => {
        "type_id": typeId,
        "user_id": userId,
      };
}
