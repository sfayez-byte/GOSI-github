import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

import 'providers/main_provider.dart';

final imagePicker = ImagePicker();

class FilePickerHelper {
  static Future<String?> pickVideo() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp4'],
      withData: true,
      dialogTitle: 'Please select a video:',
    );
    if (result == null) return null;
    print('result.files.single.size ${result.files.single.size}');
    return result.files.single.path!;
  }

  static Future<String?> recordVideo() async {
    final result = await imagePicker.pickVideo(
        source: ImageSource.camera,
        maxDuration: const Duration(seconds: maxVideoDur));
    if (result == null) return null;
    return result.path;
  }
}
