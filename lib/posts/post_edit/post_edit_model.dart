import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/photo_gallary/photo_gallary_widget.dart';
import '/index.dart';
import 'post_edit_widget.dart' show PostEditWidget;
import 'package:flutter/material.dart';

class PostEditModel extends FlutterFlowModel<PostEditWidget> {
  ///  Local state fields for this page.

  int? currentPageIndex = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in PostEdit widget.
  List<ViewPostSearchRow>? queryPost;
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
