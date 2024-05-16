import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../models/track.dart';

class PlaylistProvider extends ChangeNotifier {
  PlaylistProvider() {
    listToDuration();
  }

  final List<Track> _playlist = [
    Track(
        title: 'Oggy And The Cockroaches Theme Song',
        artist: 'Jack : The duniya ka papa',
        albumArtUrl: 'assets/images/oggy.jpeg',
        audioFileUrl: 'audios/1.mp3')
  ];

  Track? _currentTrack;
  int? _currentTrackIndex;

  List<Track> get playlist => _playlist;
  Track? get currentTrack => _currentTrack;
  int? get currentTrackIndex => _currentTrackIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  set currentTrackIndex(int? index) {
    _currentTrackIndex = index;
    _currentTrack =
        _currentTrackIndex != null ? _playlist[_currentTrackIndex!] : null;
    if (index != null) {
      play();
    }
    notifyListeners();
  }

  final AudioPlayer _audioPlayer = AudioPlayer();
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  bool _isPlaying = false;

  void play() async {
    final String path = _currentTrack?.audioFileUrl ?? '';
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  void pause() async {
    _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  void resume() async {
    _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
  }

  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  void skipNext() async {
    if (currentTrack != null) {
      if (currentTrackIndex != playlist.length - 1) {
        currentTrackIndex = currentTrackIndex! + 1;
      } else {
        currentTrackIndex = 0;
      }
    }
  }

  void skipPrev() async {
    if (currentTrack != null) {
      if (_currentDuration.inSeconds < 2) {
        currentTrackIndex = currentTrackIndex;
      } else {
        if (currentTrackIndex != 0) {
          currentTrackIndex = currentTrackIndex! - 1;
        } else {
          currentTrackIndex = playlist.length - 1;
        }
      }
    }
  }

  void listToDuration() {
    _audioPlayer.onDurationChanged.listen((duration) {
      _totalDuration = duration;
      notifyListeners();
    });
    _audioPlayer.onPositionChanged.listen((position) {
      _currentDuration = position;
      notifyListeners();
    });
    _audioPlayer.onPlayerComplete.listen((event) {
      skipNext();
    });
  }
}
