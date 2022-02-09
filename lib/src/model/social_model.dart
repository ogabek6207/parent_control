class SocialModel {
  SocialModel({
    required this.id,
    required this.typeId,
    required this.userId,
    this.selected = false,
    this.isFav = 0,
  });

  int id;
  int typeId;
  int userId;
  bool selected;
  int isFav;

  Map<String, dynamic> toJson() => {
        "type_id": typeId,
        "user_id": userId,
        "isFav": userId,
      };
}
