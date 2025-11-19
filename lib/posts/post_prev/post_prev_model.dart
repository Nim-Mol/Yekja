import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_overview_pages/post_detail_column/post_detail_column_widget.dart';
import '/shared_components/photo_gallary/photo_gallary_widget.dart';
import '/index.dart';
import 'post_prev_widget.dart' show PostPrevWidget;
import 'package:flutter/material.dart';

class PostPrevModel extends FlutterFlowModel<PostPrevWidget> {
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

  ///  State fields for stateful widgets in this page.

  // Model for Photo_gallary component.
  late PhotoGallaryModel photoGallaryModel;
  // Model for PostDetailColumn component.
  late PostDetailColumnModel postDetailColumnModel;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  PostCreateMuxTblRow? newPostOut;

  @override
  void initState(BuildContext context) {
    photoGallaryModel = createModel(context, () => PhotoGallaryModel());
    postDetailColumnModel = createModel(context, () => PostDetailColumnModel());
  }

  @override
  void dispose() {
    photoGallaryModel.dispose();
    postDetailColumnModel.dispose();
  }
}
