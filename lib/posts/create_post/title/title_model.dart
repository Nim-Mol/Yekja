import '/flutter_flow/flutter_flow_util.dart';
import 'title_widget.dart' show TitleWidget;
import 'package:flutter/material.dart';

class TitleModel extends FlutterFlowModel<TitleWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '209gk34d' /* Title is required */,
      );
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    if (!RegExp('^[\\u0600-\\u06FF\\s_\\u0660-\\u06690-9a-zA-Z\\.]+\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'vjdguyso' /* Please use only letters (Engli... */,
      );
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
