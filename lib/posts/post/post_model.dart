import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/comunication_bar/comunication_bar_widget.dart';
import '/shared_components/photo_gallary/photo_gallary_widget.dart';
import '/index.dart';
import 'dart:async';
import 'post_widget.dart' show PostWidget;
import 'package:flutter/material.dart';

class PostModel extends FlutterFlowModel<PostWidget> {
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

  // Stores action output result for [Backend Call - Query Rows] action in Post widget.
  List<PostsLikesRow>? liked;
  // Model for Photo_gallary component.
  late PhotoGallaryModel photoGallaryModel;
  Completer<List<ViewPostSearchEnRow>>? requestCompleter;
  // Model for Comunication_Bar component.
  late ComunicationBarModel comunicationBarModel;

  @override
  void initState(BuildContext context) {
    photoGallaryModel = createModel(context, () => PhotoGallaryModel());
    comunicationBarModel = createModel(context, () => ComunicationBarModel());
  }

  @override
  void dispose() {
    photoGallaryModel.dispose();
    comunicationBarModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
