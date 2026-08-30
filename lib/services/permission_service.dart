import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<PermissionStatus> checkLocationPermission() =>
      Permission.location.status;

  Future<PermissionStatus> requestLocationPermission() =>
      Permission.location.request();
}
