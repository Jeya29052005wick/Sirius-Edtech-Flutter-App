import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final String videoUrl;

  const VideoScreen({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _videoController;
  ChewieController? _chewieController;
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    print("🎥 Trying to load video: ${widget.videoUrl}");
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      _videoController = VideoPlayerController.network(widget.videoUrl);
      await _videoController.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoController,
        autoPlay: true,
        looping: false,
        errorBuilder: (context, errorMessage) {
          return Center(child: Text("⚠️ Error: $errorMessage"));
        },
      );

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print("💥 Video load error: $e");
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _videoController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Course Video")),
      body: isLoading
          ? const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Colors.black),
            SizedBox(height: 16),
            Text(
              "Loading video...",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      )
          : hasError
          ? const Center(
        child: Text(
          "Failed to load video.",
          style: TextStyle(color: Colors.red),
        ),
      )
          : Chewie(controller: _chewieController!),
    );
  }
}
