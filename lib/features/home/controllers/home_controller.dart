import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/home_dashboard_model.dart';
import '../../../core/services/session_service.dart';
import '../services/home_service.dart';

class HomeController extends ChangeNotifier {
  HomeController();

  final HomeService _homeService = HomeService.instance;
  HomeDashboardModel dashboard = HomeDashboardModel.empty();
  String ownerName = "";
  String outletName = "";

  bool isLoading = true;

  String get greeting {
    final hour = DateTime.now().hour;

    if (hour < 11) {
      return "☀ Selamat Pagi";
    }

    if (hour < 15) {
      return "🌤 Selamat Siang";
    }

    if (hour < 18) {
      return "🌇 Selamat Sore";
    }

    return "🌙 Selamat Malam";
  }

  Future<void> loadData() async {
    try {
      isLoading = true;
      notifyListeners();

      final uid = FirebaseAuth.instance.currentUser!.uid;

      final user = await _homeService.getUser(uid);

      ownerName = user.name;

      final outletId =
          await SessionService.getOutletId() ?? user.defaultOutletId;

      final outlet = await _homeService.getOutlet(outletId);

      outletName = outlet.name;
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
