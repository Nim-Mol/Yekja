import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/shared_components/report_bug/report_bug_widget.dart';
import '/index.dart';
import 'detail_care_and_assistance_widget.dart'
    show DetailCareAndAssistanceWidget;
import 'package:flutter/material.dart';

class DetailCareAndAssistanceModel
    extends FlutterFlowModel<DetailCareAndAssistanceWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for dropdownCity widget.
  String? dropdownCityValue;
  FormFieldController<String>? dropdownCityValueController;
  DateTime? datePicked;
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
