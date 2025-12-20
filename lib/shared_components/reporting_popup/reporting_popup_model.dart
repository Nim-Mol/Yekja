import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'reporting_popup_widget.dart' show ReportingPopupWidget;
import 'package:flutter/material.dart';

class ReportingPopupModel extends FlutterFlowModel<ReportingPopupWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xgf5x3co' /* Reason is required */,
      );
    }

    if (!RegExp('^[\\u0600-\\u06FF\\s_\\u0660-\\u06690-9a-zA-Z\\.\\!\\?]+\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '2h1qxq4i' /* Please use only letters (Engli... */,
      );
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validationPass;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ReportedRow? reportedPOst;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ChatsRow? chatForpost;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ReportedRow? reportedProfile;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ChatsRow? chatForProfile;

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
