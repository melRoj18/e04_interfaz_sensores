import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/sensor_data.dart';
import '../../providers/sensor_provider.dart';

class SensorSection extends StatelessWidget {
  const SensorSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SensorProvider>();

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sensores', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: provider.isListening
                  ? provider.stopListening
                  : provider.startListening,
              icon: Icon(provider.isListening ? Icons.stop : Icons.play_arrow),
              label: Text(provider.isListening ? 'Detener' : 'Iniciar'),
            ),
            const SizedBox(height: 20),
            _SensorDataCard(
              title: 'Acelerómetro',
              data: provider.accelerometer,
            ),
            const SizedBox(height: 12),
            _SensorDataCard(title: 'Giroscopio', data: provider.gyroscope),
          ],
        ),
      ),
    );
  }
}

class _SensorDataCard extends StatelessWidget {
  final String title;
  final SensorData? data;

  const _SensorDataCard({required this.title, this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            if (data == null)
              const Text('Sin datos')
            else
              Text(
                'X: ${data!.x.toStringAsFixed(2)}\n'
                'Y: ${data!.y.toStringAsFixed(2)}\n'
                'Z: ${data!.z.toStringAsFixed(2)}',
              ),
          ],
        ),
      ),
    );
  }
}
