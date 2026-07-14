import '../models/user_model.dart';
class AuthProvider {
  static UserRole currentRole = UserRole.none;
  static void setRole(UserRole r){ currentRole = r; }
  static bool get isCustomer => currentRole == UserRole.customer;
}
