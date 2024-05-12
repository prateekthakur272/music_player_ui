import 'package:flutter/cupertino.dart';
import 'package:music_player_ui/src/app.dart';
import 'package:music_player_ui/src/providers/playlist_provider.dart';
import 'package:music_player_ui/src/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ThemeProvider()),
        ChangeNotifierProvider(create: (context)=> PlaylistProvider())
      ],
      child: const App()));
}
