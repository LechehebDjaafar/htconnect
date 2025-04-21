class UserModel {
  final String name;
  final String phone;
  final String city;
  final String category;
  final Map<String, dynamic> additionalInfo;

  UserModel({
    required this.name,
    required this.phone,
    required this.city,
    required this.category,
    this.additionalInfo = const {},
  });
}
