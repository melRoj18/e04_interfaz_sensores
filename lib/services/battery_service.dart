import 'package:battery_plus/battery_plus.dart';

class BatteryService {
  final Battery _battery = Battery();

  Future<int> getBatteryLevel() => _battery.batteryLevel;

  Future<BatteryState> getBatteryState() => _battery.batteryState;
}
