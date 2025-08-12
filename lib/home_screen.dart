import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;

  final List<String> videoUrls = [
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
  ];

  late List<VideoPlayerController?> controllers;
  Map<String, List<Map<String, String>>> videoComments = {};
  Map<String, bool> videoLikes = {};

  @override
  void initState() {
    super.initState();
    controllers = List<VideoPlayerController?>.filled(videoUrls.length, null);
    _initializeControllerAtIndex(0);
    _initializeControllerAtIndex(1);
    _loadComments();
    _loadLikes();
  }

  void _initializeControllerAtIndex(int index) {
    if (index < 0 || index >= videoUrls.length || controllers[index] != null) return;

    final controller = VideoPlayerController.networkUrl(Uri.parse(videoUrls[index]));
    controllers[index] = controller;

    controller.addListener(() {
      if (controller.value.hasError) {
        debugPrint("Video error on ${videoUrls[index]}: ${controller.value.errorDescription}");
      }
      if (controller.value.isInitialized) {
        debugPrint("Video initialized for ${videoUrls[index]}");
      }
      setState(() {});
    });
    void showDownloadSnackBar(BuildContext context) {
      final snackBar = SnackBar(
        backgroundColor: Colors.green.shade700,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        duration: const Duration(seconds: 3),
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'Video download completed! Check your Downloads folder.',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        action: SnackBarAction(
          label: 'Close',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    controller.initialize().timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        debugPrint("Timeout initializing video at index $index");
        setState(() {});
      },
    ).then((_) {
      if (index == currentPage && mounted) {
        controller.play();
      }
      setState(() {});
    }).catchError((error) {
      debugPrint("Error initializing video at index $index: $error");
      setState(() {});
    });
    controller.setLooping(true);
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller?.dispose();
    }
    pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });

    for (int i = 0; i < controllers.length; i++) {
      if (controllers[i] == null) continue;
      if (i == index) {
        controllers[i]!.play();
      } else {
        controllers[i]!.pause();
      }
    }

    _initializeControllerAtIndex(index + 1);
    _initializeControllerAtIndex(index - 1);
  }

  Future<void> _loadComments() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/comments.json');
      if (await file.exists()) {
        final contents = await file.readAsString();
        final Map<String, dynamic> json = jsonDecode(contents);
        setState(() {
          videoComments = json.map((key, value) => MapEntry(
            key,
            (value as List<dynamic>).map((item) => Map<String, String>.from(item)).toList(),
          ));
        });
      }
    } catch (e) {
      debugPrint('Error loading comments: $e');
    }
  }

  Future<void> _saveComments() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/comments.json');
      await file.writeAsString(jsonEncode(videoComments));
    } catch (e) {
      debugPrint('Error saving comments: $e');
    }
  }

  void _addComment(String videoUrl, String comment) {
    setState(() {
      videoComments.putIfAbsent(videoUrl, () => []);
      videoComments[videoUrl]!.add({
        'username': 'User',
        'text': comment,
      });
    });
    _saveComments();
  }

  Future<void> _loadLikes() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/likes.json');
      if (await file.exists()) {
        final contents = await file.readAsString();
        final Map<String, dynamic> json = jsonDecode(contents);
        setState(() {
          videoLikes = json.map((key, value) => MapEntry(key, value as bool));
        });
      }
    } catch (e) {
      debugPrint('Error loading likes: $e');
    }
  }

  Future<void> _saveLikes() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/likes.json');
      await file.writeAsString(jsonEncode(videoLikes));
    } catch (e) {
      debugPrint('Error saving likes: $e');
    }
  }

  void _toggleLike(String videoUrl) {
    setState(() {
      videoLikes[videoUrl] = !(videoLikes[videoUrl] ?? false);
    });
    _saveLikes();
  }

  Future<void> _shareVideo(String videoUrl, int index) async {
    try {
      final uri = Uri.parse(videoUrl);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final tempDir = await getTemporaryDirectory();
        final filePath = '${tempDir.path}/video_$index.mp4';
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

        await Share.shareXFiles(
          [XFile(filePath)],
          text: 'Watch this amazing video!',
        );
      } else {
        debugPrint('Failed to download video: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to download video for share.')),
        );
      }
    } catch (e) {
      debugPrint('Error sharing video: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error in video sharing')),
      );
    }
  }

  Future<bool> _requestStoragePermission() async {
    if (Platform.isAndroid) {
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        final manageStorageStatus = await Permission.manageExternalStorage.request();
        return manageStorageStatus.isGranted;
      }
      return status.isGranted;
    }
    return true; // iOS handles storage differently
  }

  Future<void> _downloadVideo(String videoUrl, Function(bool) setDownloading) async {
    try {
      setDownloading(true);
      final hasPermission = await _requestStoragePermission();
      if (!hasPermission) {
        debugPrint('Storage permission denied');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Storage permission has not been granted.')),
        );
        setDownloading(false);
        return;
      }

      final uri = Uri.parse(videoUrl);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final String downloadPath = Platform.isAndroid
            ? '/storage/emulated/0/Download'
            : (await getApplicationDocumentsDirectory()).path;
        final directory = Directory(downloadPath);
        if (!await directory.exists()) {
          await directory.create(recursive: true);
        }
        final filePath = '$downloadPath/video_${currentPage}_${DateTime.now().millisecondsSinceEpoch}.mp4';
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        debugPrint('Video is downloaded: $filePath');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              Platform.isAndroid
                  ? 'Video downloaded successfully! Check the Downloads folder.'
                  : 'Video downloaded successfully! Check the Files app.',
            ),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
          ),
        );
      } else {
        debugPrint('Failed to download video: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Video download failed')),
        );
      }
    } catch (e) {
      debugPrint('Error downloading video: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('There was an error in downloading the file.')),
      );
    } finally {
      setDownloading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          tooltip: 'পিছনে',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          ' ',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: pageController,
        itemCount: videoUrls.length,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          final controller = controllers[index];
          final videoUrl = videoUrls[index];
          return VideoItemWidget(
            controller: controller,
            videoUrl: videoUrl,
            isLiked: videoLikes[videoUrl] ?? false,
            onLike: () => _toggleLike(videoUrl),
            onComment: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.black.withOpacity(0.8),
              builder: (context) => CommentBottomSheet(
                videoUrl: videoUrl,
                comments: videoComments[videoUrl] ?? [],
                onSendComment: (comment) => _addComment(videoUrl, comment),
              ),
            ),
            onShare: () => _shareVideo(videoUrl, index),
            onDownload: (setDownloading) => _downloadVideo(videoUrl, setDownloading),
            onTap: () {
              if (controller == null || !controller.value.isInitialized) return;
              if (controller.value.isPlaying) {
                controller.pause();
              } else {
                controller.play();
              }
              setState(() {});
            },
            onDoubleTap: () {
              debugPrint("Double tap to like video $index");
              _toggleLike(videoUrl);
            },
            onRetry: () => _initializeControllerAtIndex(index),
          );
        },
      ),
    );
  }
}

