import 'package:sensors_plus/sensors_plus.dart';
import '../models/sensor_data.dart';

class SensorService {
  Stream<SensorData> accelerometerStream() {
    return accelerometerEventStream().map(
      (event) => SensorData(
        x: event.x,
        y: event.y,
        z: event.z,
        timestamp: DateTime.now(),
      ),
    );
  }

  Stream<SensorData> gyroscopeStream() {
    return gyroscopeEventStream().map(
      (event) => SensorData(
        x: event.x,
        y: event.y,
        z: event.z,
        timestamp: DateTime.now(),
      ),
    );
  }
}
