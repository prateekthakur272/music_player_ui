import 'package:flutter/material.dart';
import 'package:music_player_ui/src/extensions/build_context_extension.dart';

class NeuBox extends StatelessWidget{
  final Widget child;
  const NeuBox({super.key, required this.child});

  @override
  Widget build(BuildContext context){
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: context.colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 15,
            offset: const Offset(4, 4)
          ),
          const BoxShadow(
              color: Colors.white,
              blurRadius: 15,
              offset: Offset(-4, -4)
          ),
        ]
      ),
      child: child,
    );
  }
}