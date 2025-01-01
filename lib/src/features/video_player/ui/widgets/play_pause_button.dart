import 'package:assignment/src/core/injection/injection.dart';
import 'package:assignment/src/features/video_player/logic/video_cubit.dart';
import 'package:flutter/material.dart';

class PlayPauseButton extends StatelessWidget {
  const PlayPauseButton({
    super.key,
    required this.isPlaying,
  });
  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 48,
      icon: Icon(
        isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
      ),
      onPressed: () {
        getIt<VideoCubit>().playPause();
      },
    );
  }
}
