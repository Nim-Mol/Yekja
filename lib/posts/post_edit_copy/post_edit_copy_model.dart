import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/photo_gallary/photo_gallary_widget.dart';
import '/index.dart';
import 'post_edit_copy_widget.dart' show PostEditCopyWidget;
import 'package:flutter/material.dart';

class PostEditCopyModel extends FlutterFlowModel<PostEditCopyWidget> {
  ///  Local state fields for this page.

  int? currentPageIndex = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in PostEditCopy widget.
  List<ViewPostSearchFaRow>? queryPostFa;
  // Stores action output result for [Backend Call - Query Rows] action in PostEditCopy widget.
  List<ViewPostSearchFaRow>? queryPostNl;
  // Stores action output result for [Backend Call - Query Rows] action in PostEditCopy widget.
  List<ViewPostSearchFaRow>? queryPostEn;
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
