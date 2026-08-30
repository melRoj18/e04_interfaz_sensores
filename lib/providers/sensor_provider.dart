import 'dart:async';
import 'package:flutter/foundation.dart';
import '../models/sensor_data.dart';
import '../services/sensor_service.dart';

class SensorProvider extends ChangeNotifier {
  final SensorService _sensorService;

  StreamSubscription<SensorData>? _accelSub;
  StreamSubscription<SensorData>? _gyroSub;

  SensorData? accelerometer;
  SensorData? gyroscope;
  bool isListening = false;

  SensorProvider(this._sensorService);

  void startListening() {
    if (isListening) return;

    _accelSub = _sensorService.accelerometerStream().listen((data) {
      accelerometer = data;
      notifyListeners();
    }, onError: (e) => debugPrint('Error acelerómetro: $e'));

    _gyroSub = _sensorService.gyroscopeStream().listen((data) {
      gyroscope = data;
      notifyListeners();
    }, onError: (e) => debugPrint('Error giroscopio: $e'));

    isListening = true;
    notifyListeners();
  }

  void stopListening() {
    _accelSub?.cancel();
    _gyroSub?.cancel();
    _accelSub = null;
    _gyroSub = null;
    accelerometer = null;
    gyroscope = null;
    isListening = false;
    notifyListeners();
  }

  @override
  void dispose() {
    stopListening();
    super.dispose();
  }
}
