class PatientConstants {
  static final tableName = "patientTable";
  static final columnId = 'patientId';
  static final columnAbbreviation = 'abbreviation';
  static final columnFirstName = 'firstname';
  static final columnMiddleName = 'middlename';
  static final columnAge = 'age';
  static final columnAddress = 'address';
  static final columnCity = 'city';
  static final columnPincode = 'pincode';
  static final columnNumber = 'number';
  static final columnAlternativeNumber = 'alternative_Number';
  static final columnGender = 'gender';
  static final columnLastName = 'lastname';
  static final columnOccupation = 'occupation';
  static final columnDateTime = 'date';

  static String getCreateTableQuery() {
    return '''
     
      CREATE TABLE $tableName(
      $columnId INTEGER PRIMARY KEY ,
      $columnAbbreviation TEXT,
      $columnFirstName TEXT,
      $columnLastName TEXT ,
      $columnMiddleName TEXT,
      $columnAge TEXT ,
      $columnCity TEXT,
      $columnAddress TEXT,
      $columnPincode TEXT,
      $columnGender BOOLEAN,
      $columnNumber TEXT ,
      $columnAlternativeNumber TEXT ,
      $columnOccupation TEXT,
      $columnDateTime TEXT
   )
    
     ''';
  }
}
