import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/photo_gallary/photo_gallary_widget.dart';
import '/index.dart';
import 'post_preview_widget.dart' show PostPreviewWidget;
import 'package:flutter/material.dart';

class PostPreviewModel extends FlutterFlowModel<PostPreviewWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Photo_gallary component.
  late PhotoGallaryModel photoGallaryModel;

  @override
  void initState(BuildContext context) {
    photoGallaryModel = createModel(context, () => PhotoGallaryModel());
  }

  @override
  void dispose() {
    photoGallaryModel.dispose();
  }
}
