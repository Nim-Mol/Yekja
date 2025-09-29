import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'create_wishlist_widget.dart' show CreateWishlistWidget;
import 'package:flutter/material.dart';

class CreateWishlistModel extends FlutterFlowModel<CreateWishlistWidget> {
  ///  State fields for stateful widgets in this page.

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
