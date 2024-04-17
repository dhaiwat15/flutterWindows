// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
//
// class DbExport {
//   static final _dbName = 'myDatabase.db';
//
//   Future getDatabase() async {
//
//     final dbPath = await getApplicationDocumentsDirectory();
//     debugPrint('${dbPath}');
//     final path = join(dbPath.path, _dbName);
//
//     var exist = await databaseExists(path);
//
//     if (!exist) {
//       print("Database already exist");
//
//     } else
//
//       {
//
//       print("Creating Database file");
//
//       try {
//         await Directory(dirname(path)).create(recursive: true);
//       } catch (_) {
//         ByteData data = await rootBundle.load(join(dbPath.path, _dbName));
//
//         List<int> bytes =
//             data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
//         await File(path).writeAsBytes(bytes, flush: true);
//       }
//
//       // print("DB Copied");
//     }
//     //   else {
//     //   print("Creating Database file");
//     // }
//
//     await openDatabase(path);
//   }
// }
