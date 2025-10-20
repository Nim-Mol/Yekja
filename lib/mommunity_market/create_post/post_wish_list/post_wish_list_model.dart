import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'post_wish_list_widget.dart' show PostWishListWidget;
import 'package:flutter/material.dart';

class PostWishListModel extends FlutterFlowModel<PostWishListWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for wishlistTextField widget.
  FocusNode? wishlistTextFieldFocusNode;
  TextEditingController? wishlistTextFieldTextController;
  String? Function(BuildContext, String?)?
      wishlistTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    wishlistTextFieldFocusNode?.dispose();
    wishlistTextFieldTextController?.dispose();
  }
}
