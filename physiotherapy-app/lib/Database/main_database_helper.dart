import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:physiotherapy/Database/add_case_database_components/addCase_constants.dart';
import 'package:physiotherapy/Database/add_case_treatment_plan/add_case_treatment_constants.dart';
import 'package:physiotherapy/Database/patient_%20database_component/patient_constants.dart';
import 'package:physiotherapy/Database/treatment_database_components/treatment_constants.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _dbName = 'myDatabase.db';
  static final _dbVersion = 4;

  // Singleton Class

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await _initiateDatabase();
    return _database;
  }

  Future<Database> _initiateDatabase() async {
    String path =
        join((await getApplicationDocumentsDirectory()).path, _dbName);
    debugPrint("path of db = $path");
    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
      onConfigure: _onConfigure,
    );
  }

  Future _onCreate(Database db, int version) async {
    //Create Patient table
    final String createPatientTableQuery =
        PatientConstants.getCreateTableQuery();
    await db.execute(createPatientTableQuery);

    final String createTreatmentTableQuery =
        TreatmentConstants.getCreateTableQuery();
    await db.execute(createTreatmentTableQuery);

    final String createCaseTableQuery = CaseConstants.getCreateTableQuery();
    debugPrint(
        "DatabaseHelper - initDatabase - CreateCaseTableQuery: $createCaseTableQuery");
    await db.execute(createCaseTableQuery);

    final String createCaseTreatmentQuery =
        CaseTreatmentConstants.getCaseTreatmentQuery();
    await db.execute(createCaseTreatmentQuery);
  }

  Future _onConfigure(Database db) async {
    await db.execute("PRAGMA foreign_keys = ON");
  }

  Future<void> closeDatabase() async {
    var db = await instance.database;
    print(db?.isOpen ?? null.toString());
    if (db?.isOpen ?? false) {
      await db?.close();
    }

    _database = null;
  }

  Future<void> openExistingDatabase() async {
    await database;
  }
}
