import '../../../core/services/auth_service.dart';

class VerifyEmailService {
  VerifyEmailService._();

  static final VerifyEmailService instance = VerifyEmailService._();

  final AuthService _authService = AuthService.instance;

  Future<void> reloadUser() async {
    await _authService.reloadUser();
  }

  bool get isVerified => _authService.isEmailVerified;

  Future<void> resendEmail() async {
    await _authService.sendEmailVerification();
  }
}
