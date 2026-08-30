import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/app.dart';
import 'providers/sensor_provider.dart';
import 'providers/battery_provider.dart';
import 'providers/device_info_provider.dart';
import 'providers/permission_provider.dart';
import 'services/sensor_service.dart';
import 'services/battery_service.dart';
import 'services/device_info_service.dart';
import 'services/permission_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SensorProvider(SensorService()),
        ),
        ChangeNotifierProvider(
          create: (_) => BatteryProvider(BatteryService()),
        ),
        ChangeNotifierProvider(
          create: (_) => DeviceInfoProvider(DeviceInfoService()),
        ),
        ChangeNotifierProvider(
          create: (_) => PermissionProvider(PermissionService()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}