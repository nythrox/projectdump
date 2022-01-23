import 'dart:io';

import 'package:image_picker/image_picker.dart';

abstract class IImageService {
  Future<File> pickImage(ImageSource source);
}

class ImagePickerService implements IImageService {
  @override
  Future<File> pickImage(ImageSource source) async {
    try {
      final result = await ImagePicker.pickImage(source: source);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
