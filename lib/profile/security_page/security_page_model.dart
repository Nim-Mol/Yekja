import '/all_comoponet/app_bar/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'security_page_widget.dart' show SecurityPageWidget;
import 'package:flutter/material.dart';

class SecurityPageModel extends FlutterFlowModel<SecurityPageWidget> {
  ///  Local state fields for this page.

  bool isFaceId = false;

  bool isNotification = false;

  ///  State fields for stateful widgets in this page.

  // Model for AppBar component.
  late AppBarModel appBarModel;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
  }

  @override
  void dispose() {
    appBarModel.dispose();
  }
}
