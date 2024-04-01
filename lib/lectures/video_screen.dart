import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class VideoScreen extends StatefulWidget {
  final String videoPath;

  VideoScreen({required this.videoPath});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      final videoUrl = await _getVideoUrl(widget.videoPath);
      _videoPlayerController = VideoPlayerController.network(videoUrl);
      await _videoPlayerController.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        aspectRatio: _videoPlayerController.value.aspectRatio,
        autoPlay: true,
        looping: false,
      );

      if (mounted) {
        setState(() {}); // Trigger a rebuild after initialization
      }
    } catch (error) {
      print('Error initializing video: $error');
    }
  }

  Future<String> _getVideoUrl(String videoPath) async {
    final ref =
        firebase_storage.FirebaseStorage.instance.ref().child(videoPath);
    return await ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    if (_chewieController != null &&
        _chewieController.videoPlayerController.value.isInitialized) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Video Lecture:'),
        ),
        body: Column(
          children: [
            Chewie(controller: _chewieController),
            Spacer(),
            Text('For More Videos: Follow our youtube channel'),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
