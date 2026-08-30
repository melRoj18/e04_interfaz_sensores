import 'package:flutter/foundation.dart';
import '../services/device_info_service.dart';

class DeviceInfoProvider extends ChangeNotifier {
  final DeviceInfoService _deviceInfoService;

  Map<String, String> info = {};
  bool loading = false;

  DeviceInfoProvider(this._deviceInfoService);

  Future<void> loadDeviceInfo() async {
    loading = true;
    notifyListeners();
    try {
      info = await _deviceInfoService.getDeviceInfo();
    } catch (e) {
      debugPrint('Error al obtener información: $e');
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
