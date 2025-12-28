import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'detail_sales_widget.dart' show DetailSalesWidget;
import 'package:flutter/material.dart';

class DetailSalesModel extends FlutterFlowModel<DetailSalesWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
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
        't34cpmie' /* price is required */,
      );
    }

    if (!RegExp('^([0-9\\u06F0-\\u06F9])+\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'nzdfm26i' /* Please only use numbers. */,
      );
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in priceField widget.
  bool? validationResult;
  // State field(s) for NegotiableSwitch widget.
  bool? negotiableSwitchValue;
  // State field(s) for SwapSwitch widget.
  bool? swapSwitchValue;
  // State field(s) for WishlistField widget.
  FocusNode? wishlistFieldFocusNode;
  TextEditingController? wishlistFieldTextController;
  String? Function(BuildContext, String?)? wishlistFieldTextControllerValidator;
  String? _wishlistFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^[\\u0600-\\u06FF\\s_\\u0660-\\u06690-9a-zA-Z\\.]+\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'oim5aeia' /* Please use only letters, numbe... */,
      );
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in WishlistField widget.
  bool? validationResultWhishlist;

  @override
  void initState(BuildContext context) {
    priceFieldTextControllerValidator = _priceFieldTextControllerValidator;
    wishlistFieldTextControllerValidator =
        _wishlistFieldTextControllerValidator;
  }

  @override
  void dispose() {
    priceFieldFocusNode?.dispose();
    priceFieldTextController?.dispose();

    wishlistFieldFocusNode?.dispose();
    wishlistFieldTextController?.dispose();
  }
}
