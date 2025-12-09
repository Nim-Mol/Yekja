import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'detail_ticket_swap_widget.dart' show DetailTicketSwapWidget;
import 'package:flutter/material.dart';

class DetailTicketSwapModel extends FlutterFlowModel<DetailTicketSwapWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for dropdownCity widget.
  String? dropdownCityValue;
  FormFieldController<String>? dropdownCityValueController;
  // State field(s) for VenueField widget.
  FocusNode? venueFieldFocusNode;
  TextEditingController? venueFieldTextController;
  String? Function(BuildContext, String?)? venueFieldTextControllerValidator;
  String? _venueFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^[\\u0600-\\u06FF\\s_\\u0660-\\u06690-9a-zA-Z\\.]+\$')
        .hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in VenueField widget.
  bool? validationResultVenue;
  DateTime? datePicked;
  // State field(s) for Quantity widget.
  FocusNode? quantityFocusNode;
  TextEditingController? quantityTextController;
  String? Function(BuildContext, String?)? quantityTextControllerValidator;
  String? _quantityTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^([0-9\\u06F0-\\u06F9])+\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'ki8iepox' /* Please only use numbers. */,
      );
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in Quantity widget.
  bool? validationResultQuantity;
  // State field(s) for PriceBoolSwitch widget.
  bool? priceBoolSwitchValue;
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
        'jgypiur7' /* Please only use numbers. */,
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
        'zaums6gv' /* Please use only letters, numbe... */,
      );
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in WishlistField widget.
  bool? validationResultWhishlist;

  @override
  void initState(BuildContext context) {
    venueFieldTextControllerValidator = _venueFieldTextControllerValidator;
    quantityTextControllerValidator = _quantityTextControllerValidator;
    priceFieldTextControllerValidator = _priceFieldTextControllerValidator;
    wishlistFieldTextControllerValidator =
        _wishlistFieldTextControllerValidator;
  }

  @override
  void dispose() {
    venueFieldFocusNode?.dispose();
    venueFieldTextController?.dispose();

    quantityFocusNode?.dispose();
    quantityTextController?.dispose();

    priceFieldFocusNode?.dispose();
    priceFieldTextController?.dispose();

    wishlistFieldFocusNode?.dispose();
    wishlistFieldTextController?.dispose();
  }
}
