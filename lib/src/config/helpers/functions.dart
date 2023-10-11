import 'dart:io';
import 'dart:math';
import 'package:intl/intl.dart';

// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

Future<Map<String, int>> dirStat(String dirPath) async {
  int fileNum = 0;
  int totalSize = 0;
  var dir = Directory(dirPath);
  try {
    if (dir.existsSync()) {
      final List<FileSystemEntity> entities =
          await dir.list(recursive: true, followLinks: false).toList();
      for (FileSystemEntity entity in entities) {
        if (entity is File) {
          fileNum++;
          totalSize += entity.lengthSync();
        }
      }
    }
  } catch (e) {
    print(e.toString());
  }

  return {'fileNum': fileNum, 'size': totalSize};
}

String formatBytes(int bytes, int decimals) {
  if (bytes <= 0) return "0 B";
  const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
  var i = (log(bytes) / log(1024)).floor();
  return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
}

// Future<String> getPath(String name) async {
//   final Directory? downloadFolder = await getExternalStorageDirectory();
//   // final String guidFolder = '${guid.substring(0, 3)}/';
//   final String folder = name.substring(0, 2);
//   final filePath = Directory('${downloadFolder?.path}/$folder/');
//   if (await filePath.exists()) {
//     return filePath.path + name;
//   } else {
//     await filePath.create(recursive: true);
//     return filePath.path + name;
//   }
// }

String getFileExtension(String fileName) {
  try {
    return '.${fileName.split('.').last}';
  } catch (e) {
    return '.pdf';
  }
}

// isStoragePermission() async {
//   var isStorage = await Permission.storage.status;
//   if (!isStorage.isGranted) {
//     await Permission.storage.request();
//     if (!isStorage.isGranted) {
//       return false;
//     } else {
//       return true;
//     }
//   } else {
//     return true;
//   }
// }

final dateFormatter = DateFormat('dd MMMM yyyy', 'ru');
