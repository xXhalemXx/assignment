import 'package:assignment/src/core/injection/injection.dart';
import 'package:assignment/src/features/video_player/logic/video_cubit.dart';
import 'package:assignment/src/features/video_player/logic/video_state.dart';
import 'package:flutter/material.dart';

class SliderForSeeking extends StatelessWidget {
  const SliderForSeeking({super.key, required this.state});
  final VideoState state;

  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0.0,
      max: state.totalDuration.inMilliseconds.toDouble(),
      value: state.currentPosition.inMilliseconds.toDouble().clamp(
            0.0,
            state.totalDuration.inMilliseconds.toDouble(),
          ),
      onChanged: (value) {
        getIt<VideoCubit>().seekTo(Duration(milliseconds: value.toInt()));
      },
    );
  }
}
