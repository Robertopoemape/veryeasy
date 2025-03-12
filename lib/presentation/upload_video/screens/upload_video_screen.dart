import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class UploadVideoScreen extends ConsumerStatefulWidget {
  const UploadVideoScreen({super.key});

  @override
  ConsumerState<UploadVideoScreen> createState() => _UploadVideoScreenState();
}

class _UploadVideoScreenState extends ConsumerState<UploadVideoScreen> {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final categoryController = TextEditingController();
  final urlController = TextEditingController();

/*
  Future<void> _uploadVideo() async {
    if (titleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
                Text("Por favor selecciona un video y completa los campos.")),
      );
      return;
    }

    final videoAd = VideoAd(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: titleController.text,
      description: descController.text,
      category: categoryController.text,
      videoUrl: urlController.text,
      createdAt: DateTime.now(),
      client: "Cliente Demo",
      campaign: "Campaña Demo",
      duration: const Duration(seconds: 30),
    );

    final result = await ref.read(uploadVideoProvider).call(videoAd);
    result.fold(
      (failure) => ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: ${failure.message}"))),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Video subido correctamente.")));
        Navigator.pop(context);
      },
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Subir Anuncio")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Título")),
            TextField(
                controller: descController,
                decoration: const InputDecoration(labelText: "Descripción")),
            TextField(
                controller: categoryController,
                decoration: const InputDecoration(labelText: "Categoría")),
            const SizedBox(height: 10),
            TextField(
                controller: urlController,
                decoration: const InputDecoration(labelText: "url video")),
            Text("Video seleccionado: ${urlController.text}"),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {} //_uploadVideo
                ,
                child: const Text("Subir Anuncio")),
          ],
        ),
      ),
    );
  }
}
