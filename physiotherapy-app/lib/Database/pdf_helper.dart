import 'package:flutter/foundation.dart';
import 'package:physiotherapy/Database/main_database_helper.dart';
import 'package:sqflite/sqlite_api.dart';

class PdfHelper
{

  Future<Map<String, dynamic>> getAllDetails(int patientId) async {

    final Database? db = await DatabaseHelper.instance.database;

    List<Map<String, dynamic>> allRows = await db!.rawQuery('''
  select * from patientTable p, caseTable c where p.patientId == c.patientId 
  and p.patientId == $patientId
  ''');

    debugPrint("allRows length: ${allRows.length}");

    // if(allRows.isNotEmpty)
    // {
    //   debugPrint("in if ");
    //   for (int i = 0 ; i <= allRows.length; i++)
    //   {
    //     debugPrint("allRows length: ${allRows[i]}");
    //     return allRows[i];
    //   }
    // }

    return allRows.first;
  }

  Future<Map<String, dynamic>> getDetails(int caseId) async
  {
   final Database? database = await DatabaseHelper.instance.database;
   List<Map<String, dynamic>> allDetail = await database!.rawQuery('''
   
     ''');
   return allDetail.first;
  }
}
