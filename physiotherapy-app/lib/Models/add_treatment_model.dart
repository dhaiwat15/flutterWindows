class TreatmentModel {
  int? treatmentId;
  String treatmentCategory;
  String treatmentSubCategory;

  TreatmentModel({
    this.treatmentId,
    required this.treatmentCategory,
    required this.treatmentSubCategory,
  });

  factory TreatmentModel.fromMap(Map<String, dynamic> json) => TreatmentModel(
      treatmentId: json['treatment_table_category_id'],
      treatmentCategory: json['treatment_table_category'],
      treatmentSubCategory: json['treatment_table_sub_category']);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "treatment_table_category_id": treatmentId,
      "treatment_table_category": treatmentCategory,
      "treatment_table_sub_category": treatmentSubCategory,
    };

    return map;
  }
}
