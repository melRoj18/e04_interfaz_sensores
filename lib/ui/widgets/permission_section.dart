import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../../providers/permission_provider.dart';

class PermissionSection extends StatelessWidget {
  const PermissionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PermissionProvider>();

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Permisos', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: provider.loading ? null : provider.checkPermission,
              icon: const Icon(Icons.check_circle_outline),
              label: const Text('Verificar permiso'),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: provider.loading ? null : provider.requestPermission,
              icon: const Icon(Icons.lock_open),
              label: const Text('Solicitar permiso de ubicación'),
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Estado actual: ${_permissionStatusText(provider.status)}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _permissionStatusText(PermissionStatus status) {
    switch (status) {
      case PermissionStatus.granted:
        return 'Concedido';
      case PermissionStatus.denied:
        return 'Denegado';
      case PermissionStatus.permanentlyDenied:
        return 'Denegado permanentemente';
      case PermissionStatus.restricted:
        return 'Restringido';
      case PermissionStatus.limited:
        return 'Limitado';
      case PermissionStatus.provisional:
        return 'Provisional';
    }
  }
}
