import 'package:flutter/material.dart';
import 'package:music_player_ui/src/extensions/build_context_extension.dart';
import 'package:music_player_ui/src/providers/playlist_provider.dart';
import 'package:music_player_ui/src/screens/player_screen.dart';
import 'package:music_player_ui/src/widgets/drawer_view.dart';
import 'package:provider/provider.dart';

class PlayListScreen extends StatelessWidget {
  const PlayListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      appBar: AppBar(
        title: const Text('P L A Y L I S T'),
      ),
      drawer: const DrawerView(),
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          final playlist = value.playlist;
          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                value.currentTrack = playlist[index];
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PlayerScreen()));
              },
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(playlist[index].albumArtUrl)),
              title: Text(playlist[index].title),
              subtitle: Text(playlist[index].artist),
            ),
          );
        },
      ),
    );
  }
}
