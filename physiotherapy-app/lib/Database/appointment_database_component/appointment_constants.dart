class AppointmentConstants {
  static final tableName = "appointmentTable";

  static final columnId = 'id';
  static final columnName = 'name';
  static final columnAge = 'age';
  static final columnAddress = 'address';
  static final columnNumber = 'number';
  static final columnGender = 'gender';
  static final columnDescription = 'description';
  static final columnDateTime = 'datetime';

  static String getCreateTableQuery() {
    return '''
      CREATE TABLE $tableName(
      $columnId INTEGER PRIMARY KEY ,
      $columnName TEXT,
      $columnAge TEXT ,
      $columnGender BOOLEAN,
      $columnAddress TEXT,
      $columnNumber TEXT UNIQUE,
      $columnDescription TEXT,
      $columnDateTime TEXT 
   )
  
     ''';
  }
}
