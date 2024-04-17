import 'package:flutter/cupertino.dart';
import 'package:physiotherapy/Database/main_database_helper.dart';
import 'package:physiotherapy/Database/treatment_database_components/treatment_constants.dart';
import 'package:physiotherapy/Models/add_treatment_model.dart';
import 'package:sqflite/sqflite.dart';

class TreatmentHelper {
  Future<void> insert(TreatmentModel treatmentModel) async {
    final Database? database = await DatabaseHelper.instance.database;
    database?.insert(TreatmentConstants.tableName, treatmentModel.toMap());

  }

  Future<List<TreatmentModel>> getData() async {
    final Database? database = await DatabaseHelper.instance.database;
    final List<Map<String, Object?>> details =
        await database?.query(TreatmentConstants.tableName) ?? [];
    return details.map((e) => TreatmentModel.fromMap(e)).toList();
  }

  Future<void> update(TreatmentModel treatmentModel, int id) async {
    final Database? database = await DatabaseHelper.instance.database;
    await database?.update(TreatmentConstants.tableName, treatmentModel.toMap(),
        where: "treatment_table_category_id = ?", whereArgs: [id]);
  }

  Future<void> delete(int id) async {
    final Database? database = await DatabaseHelper.instance.database;
    await database?.delete(TreatmentConstants.tableName,
        where: "treatment_table_category_id = ?", whereArgs: [id]);
  }
}
