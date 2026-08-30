import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import '../../utils/breakpoints.dart';
import '../widgets/adaptive_navigation.dart';
import '../widgets/sensor_section.dart';
import '../widgets/battery_section.dart';
import '../widgets/device_info_section.dart';
import '../widgets/permission_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final windowSize = getWindowSize(constraints.maxWidth);
          final isCompact = windowSize == WindowSize.compact;

          // Detección de pliegues/visagras en dispositivos plegables
          double hingePadding = 0;
          final displayFeatures = MediaQuery.of(context).displayFeatures;
          for (final feature in displayFeatures) {
            if (feature.type == ui.DisplayFeatureType.fold ||
                feature.type == ui.DisplayFeatureType.hinge) {
              // Si la visagra está cerca del centro vertical, añade padding
              if (feature.bounds.center.dx > constraints.maxWidth * 0.3 &&
                  feature.bounds.center.dx < constraints.maxWidth * 0.7) {
                hingePadding = 16.0;
              }
            }
          }

          final body = IndexedStack(
            index: _selectedIndex,
            children: const [
              SensorSection(),
              BatterySection(),
              DeviceInfoSection(),
              PermissionSection(),
            ],
          );

          if (isCompact) {
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: hingePadding),
                child: body,
              ),
              bottomNavigationBar: AdaptiveNavigation(
                selectedIndex: _selectedIndex,
                onDestinationSelected: (i) =>
                    setState(() => _selectedIndex = i),
                windowSize: windowSize,
              ),
            );
          } else {
            return Scaffold(
              body: Row(
                children: [
                  AdaptiveNavigation(
                    selectedIndex: _selectedIndex,
                    onDestinationSelected: (i) =>
                        setState(() => _selectedIndex = i),
                    windowSize: windowSize,
                  ),
                  const VerticalDivider(width: 1),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: hingePadding),
                      child: body,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
