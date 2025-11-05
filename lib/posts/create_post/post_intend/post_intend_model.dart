import '/flutter_flow/flutter_flow_util.dart';
import '/posts/create_post/intend/intend_widget.dart';
import '/index.dart';
import 'post_intend_widget.dart' show PostIntendWidget;
import 'package:flutter/material.dart';

class PostIntendModel extends FlutterFlowModel<PostIntendWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Intend component.
  late IntendModel intendModel;

  @override
  void initState(BuildContext context) {
    intendModel = createModel(context, () => IntendModel());
  }

  @override
  void dispose() {
    intendModel.dispose();
  }
}
