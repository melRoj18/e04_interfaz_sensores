import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/device_info_provider.dart';

class DeviceInfoSection extends StatelessWidget {
  const DeviceInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DeviceInfoProvider>();

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dispositivo',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: provider.loading ? null : provider.loadDeviceInfo,
              icon: const Icon(Icons.info_outline),
              label: Text(provider.loading ? 'Cargando...' : 'Obtener info'),
            ),
            const SizedBox(height: 20),
            if (provider.info.isNotEmpty)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: provider.info.entries
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Text('${e.key}: ${e.value}'),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
