import 'package:flutter/material.dart';
import 'package:music_player_ui/src/extensions/build_context_extension.dart';
import 'package:music_player_ui/src/widgets/drawer_view.dart';

class PlayListScreen extends StatefulWidget {
  const PlayListScreen({super.key});

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      appBar: AppBar(title: const Text('P L A Y L I S T'),),
      drawer: const DrawerView()
    );
  }
}
