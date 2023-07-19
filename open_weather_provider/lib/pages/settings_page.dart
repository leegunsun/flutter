import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:open_weather_provider/providers/providers.dart';
import "package:provider/provider.dart";

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          title: Text('Temperature Unit'),
          subtitle: Text('Celsius/Fahrenheit (DEfault: Celsius)'),
          trailing: Switch(
            onChanged: (_) {
              context.read<TempSettingsProvider>().toggleTempUnit();
            },
            value: context.watch<TempSettingsProvider>().state.tempUnit ==
                TempUnit.celsius,
          ),
        ),
      ),
    );
  }
}
