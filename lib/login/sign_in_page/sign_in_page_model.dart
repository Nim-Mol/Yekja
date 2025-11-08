import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'sign_in_page_widget.dart' show SignInPageWidget;
import 'package:flutter/material.dart';

class SignInPageModel extends FlutterFlowModel<SignInPageWidget> {
  ///  Local state fields for this page.

  bool vrified = true;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for PassWord widget.
  FocusNode? passWordFocusNode;
  TextEditingController? passWordTextController;
  late bool passWordVisibility;
  String? Function(BuildContext, String?)? passWordTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UserExtRow>? user;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UserFavoritesRow>? userFav;
  // Stores action output result for [Custom Action - decodeJwtRole] action in Button widget.
  String? userRole;
  // Stores action output result for [Custom Action - generateUUID] action in RichText widget.
  String? sessionId;

  @override
  void initState(BuildContext context) {
    passWordVisibility = false;
  }

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passWordFocusNode?.dispose();
    passWordTextController?.dispose();
  }
}
