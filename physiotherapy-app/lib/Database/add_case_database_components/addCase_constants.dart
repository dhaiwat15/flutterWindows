class CaseConstants {
  static final caseTableName = "caseTable";
  static final caseDateTime = 'dateTime';
  static final caseId = 'caseId';
  static final caseTreatedBy = 'treatedBy';
  static final caseChiefComplaint = 'chiefComplaint';
  static final caseSymptoms = 'symptomsBehaviour';
  static final caseAggravating = 'aggravatingFactor';
  static final caseRelieving = 'relievingFactor';
  static final caseReference = 'referredBy';
  static final casePresentHistory = 'patientPresentHistory';
  static final casePastHistory = 'patientPastHistory';
  static final caseMedicalHistory = 'patientMedicalHistory';
  static final caseSurgicalHistory = 'patientSurgicalHistory';
  static final caseFamilyHistory = 'patientFamilyHistory';
  static final caseObservationPosture = 'observationPosture';
  static final caseObservationWasting = 'observationWasting';
  static final caseObservationOedema = 'observationOedema';
  static final caseObservationScar = 'observationScar';
  static final caseObservationDeformity = 'observationDeformity';
  static final caseObservationGait = 'observationGait';
  static final caseObservationSwelling = 'observationSwelling';
  static final casePalpationTenderness = 'palpationTenderness';
  static final casePalpationSpasm = 'palpationSpasm';
  static final casePalpationTemperature = 'palpationTemperature';
  static final casePalpationAbnormalSound = 'palpationAbnormalSound';
  static final caseOnExaminationRom = 'rom';
  static final caseOnExaminationMmt = 'mmt';
  static final caseOnInvestigationXray = 'xray';
  static final caseOnInvestigationMri = 'mri';
  static final caseOtherInfoReports = 'otherReports';
  static final caseOtherInfoClinical = 'clinicalDiagnosis';

  static String getCreateTableQuery() {
    return '''
      CREATE TABLE $caseTableName(
      patientId INTEGER,
      $caseId INTEGER PRIMARY KEY,
      $caseDateTime TEXT,
      $caseTreatedBy TEXT,
      $caseChiefComplaint TEXT,
      $caseSymptoms TEXT,
      $caseAggravating TEXT,
      $caseRelieving TEXT,
      $caseReference TEXT,
      $casePresentHistory TEXT,
      $casePastHistory TEXT,
      $caseMedicalHistory TEXT,
      $caseSurgicalHistory TEXT,
      $caseFamilyHistory TEXT,
      $caseObservationPosture TEXT,
      $caseObservationWasting TEXT,
      $caseObservationOedema TEXT,
      $caseObservationSwelling TEXT,
      $caseObservationScar TEXT,
      $caseObservationDeformity TEXT,
      $caseObservationGait TEXT,
      $casePalpationTenderness TEXT,
      $casePalpationSpasm TEXT,
      $casePalpationTemperature TEXT,
      $casePalpationAbnormalSound TEXT,
      $caseOnExaminationRom TEXT,
      $caseOnExaminationMmt TEXT,
      $caseOnInvestigationXray TEXT,
      $caseOnInvestigationMri TEXT,
      $caseOtherInfoReports TEXT,
      $caseOtherInfoClinical TEXT,
  
       FOREIGN KEY (patientId)  REFERENCES patientTable (patientId) 
       ON DELETE CASCADE
  
   )

     ''';
  }
}
