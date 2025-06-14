import '/all_comoponet/app_bar/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'terms_conditions_page_widget.dart' show TermsConditionsPageWidget;
import 'package:flutter/material.dart';

class TermsConditionsPageModel
    extends FlutterFlowModel<TermsConditionsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AppBar component.
  late AppBarModel appBarModel;

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
  }

  @override
  void dispose() {
    appBarModel.dispose();
  }
}
