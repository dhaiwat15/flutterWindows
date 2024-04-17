import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:filesystem_picker/filesystem_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:physiotherapy/Database/main_database_helper.dart';
import 'package:sqflite/sqflite.dart';

class ExportImportPage extends StatefulWidget {
  const ExportImportPage({Key? key}) : super(key: key);

  @override
  _ExportImportPageState createState() => _ExportImportPageState();
}

class _ExportImportPageState extends State<ExportImportPage> {
  Directory? rootPath;
  String? filePath;
  String? dirPath;
  FileTileSelectMode filePickerSelectMode = FileTileSelectMode.checkButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: buildElevatedButtons(
                text: "Export Database",
                onPressed: () async {
                  exportDatabase();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: buildElevatedButtons(
                text: "Import Database",
                onPressed: () async {
                  final pickedFile = Platform.isWindows
                      ? await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ["db"],
                        )
                      : await FilePicker.platform.pickFiles();
                  String? pickedFilePath = pickedFile?.files.first.path;
                  if (pickedFilePath.contains(".db")) {
                    buildDialogue(context, pickedFilePath);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildElevatedButtons({required String text, VoidCallback? onPressed}) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }

  Future<void> exportDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String newPath = join(documentDirectory.path, "myDatabase.db");
    String? selectedPath = await FilePicker.platform.getDirectoryPath();
    final exist = await databaseExists(newPath);
    print(exist);
    if (exist) {
      //TODO: remaining to specify / and \\
      File(newPath).copySync("$selectedPath/databaseBackup.db");
    }
  }

  Future<void> importDatabaseFile(String pickedFilePath) async {
    String documentDirectoryPath =
        (await getApplicationDocumentsDirectory()).path;
    DatabaseHelper.instance.closeDatabase().then((value) async {
      String existingDatabasePath =
          join(documentDirectoryPath, "myDatabase.db");
      File existingDatabaseFile = File(existingDatabasePath);
      String? newDatabasePath = pickedFilePath;
      File newFile = File(newDatabasePath);
      existingDatabaseFile.delete();
      newFile.copy("$documentDirectoryPath\\myDatabase.db");
    }).then(
      (value) {
        DatabaseHelper.instance.openExistingDatabase();
      },
    );
  }

  buildDialogue(BuildContext context, String pickedFilePath) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                importDatabaseFile(pickedFilePath);
              },
              child: Text("Yes")),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("No"))
        ],
        title: Text("Import Database"),
        content: Text("Are you sure? \nIt will be delete your existing data!"),
      ),
    );
  }
}
