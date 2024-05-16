import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_player_ui/src/extensions/build_context_extension.dart';
import 'package:music_player_ui/src/extensions/int_space_extension.dart';
import 'package:music_player_ui/src/providers/playlist_provider.dart';
import 'package:music_player_ui/src/widgets/neu_box.dart';
import 'package:provider/provider.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  String formatTime(Duration dur) {
    String formattedSeconds = dur.inSeconds.remainder(60).toString();
    String formattedMins = dur.inMinutes.toString();
    if (formattedSeconds.length == 1) {
      formattedSeconds = '0$formattedSeconds';
    }
    if (formattedMins.length == 1) {
      formattedMins = '0$formattedMins';
    }
    return '$formattedMins:$formattedSeconds';
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
        builder: (context, playlistProvider, child) {
      return Scaffold(
          backgroundColor: context.colorScheme.background,
          appBar: AppBar(
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: Colors.transparent,
            title: Text(playlistProvider.currentTrack != null
                ? playlistProvider.currentTrack!.title
                : ""),
          ),
          body: Padding(
            padding: 24.horizontal,
            child: Column(
              children: [
                24.space,
                NeuBox(
                    child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 8, bottom: 24),
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.asset(
                                  fit: BoxFit.cover,
                                  playlistProvider.currentTrack!.albumArtUrl))),
                      12.space,
                      Padding(
                        padding: 4.horizontal,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    playlistProvider.currentTrack!.title,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(playlistProvider.currentTrack!.artist)
                                ],
                              ),
                            ),
                            4.space,
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite),
                              color: Colors.red,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
                16.space,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatTime(playlistProvider.currentDuration)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.repeat)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.shuffle)),
                    Text(formatTime(playlistProvider.totalDuration)),
                  ],
                ),
                8.space,
                SliderTheme(
                  data: context.theme.sliderTheme.copyWith(
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 0)),
                  child: Slider(
                    min: 0,
                    value:
                        playlistProvider.currentDuration.inSeconds.toDouble(),
                    max: playlistProvider.totalDuration.inSeconds.toDouble(),
                    onChanged: (pos) {},
                    onChangeEnd: (pos) {
                      playlistProvider.seek(Duration(seconds: pos.toInt()));
                    },
                    activeColor: Colors.green.shade400,
                  ),
                ),
                8.space,
                Row(
                  children: [
                    Expanded(
                      child: NeuBox(
                        child: IconButton(
                          onPressed: () {
                            playlistProvider.skipPrev();
                          },
                          icon: const Icon(Icons.skip_previous),
                        ),
                      ),
                    ),
                    24.space,
                    Expanded(
                      flex: 2,
                      child: NeuBox(
                        child: IconButton(
                          onPressed: () {
                            playlistProvider.pauseOrResume();
                          },
                          icon: Icon(playlistProvider.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow),
                        ),
                      ),
                    ),
                    24.space,
                    Expanded(
                      child: NeuBox(
                        child: IconButton(
                          onPressed: () {
                            playlistProvider.skipNext();
                          },
                          icon: const Icon(Icons.skip_next),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ));
    });
  }
}
