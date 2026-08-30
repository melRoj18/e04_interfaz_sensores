import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoService {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  Future<Map<String, String>> getDeviceInfo() async {
    if (Platform.isAndroid) {
      final info = await _deviceInfo.androidInfo;
      return {
        'Modelo': info.model,
        'Fabricante': info.manufacturer,
        'Versión de Android': info.version.release,
        'SDK': info.version.sdkInt.toString(),
        'Board': info.board,
        'Hardware': info.hardware,
      };
    } else if (Platform.isIOS) {
      final info = await _deviceInfo.iosInfo;
      return {
        'Modelo': info.utsname.machine,
        'Nombre': info.name,
        'Versión de iOS': info.systemVersion,
        'Identificador': info.identifierForVendor ?? 'N/A',
      };
    }
    return {'Error': 'Plataforma no soportada'};
  }
}
