import '/backend/supabase/supabase.dart';
import '/components/post_owner_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_overview_pages/post_detail_column/post_detail_column_widget.dart';
import '/profile/review_card_small/review_card_small_widget.dart';
import '/shared_components/comunication_bar/comunication_bar_widget.dart';
import '/shared_components/photo_gallary/photo_gallary_widget.dart';
import '/shared_components/report_bug/report_bug_widget.dart';
import 'dart:async';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'post_en_widget.dart' show PostEnWidget;
import 'package:flutter/material.dart';

class PostEnModel extends FlutterFlowModel<PostEnWidget> {
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

  // Stores action output result for [Backend Call - Query Rows] action in PostEn widget.
  List<PostsLikesRow>? liked;
  // Stores action output result for [Backend Call - Query Rows] action in PostEn widget.
  List<EventAttendeesRow>? eventAttendeesOut;
  // Model for Photo_gallary component.
  late PhotoGallaryModel photoGallaryModel;
  bool requestCompleted2 = false;
  String? requestLastUniqueKey2;
  // Model for PostDetailColumn component.
  late PostDetailColumnModel postDetailColumnModel;
  Completer<List<ViewEventAttendeesRow>>? requestCompleter1;
  // Stores action output result for [Backend Call - Insert Row] action in join widget.
  EventAttendeesRow? joinEvent;
  // Model for postOwnerCard component.
  late PostOwnerCardModel postOwnerCardModel;
  // Models for ReviewCard_small dynamic component.
  late FlutterFlowDynamicModels<ReviewCardSmallModel> reviewCardSmallModels;
  // Model for Comunication_Bar component.
  late ComunicationBarModel comunicationBarModel;
  // Model for reportBug component.
  late ReportBugModel reportBugModel;

  /// Query cache managers for this widget.

  final _postEnManager = FutureRequestManager<List<ViewPostSearchEnRow>>();
  Future<List<ViewPostSearchEnRow>> postEn({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ViewPostSearchEnRow>> Function() requestFn,
  }) =>
      _postEnManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPostEnCache() => _postEnManager.clear();
  void clearPostEnCacheKey(String? uniqueKey) =>
      _postEnManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    photoGallaryModel = createModel(context, () => PhotoGallaryModel());
    postDetailColumnModel = createModel(context, () => PostDetailColumnModel());
    postOwnerCardModel = createModel(context, () => PostOwnerCardModel());
    reviewCardSmallModels =
        FlutterFlowDynamicModels(() => ReviewCardSmallModel());
    comunicationBarModel = createModel(context, () => ComunicationBarModel());
    reportBugModel = createModel(context, () => ReportBugModel());
  }

  @override
  void dispose() {
    photoGallaryModel.dispose();
    postDetailColumnModel.dispose();
    postOwnerCardModel.dispose();
    reviewCardSmallModels.dispose();
    comunicationBarModel.dispose();
    reportBugModel.dispose();

    /// Dispose query cache managers for this widget.

    clearPostEnCache();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleted2;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
