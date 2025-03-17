import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core.dart';

part 'create_product_notifier.g.dart';

@riverpod
class CreateProductNotifier extends _$CreateProductNotifier {
  @override
  FutureOr<File?> build() async {
    return null;
  }

  final ImagePicker picker = ImagePicker();

  Future<void> openGallery() async {
    XFile? imageFile = await picker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      state = AsyncValue.data(File(imageFile.path));
      log("Imagen seleccionada: ${imageFile.path}");
    } else {
      log("No se seleccionó imagen");
    }
  }

  Future<void> openCamera() async {
    if (await PermissionHandler.camera()) {
      XFile? imageFile = await picker.pickImage(source: ImageSource.camera);
      if (imageFile != null) {
        state = AsyncValue.data(File(imageFile.path));
        log("📸 Imagen capturada: ${imageFile.path}");
      } else {
        log("No se capturó imagen");
      }
    }
  }
}
