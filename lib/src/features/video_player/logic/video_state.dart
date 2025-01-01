import 'package:equatable/equatable.dart';

class VideoState extends Equatable {
  final bool isPlaying;
  final bool isBuffering;
  final Duration currentPosition;
  final Duration totalDuration;

  const VideoState({
    this.isPlaying = false,
    this.isBuffering = true,
    this.currentPosition = const Duration(),
    this.totalDuration = const Duration(),
  });

  VideoState copyWith({
    bool? isPlaying,
    bool? isBuffering,
    Duration? currentPosition,
    Duration? totalDuration,
  }) {
    return VideoState(
      isPlaying: isPlaying ?? this.isPlaying,
      isBuffering: isBuffering ?? this.isBuffering,
      currentPosition: currentPosition ?? this.currentPosition,
      totalDuration: totalDuration ?? this.totalDuration,
    );
  }

  @override
  List<Object> get props =>
      [isPlaying, currentPosition, totalDuration, isBuffering];
}
