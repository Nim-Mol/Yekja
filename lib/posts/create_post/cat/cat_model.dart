import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'cat_widget.dart' show CatWidget;
import 'package:flutter/material.dart';

class CatModel extends FlutterFlowModel<CatWidget> {
  ///  Local state fields for this component.

  int maincat = 1;

  int? selectedCat;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for Col2 widget.
  ScrollController? col2ScrollController;
  // State field(s) for GridView widget.
  ScrollController? gridViewController;

  /// Query cache managers for this widget.

  final _subcateManager = FutureRequestManager<List<SubCategoriesRow>>();
  Future<List<SubCategoriesRow>> subcate({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<SubCategoriesRow>> Function() requestFn,
  }) =>
      _subcateManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSubcateCache() => _subcateManager.clear();
  void clearSubcateCacheKey(String? uniqueKey) =>
      _subcateManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    col2ScrollController = ScrollController();
    gridViewController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    col2ScrollController?.dispose();
    gridViewController?.dispose();

    /// Dispose query cache managers for this widget.

    clearSubcateCache();
  }
}
