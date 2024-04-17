import 'package:flutter/cupertino.dart';
import 'package:physiotherapy/Database/main_database_helper.dart';
import 'package:physiotherapy/Database/patient_%20database_component/patient_constants.dart';
import 'package:physiotherapy/Models/add_patient_model.dart';
import 'package:sqflite/sqlite_api.dart';

class PatientDatabaseHelper {
  Future<void> insert(PatientModel patientModel) async {
    final Database? db = await DatabaseHelper.instance.database;
    db?.insert(PatientConstants.tableName, patientModel.toMap());
  }

  Future<List<PatientModel>> getData() async {
    final Database? db = await DatabaseHelper.instance.database;
    final List<Map<String, Object?>> datas =
        await db?.query(PatientConstants.tableName) ?? [];
    return datas.map((e) => PatientModel.fromMap(e)).toList();
  }

  Future<void> update(PatientModel dataModel, int id) async {
    final Database? db = await DatabaseHelper.instance.database;
    await db?.update(PatientConstants.tableName, dataModel.toMap(),
        where: "patientId = ?", whereArgs: [id]);
  }

  Future<void> delete(int id) async {
    final Database? db = await DatabaseHelper.instance.database;
    await db?.delete(PatientConstants.tableName,
        where: "patientId = ?", whereArgs: [id]);
  }

  // Future<void> delete(int id) async {
  //   final Database? db = await DatabaseHelper.instance.database;
  //   await db?.rawQuery('''
  //   DELETE FROM patientTable WHERE patientId  == $id
  //   ''');
  // }

  Future<List<PatientModel>> searchPatient(String keyword) async {
    final db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>>? allRows = await db?.query('patientTable',
        where: 'firstname LIKE ? OR lastname LIKE ? OR number LIKE ? ',
        whereArgs: ['%$keyword%', '%$keyword%', '%$keyword%'],
        orderBy: 'date DESC');
    debugPrint('Rows Fetched :- ${allRows}');
    List<PatientModel> patients =
        allRows.map((patient) => PatientModel.fromMap(patient)).toList();
    print(patients.length);
    return patients;
  }
}
