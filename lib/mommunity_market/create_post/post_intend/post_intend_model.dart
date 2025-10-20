import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'post_intend_widget.dart' show PostIntendWidget;
import 'package:flutter/material.dart';

class PostIntendModel extends FlutterFlowModel<PostIntendWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RadioButtonIntend widget.
  FormFieldController<String>? radioButtonIntendValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get radioButtonIntendValue => radioButtonIntendValueController?.value;
}
