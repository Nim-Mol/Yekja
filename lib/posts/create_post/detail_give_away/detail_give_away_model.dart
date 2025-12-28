import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'detail_give_away_widget.dart' show DetailGiveAwayWidget;
import 'package:flutter/material.dart';

class DetailGiveAwayModel extends FlutterFlowModel<DetailGiveAwayWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for dropdownCity widget.
  String? dropdownCityValue;
  FormFieldController<String>? dropdownCityValueController;
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
        '89gasxy1' /* Please use only letters, numbe... */,
      );
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in WishlistField widget.
  bool? validationResultWhishlist;

  @override
  void initState(BuildContext context) {
    wishlistFieldTextControllerValidator =
        _wishlistFieldTextControllerValidator;
  }

  @override
  void dispose() {
    wishlistFieldFocusNode?.dispose();
    wishlistFieldTextController?.dispose();
  }
}
