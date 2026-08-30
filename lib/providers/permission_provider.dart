import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import '../services/permission_service.dart';

class PermissionProvider extends ChangeNotifier {
  final PermissionService _permissionService;

  PermissionStatus status = PermissionStatus.denied;
  bool loading = false;

  PermissionProvider(this._permissionService);

  Future<void> checkPermission() async {
    status = await _permissionService.checkLocationPermission();
    notifyListeners();
  }

  Future<void> requestPermission() async {
    loading = true;
    notifyListeners();
    status = await _permissionService.requestLocationPermission();
    loading = false;
    notifyListeners();
  }
}
