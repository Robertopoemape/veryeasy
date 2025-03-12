import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:veryeasy/core/router/router_provider.gr.dart';

import '../../../components/components.dart';
import '../../../core/router/router.dart';
import '../providers/video_ad_notifier.dart';

@RoutePage()
class VideoAdsScreen extends ConsumerWidget {
  const VideoAdsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoAdsAsync = ref.watch(videoAdNotifierProvider);

    return Scaffold(
      body: videoAdsAsync.when(
        data: (videos) => videos.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(child: Text('No hay anuncios disponibles')),
                  ElevatedButton(
                    onPressed: () {
                      autoRouterPush(context, UploadVideoRoute());
                    },
                    child: const Text('Subir Anuncio'),
                  )
                ],
              )
            : ListView.builder(
                itemCount: videos.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(videos[index].title),
                  subtitle: Text(videos[index].description),
                  onTap: () async {
                    final url = Uri.parse(videos[index].videoUrl);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('No se pudo abrir el video')),
                      );
                    }
                  },
                ),
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: CompFloactingActionButton(
        heroTag: 'video_ads_fab',
        onPressed: () => ref.read(videoAdNotifierProvider.notifier).refresh(),
      ),
    );
  }
}
