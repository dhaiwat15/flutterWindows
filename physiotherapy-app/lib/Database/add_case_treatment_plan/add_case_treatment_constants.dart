class CaseTreatmentConstants {
  static final tableName = 'case_treatment_table';
  static final idColumn = 'case_treatment_id';
  static final cidColumn = 'case_treatment_cid';
  static final tidColumn = 'case_treatment_tid';
  static final decColumnOne = 'case_treatment_description';

  static String getCaseTreatmentQuery() {
    return ''' 
 CREATE TABLE $tableName(
 $idColumn INTEGER PRIMARY KEY,
 $cidColumn INTEGER,
 $tidColumn INTEGER,
 $decColumnOne TEXT,
 
   FOREIGN KEY (case_treatment_cid) REFERENCES caseTable (caseId),
   FOREIGN KEY(case_treatment_tid) REFERENCES treatment_table (treatment_table_category_id) 
       ON DELETE CASCADE
 )
 ''';
  }
}
