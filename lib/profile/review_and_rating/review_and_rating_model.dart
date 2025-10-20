import '/flutter_flow/flutter_flow_util.dart';
import 'review_and_rating_widget.dart' show ReviewAndRatingWidget;
import 'package:flutter/material.dart';

class ReviewAndRatingModel extends FlutterFlowModel<ReviewAndRatingWidget> {
  ///  Local state fields for this component.

  bool submited = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Communication-score widget.
  double? communicationScoreValue;
  // State field(s) for Reliability-score widget.
  double? reliabilityScoreValue;
  // State field(s) for Quality-score widget.
  double? qualityScoreValue;
  // State field(s) for Fairness-score widget.
  double? fairnessScoreValue;
  // State field(s) for note widget.
  FocusNode? noteFocusNode;
  TextEditingController? noteTextController;
  String? Function(BuildContext, String?)? noteTextControllerValidator;
  String? _noteTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^[\\u0600-\\u06FF\\s_\\u0660-\\u06690-9a-zA-Z\\.]+\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'tfvvwgse' /* Please use only letters (Engli... */,
      );
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    noteTextControllerValidator = _noteTextControllerValidator;
  }

  @override
  void dispose() {
    noteFocusNode?.dispose();
    noteTextController?.dispose();
  }
}
