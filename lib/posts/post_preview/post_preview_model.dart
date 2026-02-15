import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_overview_pages/post_detail_column/post_detail_column_widget.dart';
import '/profile/review_card_small/review_card_small_widget.dart';
import '/shared_components/photo_gallary/photo_gallary_widget.dart';
import '/shared_components/post_owner_card/post_owner_card_widget.dart';
import '/shared_components/report_bug/report_bug_widget.dart';
import '/index.dart';
import 'post_preview_widget.dart' show PostPreviewWidget;
import 'package:flutter/material.dart';

class PostPreviewModel extends FlutterFlowModel<PostPreviewWidget> {
  ///  Local state fields for this page.

  int? currentPageIndex = 0;

  bool isLiked = false;

  List<String> favListInitial = [];
  void addToFavListInitial(String item) => favListInitial.add(item);
  void removeFromFavListInitial(String item) => favListInitial.remove(item);
  void removeAtIndexFromFavListInitial(int index) =>
      favListInitial.removeAt(index);
  void insertAtIndexInFavListInitial(int index, String item) =>
      favListInitial.insert(index, item);
  void updateFavListInitialAtIndex(int index, Function(String) updateFn) =>
      favListInitial[index] = updateFn(favListInitial[index]);

  bool isFav = false;

  bool isClose = true;

  bool celebrationOn = false;

  ///  State fields for stateful widgets in this page.

  // Model for Photo_gallary component.
  late PhotoGallaryModel photoGallaryModel;
  // Model for PostDetailColumn component.
  late PostDetailColumnModel postDetailColumnModel;
  // Model for postOwnerCard component.
  late PostOwnerCardModel postOwnerCardModel;
  // Models for ReviewCard_small dynamic component.
  late FlutterFlowDynamicModels<ReviewCardSmallModel> reviewCardSmallModels;
  // Stores action output result for [Backend Call - Insert Row] action in Publish widget.
  PostCreateMuxTblRow? newPostOut;
  // Model for reportBug component.
  late ReportBugModel reportBugModel;

  @override
  void initState(BuildContext context) {
    photoGallaryModel = createModel(context, () => PhotoGallaryModel());
    postDetailColumnModel = createModel(context, () => PostDetailColumnModel());
    postOwnerCardModel = createModel(context, () => PostOwnerCardModel());
    reviewCardSmallModels =
        FlutterFlowDynamicModels(() => ReviewCardSmallModel());
    reportBugModel = createModel(context, () => ReportBugModel());
  }

  @override
  void dispose() {
    photoGallaryModel.dispose();
    postDetailColumnModel.dispose();
    postOwnerCardModel.dispose();
    reviewCardSmallModels.dispose();
    reportBugModel.dispose();
  }
}
