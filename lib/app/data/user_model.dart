class UserModel {
  final int id;
  final String name;
  final String phone;
  final String birthdate;
  final String passportNumber;
  final String country;
  final String email;
  final int isActive;
  final String image;
  final String? emailVerifiedAt;
  final String? twoFactorConfirmedAt;
  final String? currentTeamId;
  final String? profilePhotoPath;
  final String createdAt;
  final String updatedAt;
  final String profilePhotoUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.birthdate,
    required this.passportNumber,
    required this.country,
    required this.email,
    required this.isActive,
    required this.image,
    this.emailVerifiedAt,
    this.twoFactorConfirmedAt,
    this.currentTeamId,
    this.profilePhotoPath,
    required this.createdAt,
    required this.updatedAt,
    required this.profilePhotoUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      birthdate: json['birthdate'],
      passportNumber: json['passport_number'],
      country: json['country'],
      email: json['email'],
      isActive: json['is_active'],
      image: json['image'],
      emailVerifiedAt: json['email_verified_at'],
      twoFactorConfirmedAt: json['two_factor_confirmed_at'],
      currentTeamId: json['current_team_id'],
      profilePhotoPath: json['profile_photo_path'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      profilePhotoUrl: json['profile_photo_url'],
    );
  }
}
