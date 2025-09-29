import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'reported_user_widget.dart' show ReportedUserWidget;
import 'package:flutter/material.dart';

class ReportedUserModel extends FlutterFlowModel<ReportedUserWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UserExtRow>? unblock;
  // Stores action output result for [Backend Call - Delete Row(s)] action in Button widget.
  List<ReportedRow>? removed;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
