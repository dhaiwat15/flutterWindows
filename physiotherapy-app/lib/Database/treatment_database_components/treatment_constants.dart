class TreatmentConstants {
  static final tableName = "treatment_table";
  static final treatmentId = "treatment_table_category_id";
  static final treatmentCategory = "treatment_table_category";
  static final treatmentSubCategory = "treatment_table_sub_category";

  static String getCreateTableQuery() {
    return ''' 
    CREATE TABLE $tableName(
    $treatmentId INTEGER PRIMARY KEY,
    $treatmentCategory TEXT,
    $treatmentSubCategory TEXT
   )
    ''';
  }
}
