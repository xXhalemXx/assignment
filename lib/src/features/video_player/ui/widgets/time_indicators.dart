import 'package:assignment/src/core/injection/injection.dart';
import 'package:assignment/src/features/video_player/logic/video_cubit.dart';
import 'package:flutter/material.dart';

class TimeIndicators extends StatelessWidget {
  const TimeIndicators(
      {super.key, required this.currentPosition, required this.totalDuration});
  final Duration currentPosition;
  final Duration totalDuration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            getIt<VideoCubit>().formatDuration(currentPosition),
          ),
          Text(
            getIt<VideoCubit>().formatDuration(totalDuration),
          ),
        ],
      ),
    );
  }
}
