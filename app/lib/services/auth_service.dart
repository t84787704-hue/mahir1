import '../models/user_model.dart';
class AuthService{
  static Future<UserModel> signInWithGmail() async {
    await Future.delayed(Duration(seconds: 1));
    return UserModel(id: '1', email: 'user@gmail.com', name: 'User', photoUrl: '', role: UserRole.none);
  }
}
