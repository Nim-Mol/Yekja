import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/shared_components/report_bug/report_bug_widget.dart';
import '/index.dart';
import 'detail_currency_exchange_widget.dart' show DetailCurrencyExchangeWidget;
import 'package:flutter/material.dart';

class DetailCurrencyExchangeModel
    extends FlutterFlowModel<DetailCurrencyExchangeWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for dropdownCity widget.
  String? dropdownCityValue;
  FormFieldController<String>? dropdownCityValueController;
  // State field(s) for AmountField widget.
  FocusNode? amountFieldFocusNode;
  TextEditingController? amountFieldTextController;
  String? Function(BuildContext, String?)? amountFieldTextControllerValidator;
  String? _amountFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jsgjzpxv' /* Amount is required. */,
      );
    }

    if (!RegExp('^([0-9\\u06F0-\\u06F9])+\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'jpjzjfc1' /* Numbers only. */,
      );
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in AmountField widget.
  bool? validationResultAmount;
  // State field(s) for PriceBoolSwitch widget.
  bool? priceBoolSwitchValue1;
  // State field(s) for PriceField widget.
  FocusNode? priceFieldFocusNode;
  TextEditingController? priceFieldTextController;
  String? Function(BuildContext, String?)? priceFieldTextControllerValidator;
  String? _priceFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^([0-9\\u06F0-\\u06F9])+\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'ssh7o6u6' /* Numbers only. */,
      );
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in PriceField widget.
  bool? validationResultPrice;
  // State field(s) for NegotiableSwitch widget.
  bool? negotiableSwitchValue;
  // State field(s) for PriceBoolSwitch widget.
  bool? priceBoolSwitchValue2;
  // Model for reportBug component.
  late ReportBugModel reportBugModel;

  @override
  void initState(BuildContext context) {
    amountFieldTextControllerValidator = _amountFieldTextControllerValidator;
    priceFieldTextControllerValidator = _priceFieldTextControllerValidator;
    reportBugModel = createModel(context, () => ReportBugModel());
  }

  @override
  void dispose() {
    amountFieldFocusNode?.dispose();
    amountFieldTextController?.dispose();

    priceFieldFocusNode?.dispose();
    priceFieldTextController?.dispose();

    reportBugModel.dispose();
  }
}
