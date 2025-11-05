import '/flutter_flow/flutter_flow_util.dart';
import '/posts/create_post/sub_cat/sub_cat_widget.dart';
import '/index.dart';
import 'post_sub_cat_widget.dart' show PostSubCatWidget;
import 'package:flutter/material.dart';

class PostSubCatModel extends FlutterFlowModel<PostSubCatWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SubCat component.
  late SubCatModel subCatModel;

  @override
  void initState(BuildContext context) {
    subCatModel = createModel(context, () => SubCatModel());
  }

  @override
  void dispose() {
    subCatModel.dispose();
  }
}
