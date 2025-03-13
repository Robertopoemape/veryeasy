import 'dart:convert';
import 'dart:developer';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import 'package:veryeasy/core/core.dart';

import '../../../components/components.dart';

@RoutePage()
class GeneratorIAScreen extends StatefulWidget {
  const GeneratorIAScreen({super.key});

  @override
  State<GeneratorIAScreen> createState() => _GeneratorIAScreenState();
}

class _GeneratorIAScreenState extends State<GeneratorIAScreen> {
  bool isLoading = false;

  Future<void> generateVideo() async {
    setState(() {
      isLoading = true;
    });

    try {
      // 1️⃣ Generar UUID
      final aiTraceId = const Uuid().v4();
      log('Ai-trace-id: $aiTraceId');

      // 2️⃣ Obtener API Key desde el archivo .env
      final apiKey = dotenv.env['AI_API_TOKEN'];
      if (apiKey == null || apiKey.isEmpty) {
        log('Error: API key no configurada.');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('API key no configurada.')),
        );
        setState(() => isLoading = false);
        return;
      }

      // 3️⃣ Construir los headers y el body de la solicitud
      var headers = {
        'API-KEY': apiKey,
        'Ai-trace-id': aiTraceId,
        'Content-Type': 'application/json'
      };

      var requestBody = json.encode({
        "duration": 72,
        "img_id": 1,
        "model": "occaecat",
        "motion_mode": "nostrud sint",
        "negative_prompt": "Excepteur",
        "prompt": "nostrud magna",
        "quality": "aute in",
        "seed": 89,
        "style": "labore amet qui fugiat",
        "template_id": 66,
        "water_mark": true
      });

      // 4️⃣ Crear la solicitud POST usando `http.Request`
      var request = http.Request(
          'POST',
          Uri.parse(
              'https://app-api.pixverse.ai/openapi/v2/video/img/generate'))
        ..body = requestBody
        ..headers.addAll(headers);

      // 5️⃣ Enviar la solicitud
      http.StreamedResponse response = await request.send();

      // 6️⃣ Manejar la respuesta
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        log('✅ Video generado con éxito: $responseBody');

        final data = jsonDecode(responseBody);
        final videoId = data['resp']?['video_id'];
        log('📹 Video ID: $videoId');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Video generado con ID: $videoId')),
        );
      } else {
        var errorResponse = await response.stream.bytesToString();
        log('❌ Error en la solicitud: ${response.statusCode}');
        log('📝 Respuesta: $errorResponse');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $errorResponse')),
        );
      }
    } catch (e) {
      log('⚠️ Excepción: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(ds16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Presiona el botón para generar un video con IA',
              textAlign: TextAlign.center,
              style: ComTextStyle.h6.w500,
            ),
            gap20,
            CompButton(
                name: 'Generar video',
                width: 140,
                onPressed: () async {
                  await generateVideo();
                }),
          ],
        ),
      ),
    );
  }
}
