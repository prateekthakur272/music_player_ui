import 'package:flutter/material.dart';

import '../models/track.dart';

class PlaylistProvider extends ChangeNotifier{
  final List<Track> _playlist = [
    Track(title: 'Oggy And The Cockroaches Theme Song', artist: 'Jack : The duniya ka papa', albumArtUrl: 'assets/images/oggy.jpeg', audioFileUrl: 'assets/audios/1.mp3')
  ];

  Track? _currentTrack;

  List<Track> get playlist => _playlist;
  Track? get currentTrack => _currentTrack;

  set currentTrack(Track? track){
    _currentTrack = track;
    notifyListeners();
  }
}