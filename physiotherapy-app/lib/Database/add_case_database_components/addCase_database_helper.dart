import 'package:flutter/cupertino.dart';
import 'package:physiotherapy/Database/add_case_database_components/addCase_constants.dart';
import 'package:physiotherapy/Database/main_database_helper.dart';
import 'package:physiotherapy/Models/add_case_model.dart';
import 'package:sqflite/sqlite_api.dart';

class CaseDatabaseHelper {
  Future<int?> insert(CaseModel caseModel) async {
    final Database? db = await DatabaseHelper.instance.database;
    var results =
        await db?.insert(CaseConstants.caseTableName, caseModel.toMap());
    debugPrint(" The results received while inserting data :-${results}");
    return results;
  }

  Future<List<CaseModel>> getData() async {
    final Database? db = await DatabaseHelper.instance.database;
    final List<Map<String, Object?>> datas = await db
            ?.query(CaseConstants.caseTableName, orderBy: "dateTime DESC") ??
        [];
    return datas.map((e) => CaseModel.fromMap(e)).toList();
  }

  Future<List<CaseModel>> getPatientsDetail(String patientId) async {
    final Database? db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> allRows = await db!.rawQuery('''
      select * from caseTable WHERE patientId ==  $patientId
  ''');
    return allRows.map((e) => CaseModel.fromMap(e)).toList();
  }

  Future<List<CaseModel>> searchCases(String keyword) async {
    try {

      final db = await DatabaseHelper.instance.database;
      List<Map<String, dynamic>>? allCase = await db?.rawQuery(
          ''' select * from caseTable c, patientTable ct WHERE c.patientId == 
          ct.patientId and ct.number LIKE $keyword 
          ''');


      List<CaseModel> caseModel =
          allCase.map((number) => CaseModel.fromMap(number)).toList();
      return caseModel;
    } on Exception {
      return [];
    }
  }

  Future<void> update(CaseModel caseModel, int id) async {
    final Database? db = await DatabaseHelper.instance.database;
    await db?.update(CaseConstants.caseTableName, caseModel.toMap(),
        where: "caseId = ?", whereArgs: [id]);
  }

  Future<void> delete(int id) async {
    final Database? db = await DatabaseHelper.instance.database;
    await db?.delete(CaseConstants.caseTableName,
        where: "caseId = ?", whereArgs: [id]);
  }
}