class VideoItemWidget extends StatefulWidget {
  final VideoPlayerController? controller;
  final String videoUrl;
  final bool isLiked;
  final VoidCallback onLike;
  final VoidCallback onComment;
  final VoidCallback onShare;
  final Function(Function(bool)) onDownload;
  final VoidCallback onTap;
  final VoidCallback onDoubleTap;
  final VoidCallback onRetry;

  const VideoItemWidget({
    super.key,
    required this.controller,
    required this.videoUrl,
    required this.isLiked,
    required this.onLike,
    required this.onComment,
    required this.onShare,
    required this.onDownload,
    required this.onTap,
    required this.onDoubleTap,
    required this.onRetry,
  });

  @override
  State<VideoItemWidget> createState() => _VideoItemWidgetState();
}

class _VideoItemWidgetState extends State<VideoItemWidget> {
  bool isDownloading = false;

  void setDownloading(bool value) {
    setState(() {
      isDownloading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onDoubleTap: () {
        widget.onDoubleTap();
        if (!widget.isLiked) {
          showGeneralDialog(
            context: context,
            barrierDismissible: true,
            barrierLabel: '',
            pageBuilder: (context, animation, secondaryAnimation) {
              return Center(
                child: ScaleTransition(
                  scale: Tween<double>(begin: 0.5, end: 1.5).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeOut,
                    ),
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 100,
                  ),
                ),
              );
            },
            transitionDuration: const Duration(milliseconds: 300),
            transitionBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: Tween<double>(begin: 1.0, end: 0.0).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOut,
                  ),
                ),
                child: child,
              );
            },
          );
        }
      },
      child: Stack(
        children: [
          if (widget.controller == null || !widget.controller!.value.isInitialized)
            Center(
              child: widget.controller != null && widget.controller!.value.hasError
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'ভিডিও লোডে ত্রুটি',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: widget.onRetry,
                    child: const Text('পুনরায় চেষ্টা করুন'),
                  ),
                ],
              )
                  : const CircularProgressIndicator(color: Colors.white),
            )
          else
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: widget.controller?.value.size.width,
                  height: widget.controller?.value.size.height,
                  child: VideoPlayer(widget.controller!),
                ),
              ),
            ),

          if (widget.controller != null &&
              widget.controller!.value.isInitialized &&
              !widget.controller!.value.isPlaying)
            const Center(
              child: Icon(Icons.play_arrow, color: Colors.white54, size: 110),
            ),

          if (widget.controller != null &&
              widget.controller!.value.isInitialized &&
              widget.controller!.value.isBuffering)
            const Center(
              child: CircularProgressIndicator(color: Colors.white54),
            ),

          if (widget.controller != null && widget.controller!.value.isInitialized)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: VideoProgressIndicator(
                widget.controller!,
                allowScrubbing: true,
                colors: const VideoProgressColors(
                  playedColor: Colors.red,
                  bufferedColor: Colors.grey,
                  backgroundColor: Colors.black26,
                ),
              ),
            ),

          Positioned(
            right: 16,
            bottom: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: widget.isLiked ? Colors.red : Colors.white,
                    size: 35,
                  ),
                  onPressed: widget.onLike,
                  tooltip: 'লাইক',
                ),
                const SizedBox(height: 20),
                IconButton(
                  icon: const Icon(Icons.comment, color: Colors.white, size: 35),
                  onPressed: widget.onComment,
                  tooltip: 'কমেন্ট',
                ),
                const SizedBox(height: 20),
                IconButton(
                  icon: const Icon(Icons.share, color: Colors.white, size: 35),
                  onPressed: widget.onShare,
                  tooltip: 'শেয়ার',
                ),
                const SizedBox(height: 20),
                IconButton(
                  icon: isDownloading
                      ? const CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                      : const Icon(Icons.download_outlined, color: Colors.white, size: 35),
                  onPressed: isDownloading ? null : () => widget.onDownload(setDownloading),
                  tooltip: 'ডাউনলোড',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CommentBottomSheet extends StatefulWidget {
  final String videoUrl;
  final List<Map<String, String>> comments;
  final Function(String) onSendComment;

  const CommentBottomSheet({
    super.key,
    required this.videoUrl,
    required this.comments,
    required this.onSendComment,
  });

  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF4B3850),
              Color(0xFF6A3E53),
              Color(0xFF41373E),
            ]),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  'কমেন্টস',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: widget.comments.isEmpty
                    ? const Center(
                  child: Text(
                    'এখনো কোনো কমেন্ট নেই',
                    style: TextStyle(color: Colors.white54),
                  ),
                )
                    : ListView.builder(
                  controller: scrollController,
                  itemCount: widget.comments.length,
                  itemBuilder: (context, index) {
                    final comment = widget.comments[index];
                    return ListTile(
                      leading: const CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/1674752/pexels-photo-1674752.jpeg?cs=srgb&dl=pexels-tony-james-andersson-249384-1674752.jpg&fm=jpg',
                        ),
                      ),
                      title: Text(
                        comment['username'] ?? 'ব্যবহারকারী',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        comment['text'] ?? '',
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _commentController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'কমেন্ট লিখুন...',
                          hintStyle: const TextStyle(color: Colors.white54),
                          filled: true,
                          fillColor: Color(0xFF4E424C),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(111),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(111),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      child: IconButton(
                        icon: const Icon(Icons.send, color: Colors.blue),
                        onPressed: () {
                          if (_commentController.text.trim().isNotEmpty) {
                            widget.onSendComment(_commentController.text.trim());
                            _commentController.clear();
                            setState(() {});
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
            ],
          ),
        );
      },
    );
  }
}