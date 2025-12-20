import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_overview_pages/post_detail_column/post_detail_column_widget.dart';
import '/profile/review_card_small/review_card_small_widget.dart';
import '/shared_components/photo_gallary/photo_gallary_widget.dart';
import '/index.dart';
import 'post_edit_widget.dart' show PostEditWidget;
import 'package:flutter/material.dart';

class PostEditModel extends FlutterFlowModel<PostEditWidget> {
  ///  Local state fields for this page.

  int? currentPageIndex = 0;

  ///  State fields for stateful widgets in this page.

  // Model for Photo_gallary component.
  late PhotoGallaryModel photoGallaryModel;
  // Model for PostDetailColumn component.
  late PostDetailColumnModel postDetailColumnModel;
  // Models for ReviewCard_small dynamic component.
  late FlutterFlowDynamicModels<ReviewCardSmallModel> reviewCardSmallModels;
  // Stores action output result for [Backend Call - Delete Row(s)] action in Button widget.
  List<PostsRow>? postDeleted;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  PostCreateMuxTblRow? rowUpdated;

  @override
  void initState(BuildContext context) {
    photoGallaryModel = createModel(context, () => PhotoGallaryModel());
    postDetailColumnModel = createModel(context, () => PostDetailColumnModel());
    reviewCardSmallModels =
        FlutterFlowDynamicModels(() => ReviewCardSmallModel());
  }

  @override
  void dispose() {
    photoGallaryModel.dispose();
    postDetailColumnModel.dispose();
    reviewCardSmallModels.dispose();
  }
}
