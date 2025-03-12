/*import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TikTokVideoPlayer extends StatefulWidget {
  final String videoUrl;
  const TikTokVideoPlayer({super.key, required this.videoUrl});

  @override
  State<TikTokVideoPlayer> createState() => _TikTokVideoPlayerState();
}

class _TikTokVideoPlayerState extends State<TikTokVideoPlayer> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.videoUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ver Anuncio")),
      body: WebViewWidget(controller: controller),
    );
  }
}
*/
