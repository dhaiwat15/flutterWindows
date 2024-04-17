import 'package:physiotherapy/Database/appointment_database_component/appointment_constants.dart';
import 'package:physiotherapy/Database/main_database_helper.dart';
import 'package:physiotherapy/Models/add_appointment_model.dart';
import 'package:sqflite/sqlite_api.dart';

class AppointmentDatabaseHelper {
  Future<void> insert(AppointmentModel appointmentModel) async {
    final Database? db = await DatabaseHelper.instance.database;
    db?.insert(AppointmentConstants.tableName, appointmentModel.toMap());
  }

  Future<List<AppointmentModel>> getData() async {
    final Database? db = await DatabaseHelper.instance.database;
    final List<Map<String, Object?>> datas =
        await db?.query(AppointmentConstants.tableName) ?? [];
    return datas.map((e) => AppointmentModel.fromMap(e)).toList();
  }

  Future<void> update(AppointmentModel appointmentModel, int id) async {
    final Database? db = await DatabaseHelper.instance.database;
    await db?.update(AppointmentConstants.tableName, appointmentModel.toMap(),
        where: "id = ?", whereArgs: [id]);
  }

  Future<void> delete(int id) async {
    final Database? db = await DatabaseHelper.instance.database;
    await db?.delete(AppointmentConstants.tableName,
        where: "id = ?", whereArgs: [id]);
  }
}
