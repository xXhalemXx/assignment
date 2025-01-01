import 'package:assignment/src/core/injection/injection.dart';
import 'package:assignment/src/features/video_player/logic/video_cubit.dart';
import 'package:assignment/src/features/video_player/logic/video_state.dart';
import 'package:assignment/src/features/video_player/ui/widgets/video_controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
      ),
      body: BlocBuilder<VideoCubit, VideoState>(
        builder: (context, state) {
          return Center(
            child: !state.isBuffering
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AspectRatio(
                        aspectRatio: 1.6,
                        child: VideoPlayer(getIt<VideoCubit>().controller),
                      ),
                      VideoControls(
                        state: state,
                      ),
                    ],
                  )
                : const CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
