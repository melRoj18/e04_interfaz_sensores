import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/battery_provider.dart';

class BatterySection extends StatelessWidget {
  const BatterySection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BatteryProvider>();

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Batería', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: provider.loading ? null : provider.loadBatteryData,
              icon: const Icon(Icons.refresh),
              label: Text(provider.loading ? 'Cargando...' : 'Actualizar'),
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Nivel: ${provider.batteryLevel}%',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text('Estado: ${provider.batteryState.name}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
