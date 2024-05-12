import 'package:flutter/material.dart';
import 'package:music_player_ui/src/extensions/build_context_extension.dart';
import 'package:music_player_ui/src/extensions/int_space_extension.dart';
import 'package:music_player_ui/src/screens/settings_screen.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.colorScheme.background,
      child: Column(
        children: [
          SizedBox(
            height: 240,
              child: Center(
            child: Icon(
              Icons.music_note,
              size: 56,
              color: context.colorScheme.inversePrimary,
            ),
          )),
          Padding(
            padding: 24.horizontal,
            child: ListTile(
              title: const Text('H O M E'),
              leading: const Icon(Icons.home),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: 24.horizontal,
            child: ListTile(
              title: const Text('S E T T I N G S'),
              leading: const Icon(Icons.settings),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const SettingsScreen()));
              },
            ),
          )
        ],
      ),
    );
  }
}
