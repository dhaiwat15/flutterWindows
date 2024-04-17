class CaseModel {
  int? caseId;
  int? patientId;
  String? dateTime;
  String caseTreatedBy;
  String chiefComplaint;
  String caseSymptoms;
  String caseAggravating;
  String caseRelieving;
  String caseReference;
  String casePresentHistory;
  String casePastHistory;
  String caseMedicalHistory;
  String caseSurgicalHistory;
  String caseFamilyHistory;
  String caseObservationPosture;
  String caseObservationWasting;
  String caseObservationOedema;
  String caseObservationSwelling;
  String caseObservationScar;
  String caseObservationDeformity;
  String caseObservationGait;
  String casePalpationTenderness;
  String casePalpationSpasm;
  String casePalpationTemperature;
  String casePalpationAbnormalSound;
  String caseOnExaminationRom;
  String caseOnExaminationMmt;
  String caseOnInvestigationXray;
  String caseOnInvestigationMri;
  String caseOtherInfoReports;
  String caseOtherInfoClinical;

  CaseModel({
    this.caseId,
    this.patientId,
    this.dateTime,
    required this.caseTreatedBy,
    required this.chiefComplaint,
    required this.caseSymptoms,
    required this.caseAggravating,
    required this.caseRelieving,
    required this.caseReference,
    required this.casePresentHistory,
    required this.casePastHistory,
    required this.caseMedicalHistory,
    required this.caseSurgicalHistory,
    required this.caseFamilyHistory,
    required this.caseObservationPosture,
    required this.caseObservationWasting,
    required this.caseObservationOedema,
    required this.caseObservationSwelling,
    required this.caseObservationScar,
    required this.caseObservationDeformity,
    required this.caseObservationGait,
    required this.casePalpationTenderness,
    required this.casePalpationSpasm,
    required this.casePalpationTemperature,
    required this.casePalpationAbnormalSound,
    required this.caseOnExaminationRom,
    required this.caseOnExaminationMmt,
    required this.caseOnInvestigationXray,
    required this.caseOnInvestigationMri,
    required this.caseOtherInfoReports,
    required this.caseOtherInfoClinical,
  });

  factory CaseModel.fromMap(Map<String, dynamic> json) => CaseModel(
        caseId: json['caseId'],
        patientId: json['patientId'],
        dateTime: json['dateTime'],
        chiefComplaint: json['chiefComplaint'],
        caseTreatedBy: json['treatedBy'],
        caseSymptoms: json['symptomsBehaviour'],
        caseAggravating: json['aggravatingFactor'],
        caseRelieving: json['relievingFactor'],
        caseReference: json['referredBy'],
        casePresentHistory: json['patientPresentHistory'],
        casePastHistory: json['patientPastHistory'],
        caseMedicalHistory: json['patientPresentHistory'],
        caseSurgicalHistory: json['patientSurgicalHistory'],
        caseFamilyHistory: json['patientFamilyHistory'],
        caseObservationPosture: json['observationPosture'],
        caseObservationWasting: json['observationWasting'],
        caseObservationOedema: json['observationOedema'],
        caseObservationSwelling: json['observationSwelling'],
        caseObservationScar: json['observationScar'],
        caseObservationDeformity: json['observationDeformity'],
        caseObservationGait: json['observationGait'],
        casePalpationTenderness: json['palpationTenderness'],
        casePalpationSpasm: json['palpationSpasm'],
        casePalpationTemperature: json['palpationTemperature'],
        casePalpationAbnormalSound: json['palpationAbnormalSound'],
        caseOnExaminationMmt: json['mmt'],
        caseOnExaminationRom: json['rom'],
        caseOtherInfoReports: json['otherReports'],
        caseOtherInfoClinical: json['clinicalDiagnosis'],
        caseOnInvestigationXray: json['xray'],
        caseOnInvestigationMri: json['mri'],
      );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "caseId": caseId,
      "patientId": patientId,
      "dateTime": dateTime,
      "treatedBy": caseTreatedBy,
      "chiefComplaint": chiefComplaint,
      "symptomsBehaviour": caseSymptoms,
      "aggravatingFactor": caseAggravating,
      "relievingFactor": caseRelieving,
      "referredBy": caseReference,
      "patientPresentHistory": casePresentHistory,
      "patientPastHistory": casePastHistory,
      "patientMedicalHistory": caseMedicalHistory,
      "patientSurgicalHistory": caseSurgicalHistory,
      "patientFamilyHistory": caseFamilyHistory,
      "observationPosture": caseObservationPosture,
      "observationWasting": caseObservationWasting,
      "observationOedema": caseObservationOedema,
      "observationSwelling": caseObservationSwelling,
      "observationScar": caseObservationScar,
      "observationDeformity": caseObservationDeformity,
      "observationGait": caseObservationGait,
      "palpationTenderness": casePalpationTenderness,
      "palpationSpasm": casePalpationSpasm,
      "palpationTemperature": casePalpationTemperature,
      "palpationAbnormalSound": casePalpationAbnormalSound,
      "mmt": caseOnExaminationMmt,
      "rom": caseOnExaminationRom,
      "otherReports": caseOtherInfoReports,
      "clinicalDiagnosis": caseOtherInfoClinical,
      "xray": caseOnInvestigationXray,
      "mri": caseOnInvestigationMri
    };

    return map;
  }
}
