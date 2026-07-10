import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  SessionService._();

  static const String _outletIdKey = 'selected_outlet_id';
  static const String _roleKey = 'selected_role';

  /// Simpan outlet yang sedang dipilih
  static Future<void> saveOutletId(String outletId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_outletIdKey, outletId);
  }

  /// Ambil outlet yang dipilih
  static Future<String?> getOutletId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_outletIdKey);
  }

  /// Simpan role user
  static Future<void> saveRole(String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_roleKey, role);
  }

  /// Ambil role user
  static Future<String?> getRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_roleKey);
  }

  /// Hapus semua session lokal
  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_outletIdKey);
    await prefs.remove(_roleKey);
  }
}