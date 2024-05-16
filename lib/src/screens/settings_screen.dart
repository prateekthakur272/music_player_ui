import 'package:flutter/material.dart';
import 'package:music_player_ui/src/extensions/build_context_extension.dart';
import 'package:music_player_ui/src/extensions/int_space_extension.dart';
import 'package:music_player_ui/src/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('S E T T I N G S'),
      ),
      body: ListView(
        padding: 16.all,
        children: [
          SwitchListTile(
              tileColor: context.colorScheme.secondary,
              title: const Text('Dark Theme'),
              subtitle: const Text('Switch to dark theme'),
              value: themeProvider.isDark,
              onChanged: (v) {
                themeProvider.toggleTheme();
              })
        ],
      ),
    );
  }
}
