class AddCaseTreatmentModel {
  int? primaryTreatmentID;
  int? treatmentCaseID;
  int? treatmentTableID;
  String? treatmentDescription;

  AddCaseTreatmentModel(
      {
        ////// CASE TREATMENT ID REFERS TO THE PRIMARY KEY TREATMENT TABLE
        // (WIDGET)
        this.primaryTreatmentID,
        ////// CASE TREATMENT ID REFERS TO THE CASE ID (WIDGET)
      this.treatmentCaseID,
      this.treatmentTableID,
      this.treatmentDescription,
      });

  factory AddCaseTreatmentModel.fromMap(Map<String, dynamic> json) =>
      AddCaseTreatmentModel(
        primaryTreatmentID: json["case_treatment_id"],
        treatmentCaseID: json["case_treatment_cid"],
        treatmentTableID: json["case_treatment_tid"],
        treatmentDescription: json["case_treatment_description"],
      );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "case_treatment_id": primaryTreatmentID,
      "case_treatment_cid": treatmentCaseID,
      "case_treatment_tid": treatmentTableID,
      "case_treatment_description": treatmentDescription,
    };
    return map;
  }
}
