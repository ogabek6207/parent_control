class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.image,
    required this.gender,
  });

  int id;
  int gender;
  String name;
  String image;

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "gender": gender,
      };
}
