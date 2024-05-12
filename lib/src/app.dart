import 'package:flutter/material.dart';
import 'package:music_player_ui/src/providers/theme_provider.dart';
import 'package:music_player_ui/src/screens/playlist_screen.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player UI',
      theme: Provider.of<ThemeProvider>(context).theme,
      home: const PlayListScreen(),
    );
  }
}
