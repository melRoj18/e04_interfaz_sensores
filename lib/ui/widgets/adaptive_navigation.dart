import 'package:flutter/material.dart';
import '../../utils/breakpoints.dart';

class AdaptiveNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final WindowSize windowSize;

  const AdaptiveNavigation({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.windowSize,
  });

  @override
  Widget build(BuildContext context) {
    final destinations = const [
      NavigationDestination(icon: Icon(Icons.sensors), label: 'Sensores'),
      NavigationDestination(icon: Icon(Icons.battery_full), label: 'Batería'),
      NavigationDestination(
        icon: Icon(Icons.phone_android),
        label: 'Dispositivo',
      ),
      NavigationDestination(icon: Icon(Icons.lock), label: 'Permisos'),
    ];

    if (windowSize == WindowSize.compact) {
      return NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: destinations,
      );
    } else {
      return NavigationRail(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        labelType: NavigationRailLabelType.all,
        destinations: destinations
            .map(
              (d) =>
                  NavigationRailDestination(icon: d.icon, label: Text(d.label)),
            )
            .toList(),
      );
    }
  }
}
