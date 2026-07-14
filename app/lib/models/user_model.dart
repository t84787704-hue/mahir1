enum UserRole { customer, provider, none }
class UserModel {
  final String id; final String email; final String name; final String photoUrl; final UserRole role; final String city;
  UserModel({required this.id, required this.email, required this.name, required this.photoUrl, required this.role, this.city = 'Lahore'});
}
