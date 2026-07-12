import '../../../core/services/auth_service.dart';

class ForgotPasswordService {
  ForgotPasswordService._();

  static final ForgotPasswordService instance = ForgotPasswordService._();

  final AuthService _authService = AuthService.instance;

  Future<void> sendPasswordResetEmail({required String email}) async {
    await _authService.sendPasswordResetEmail(email: email);
  }
}
