import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

import '../../../core/bottom_sheet/show_bottom_sheet.dart';
import '../../../data/remote_services/dio_helper.dart';
import '../../../data/remote_services/dio_services.dart';
import '../file_picker_helper.dart';
import '../video_screen.dart';

const maxVideoDur = 6;

class MainProvider extends ChangeNotifier {
  Future<String?> _analyzeVideo(BuildContext context) async {
    final source = await ShowBottomSheet(context).selectImageSource();
    if (source == null) return null;
    final path = source == ImageSource.camera
        ? await FilePickerHelper.recordVideo()
        : await FilePickerHelper.pickVideo();
    return path;
  }

  VideoPlayerController? videoCtrl;

  Future<void> pickVideo(BuildContext context) async {
    try {
      final path = await _analyzeVideo(context);
      if (path == null) return;

      videoCtrl = VideoPlayerController.file(File(path));
      // videoCtrl = VideoPlayerController.contentUri(Uri.parse(
      //     'http://164.90.155.170:5000/download/VID-20240301-WA0086_result.mp4'));
      await videoCtrl!.initialize();
      notifyListeners();

      if (videoCtrl!.value.duration.inSeconds > maxVideoDur) {
        // log('Video must be maximum $maxVideoDur secondes');
        Fluttertoast.showToast(msg: 'Video must be maximum $maxVideoDur secondes');
        return;
      }
      await videoCtrl!.play();
      await videoCtrl!.setLooping(true);

      if (!context.mounted) return;
      Navigator.push(context,
              CupertinoPageRoute(builder: (_) => VideoScreen(videoCtrl!)))
          .then((_) {
        videoCtrl!.dispose();
      });
      await _processVideo(context);
    } catch (e) {
      log('pickVideo Err $e');
      Fluttertoast.showToast(msg: '$e');
    }
  }

  // reProcessVideo() => _processVideo();

  String? videoText;

  _processVideo(BuildContext context) async {
    try {
      EasyLoading.show();
      final path = videoCtrl!.dataSource.replaceFirst('file://', '');
      await Future.delayed(Duration(seconds: 3));
      final response = await DioServices.uploadVideo(path);
      log('${response.runtimeType} response is! Map ${response is! Map} response $response');
      if (response is! Map) {
        throw Exception('${DioHelper.statusCodeCallback(-1)} $response');
      }
      final downloadUrl = response['download_link'].toString();
      
      
      final _videoCtrl = VideoPlayerController.contentUri(Uri.parse(downloadUrl));
      await _videoCtrl.initialize();
      await _videoCtrl.play();
      await _videoCtrl.setLooping(true);

      if (!context.mounted) return;
      Navigator.pushReplacement(context,
              CupertinoPageRoute(builder: (_) => VideoScreen(_videoCtrl)))
          .then((_) {
        _videoCtrl.dispose();
      });


      // final resultVideoPath = await _downloadVideo(downloadUrl);
      // if(resultVideoPath == null) throw Exception('Storage permission is required');
      // notifyListeners();
      
      log("response['transcript'] ${response['transcript']} && videoText $videoText");
    } catch (e) {
      log('selectVideo Err $e');
      Fluttertoast.showToast(msg: '$e');
    } finally {
      EasyLoading.dismiss();
    }
  }

  // Future<String?> _downloadVideo(String url) async {
  //   final isGranted = await _checkPermission();
  //   if(!isGranted) return null;
  //   final savedDir = await _getDisPath();
  //   final fileName = url.getFileName();
  //   await FlutterDownloader.enqueue(
  //     url: url,
  //     headers: {}, // optional: header send with url (auth token etc)
  //     savedDir: savedDir,
  //     fileName: fileName,
  //     // showNotification: true, // show download progress in status bar (for Android)
  //     openFileFromNotification:
  //         true, // click on notification to open downloaded file (for Android)
  //   );
  //   log('savedDir $savedDir fileName $fileName');
  //   return '$savedDir/$fileName';
  // }

  // Future<String> _getDisPath() async {
  //   final _localPath = (await getTemporaryDirectory()).absolute.path;
  //   final savedDir = Directory(_localPath);
  //   if (!savedDir.existsSync()) {
  //     await savedDir.create();
  //   }
  //   return _localPath;
  // }

}


//   Future<bool> _checkPermission() async {
//     if (Platform.isIOS) {
//       return true;
//     }

//     if (Platform.isAndroid) {
//       final info = await DeviceInfoPlugin().androidInfo;
//       if (info.version.sdkInt > 28) {
//         return true;
//       }

//       final status = await Permission.storage.status;
//       if (status == PermissionStatus.granted) {
//         return true;
//       }

//       final result = await Permission.storage.request();
//       return result == PermissionStatus.granted;
//     }

//     throw StateError('unknown platform');
//   }


// extension Str on String{
//   String getFileName() {
//     if (trim().isEmpty) return '';
//     try {
//       var indexOfSlash = lastIndexOf('/');
//       if (indexOfSlash == -1) return this;
//       var fileName = substring(indexOfSlash + 1);
//       if (fileName.isEmpty) throw Exception('fileName.isEmpty');
//       return fileName;
//     } catch (e) {
//       // log('$e');
//       return this;
//     }
//   }
// }