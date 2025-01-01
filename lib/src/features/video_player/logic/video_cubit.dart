import 'package:assignment/src/features/video_player/logic/video_state.dart';
import 'package:bloc/bloc.dart';
import 'package:video_player/video_player.dart';

class VideoCubit extends Cubit<VideoState> {
  late VideoPlayerController controller;

  VideoCubit() : super(const VideoState()) {
    // Listen to changes in the video controller
  }

  void initialize() {
    controller = VideoPlayerController.asset('assets/videos/sample_video.mp4')
      ..initialize().then((_) {
        emit(
          state.copyWith(
            isBuffering: false,
            isPlaying: controller.value.isPlaying,
            currentPosition: controller.value.position,
            totalDuration: controller.value.duration,
          ),
        );
      });
    controller.addListener(_videoListener);
  }

  getVideoController() {
    return controller;
  }

  void _videoListener() {
    emit(state.copyWith(
      isPlaying: controller.value.isPlaying,
      currentPosition: controller.value.position,
      totalDuration: controller.value.duration,
    ));
  }

  void playPause() {
    if (controller.value.isPlaying) {
      controller.pause();
    } else {
      controller.play();
    }
  }

  void seekTo(Duration position) {
    controller.seekTo(position);
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Future<void> close() {
    controller.removeListener(_videoListener);
    controller.dispose();
    return super.close();
  }
}
