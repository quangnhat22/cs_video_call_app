class UserEntity {
  final String id;
  final String? name;
  final String? avatar;
  final String? address;
  final String? gender;
  final String? phone;
  final String? birthday;

  UserEntity({
    required this.id,
    this.name,
    this.avatar,
    this.address,
    this.gender,
    this.phone,
    this.birthday,
  });
}
