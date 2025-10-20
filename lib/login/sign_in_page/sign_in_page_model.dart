import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/botton_standard/botton_standard_widget.dart';
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
  // Model for BottonStandard component.
  late BottonStandardModel bottonStandardModel;
  // Stores action output result for [Backend Call - Query Rows] action in BottonStandard widget.
  List<UserExtRow>? user;
  // Stores action output result for [Backend Call - Query Rows] action in BottonStandard widget.
  List<UserFavoritesRow>? userFav;
  // Stores action output result for [Custom Action - decodeJwtRole] action in BottonStandard widget.
  String? userRole;
  // Stores action output result for [Backend Call - Query Rows] action in BottonStandard widget.
  List<ViewTopSubcategoriesRow>? topsubcatOutput;
  // Stores action output result for [Backend Call - Query Rows] action in BottonStandard widget.
  List<CitiesRow>? citiesOutput;
  // Stores action output result for [Custom Action - createGuestSession] action in RichText widget.
  String? result;

  @override
  void initState(BuildContext context) {
    passWordVisibility = false;
    bottonStandardModel = createModel(context, () => BottonStandardModel());
  }

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passWordFocusNode?.dispose();
    passWordTextController?.dispose();

    bottonStandardModel.dispose();
  }
}
