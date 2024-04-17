import 'package:physiotherapy/Database/main_database_helper.dart';
import 'package:sqflite/sqlite_api.dart';

class GetTreatmentHelper {
  Future<Map<String, dynamic>> getSpecificDetails(int caseId) async {
    final Database? db = await DatabaseHelper.instance.database;

    List<Map<String, dynamic>> allRows = await db!.rawQuery('''
    select * from treatment_table where treatment_table_case_id == $caseId
  ''');
    return allRows.first;
    //return allRows.;
  }
}
