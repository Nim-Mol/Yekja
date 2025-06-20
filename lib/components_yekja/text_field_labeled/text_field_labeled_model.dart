import '/flutter_flow/flutter_flow_util.dart';
import 'text_field_labeled_widget.dart' show TextFieldLabeledWidget;
import 'package:flutter/material.dart';

class TextFieldLabeledModel extends FlutterFlowModel<TextFieldLabeledWidget> {
  ///  Local state fields for this component.

  String? textlabel;

  String? label;

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
