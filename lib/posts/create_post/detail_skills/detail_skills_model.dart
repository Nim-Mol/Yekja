import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/shared_components/report_bug/report_bug_widget.dart';
import '/index.dart';
import 'detail_skills_widget.dart' show DetailSkillsWidget;
import 'package:flutter/material.dart';

class DetailSkillsModel extends FlutterFlowModel<DetailSkillsWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for dropdownCity widget.
  String? dropdownCityValue;
  FormFieldController<String>? dropdownCityValueController;
  // State field(s) for PriceBoolSwitch widget.
  bool? priceBoolSwitchValue;
  // State field(s) for priceField widget.
  FocusNode? priceFieldFocusNode;
  TextEditingController? priceFieldTextController;
  String? Function(BuildContext, String?)? priceFieldTextControllerValidator;
  String? _priceFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '70how8tb' /* price is required */,
      );
    }

    if (!RegExp('^([0-9\\u06F0-\\u06F9])+\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '9ulc4l5r' /* Please only use numbers. */,
      );
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in priceField widget.
  bool? validationResult;
  // State field(s) for PricePeriod widget.
  String? pricePeriodValue;
  FormFieldController<String>? pricePeriodValueController;
  // State field(s) for NegotiableSwitch widget.
  bool? negotiableSwitchValue;
  // Model for reportBug component.
  late ReportBugModel reportBugModel;

  @override
  void initState(BuildContext context) {
    priceFieldTextControllerValidator = _priceFieldTextControllerValidator;
    reportBugModel = createModel(context, () => ReportBugModel());
  }

  @override
  void dispose() {
    priceFieldFocusNode?.dispose();
    priceFieldTextController?.dispose();

    reportBugModel.dispose();
  }
}
