import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/shared_components/report_bug/report_bug_widget.dart';
import '/index.dart';
import 'detail_swap_items_widget.dart' show DetailSwapItemsWidget;
import 'package:flutter/material.dart';

class DetailSwapItemsModel extends FlutterFlowModel<DetailSwapItemsWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for dropdownCity widget.
  String? dropdownCityValue1;
  FormFieldController<String>? dropdownCityValueController1;
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
        'wukfcoma' /* Please use only letters, numbe... */,
      );
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in WishlistField widget.
  bool? validationResultWhishlist;
  // State field(s) for SwapSwitch widget.
  bool? swapSwitchValue;
  // State field(s) for dropdownCity widget.
  String? dropdownCityValue2;
  FormFieldController<String>? dropdownCityValueController2;
  DateTime? datePicked;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for PriceBoolSwitch widget.
  bool? priceBoolSwitchValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for NegotiableSwitch widget.
  bool? negotiableSwitchValue;
  // Model for reportBug component.
  late ReportBugModel reportBugModel;

  @override
  void initState(BuildContext context) {
    wishlistFieldTextControllerValidator =
        _wishlistFieldTextControllerValidator;
    reportBugModel = createModel(context, () => ReportBugModel());
  }

  @override
  void dispose() {
    wishlistFieldFocusNode?.dispose();
    wishlistFieldTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController2?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();

    reportBugModel.dispose();
  }
}
