import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/nav_bar/nav_bar_widget.dart';
import '/shared_components/report_bug/report_bug_widget.dart';
import 'xxx_widget.dart' show XxxWidget;
import 'package:flutter/material.dart';

class XxxModel extends FlutterFlowModel<XxxWidget> {
  ///  Local state fields for this page.

  bool isClose = true;

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in xxx widget.
  List<ViewUserChatsRow>? chatView;
  // Stores action output result for [Backend Call - Query Rows] action in xxx widget.
  List<ConsentsRow>? userConsent;
  // Stores action output result for [Backend Call - Query Rows] action in Icon widget.
  List<ChatsRow>? yekjaChat2Customer;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Model for reportBug component.
  late ReportBugModel reportBugModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
    reportBugModel = createModel(context, () => ReportBugModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
    reportBugModel.dispose();
  }
}
