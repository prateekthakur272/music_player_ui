import 'package:flutter/material.dart';
import 'package:music_player_ui/src/providers/playlist_provider.dart';
import 'package:provider/provider.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(value.currentTrack != null
              ? value.currentTrack!.title
              : ""),
        ),
      );
    });
  }
}
