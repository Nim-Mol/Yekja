import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'detail_events_widget.dart' show DetailEventsWidget;
import 'package:flutter/material.dart';

class DetailEventsModel extends FlutterFlowModel<DetailEventsWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for dropdownCity widget.
  String? dropdownCityValue;
  FormFieldController<String>? dropdownCityValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for PriceBoolSwitch widget.
  bool? priceBoolSwitchValue1;
  // State field(s) for PriceBoolSwitch widget.
  bool? priceBoolSwitchValue2;
  // State field(s) for priceField widget.
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
        'snbevskk' /* Numbers only. */,
      );
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in priceField widget.
  bool? validationResultPrice;
  // State field(s) for capacityField widget.
  FocusNode? capacityFieldFocusNode;
  TextEditingController? capacityFieldTextController;
  String? Function(BuildContext, String?)? capacityFieldTextControllerValidator;
  String? _capacityFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^([0-9\\u06F0-\\u06F9])+\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'i5y5g8f3' /* Numbers only. */,
      );
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in capacityField widget.
  bool? validationResultCapacity;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;

  @override
  void initState(BuildContext context) {
    priceFieldTextControllerValidator = _priceFieldTextControllerValidator;
    capacityFieldTextControllerValidator =
        _capacityFieldTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    priceFieldFocusNode?.dispose();
    priceFieldTextController?.dispose();

    capacityFieldFocusNode?.dispose();
    capacityFieldTextController?.dispose();

    textFieldFocusNode3?.dispose();
    textController5?.dispose();
  }
}
