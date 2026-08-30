import 'package:flutter/foundation.dart';
import 'package:battery_plus/battery_plus.dart';
import '../services/battery_service.dart';

class BatteryProvider extends ChangeNotifier {
  final BatteryService _batteryService;

  int batteryLevel = 0;
  BatteryState batteryState = BatteryState.unknown;
  bool loading = false;

  BatteryProvider(this._batteryService);

  Future<void> loadBatteryData() async {
    loading = true;
    notifyListeners();
    try {
      batteryLevel = await _batteryService.getBatteryLevel();
      batteryState = await _batteryService.getBatteryState();
    } catch (e) {
      debugPrint('Error al cargar batería: $e');
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
