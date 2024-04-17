import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {

  final path = (await getApplicationDocumentsDirectory()).path;

  final file = File('$path/$fileName');

  await file.writeAsBytes(bytes, flush: true);

  OpenFile.open('$path/$fileName');
}

// Future<File> saveAndLaunchFile(String userPath,PlatformFile file, String
// filename)
// async {
//
//   final applicationPath = await userPath;
//
//   final file = File('${applicationPath}/${filename}');
//
//   return File(file.path).copy(file.path);
// }
