import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'reporting_popup_widget.dart' show ReportingPopupWidget;
import 'package:flutter/material.dart';

class ReportingPopupModel extends FlutterFlowModel<ReportingPopupWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ReportedRow? reportedPOst;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ChatsRow? chatForpost;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ReportedRow? reportedProfile;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ChatsRow? chatForProfile;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
