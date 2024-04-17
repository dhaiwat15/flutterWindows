import 'package:flutter/material.dart';
import 'package:physiotherapy/Components/text_components.dart';
import 'package:physiotherapy/Models/add_treatment_model.dart';
import 'package:sizer/sizer.dart';

class TreatmentDataCard extends StatefulWidget {
  const TreatmentDataCard({
    Key? key,
    required this.treatmentModel,
    required this.edit,
    required this.delete,
    required this.index,
  }) : super(key: key);

  final TreatmentModel treatmentModel;
  final Function edit;
  final Function delete;
  final int index;

  @override
  _TreatmentDataCardState createState() => _TreatmentDataCardState();
}

class _TreatmentDataCardState extends State<TreatmentDataCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          buildCommonText(
              text: 'Category: ${widget.treatmentModel.treatmentCategory}'),
          SizedBox(width: 2.w),
          buildCommonText(
              text:
                  'Sub Category: ${widget.treatmentModel.treatmentSubCategory}')
        ],
      ),
      subtitle: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(1.0.w),
            child: CircleAvatar(
              child: IconButton(
                onPressed: () {
                  widget.delete(widget.index);
                },
                icon: Icon(Icons.delete),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(1.0.w),
            child: CircleAvatar(
              child: IconButton(
                onPressed: () {
                  widget.edit(widget.index);
                },
                icon: Icon(Icons.edit),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
