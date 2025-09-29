import '/flutter_flow/flutter_flow_util.dart';
import 'wishlist_widget.dart' show WishlistWidget;
import 'package:flutter/material.dart';

class WishlistModel extends FlutterFlowModel<WishlistWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for wishlistTextField widget.
  FocusNode? wishlistTextFieldFocusNode;
  TextEditingController? wishlistTextFieldTextController;
  String? Function(BuildContext, String?)?
      wishlistTextFieldTextControllerValidator;
  // State field(s) for SwitchVisibility widget.
  bool? switchVisibilityValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    wishlistTextFieldFocusNode?.dispose();
    wishlistTextFieldTextController?.dispose();
  }
}
