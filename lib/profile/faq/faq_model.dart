import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/report_bug/report_bug_widget.dart';
import '/index.dart';
import 'faq_widget.dart' show FaqWidget;
import 'package:flutter/material.dart';

class FaqModel extends FlutterFlowModel<FaqWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for reportBug component.
  late ReportBugModel reportBugModel;

  @override
  void initState(BuildContext context) {
    reportBugModel = createModel(context, () => ReportBugModel());
  }

  @override
  void dispose() {
    reportBugModel.dispose();
  }
}
