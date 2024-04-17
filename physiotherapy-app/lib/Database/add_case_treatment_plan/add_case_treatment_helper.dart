import 'package:physiotherapy/Database/add_case_treatment_plan/add_case_treatment_constants.dart';
import 'package:physiotherapy/Database/main_database_helper.dart';
import 'package:physiotherapy/Models/add_case_treatment_model.dart';
import 'package:physiotherapy/Models/add_patient_model.dart';
import 'package:sqflite/sqflite.dart';

class CaseTreatmentHelper {
  Future<void> insert(AddCaseTreatmentModel addCaseTreatmentModel) async {
    final Database? tDatabase = await DatabaseHelper.instance.database;
    tDatabase?.insert(
        CaseTreatmentConstants.tableName, addCaseTreatmentModel.toMap());
  }

  Future<List<AddCaseTreatmentModel>> getData() async {
    final Database? db = await DatabaseHelper.instance.database;
    final List<Map<String, Object?>> datas =
        await db?.query(CaseTreatmentConstants.tableName) ?? [];
    return datas.map((e) => AddCaseTreatmentModel.fromMap(e)).toList();
  }

  Future<List<PatientModel>> getAllPatientDetails(String caseId) async {
    final db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> allRows = await db!.rawQuery('''
    SELECT * FROM caseTable
    WHERE caseId = $caseId
    ''');
    List<PatientModel> contacts =
        allRows.map((contact) => PatientModel.fromMap(contact)).toList();
    return contacts;
  }

  Future<void> update(
      AddCaseTreatmentModel addCaseTreatmentModel, int id) async {
    final Database? db = await DatabaseHelper.instance.database;
    await db?.update(
        CaseTreatmentConstants.tableName, addCaseTreatmentModel.toMap(),
        where: "treatment_table = ?", whereArgs: [id]);
  }

  Future<void> delete(int id) async {
    final Database? db = await DatabaseHelper.instance.database;
    await db?.delete(CaseTreatmentConstants.tableName,
        where: "treatment_table_category_id = ?", whereArgs: [id]);
  }
}
