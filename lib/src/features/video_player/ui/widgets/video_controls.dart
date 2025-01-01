import 'package:assignment/src/features/video_player/logic/video_state.dart';
import 'package:assignment/src/features/video_player/ui/widgets/play_pause_button.dart';
import 'package:assignment/src/features/video_player/ui/widgets/slider_for_seeking.dart';
import 'package:assignment/src/features/video_player/ui/widgets/time_indicators.dart';
import 'package:flutter/material.dart';

class VideoControls extends StatelessWidget {
  const VideoControls({
    super.key,
    required this.state,
  });
  final VideoState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Slider for seeking
        SliderForSeeking(state: state),
        // Time Indicators
        TimeIndicators(
            currentPosition: state.currentPosition,
            totalDuration: state.totalDuration),
        // Play/Pause Button
        PlayPauseButton(
          isPlaying: state.isPlaying,
        ),
      ],
    );
  }
}
