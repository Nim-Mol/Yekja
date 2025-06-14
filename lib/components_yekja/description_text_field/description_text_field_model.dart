import '/flutter_flow/flutter_flow_util.dart';
import 'description_text_field_widget.dart' show DescriptionTextFieldWidget;
import 'package:flutter/material.dart';

class DescriptionTextFieldModel
    extends FlutterFlowModel<DescriptionTextFieldWidget> {
  ///  Local state fields for this component.

  String? label;

  String? hinttext;

  int? maxline;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
