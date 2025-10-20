import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_overview_pages/item_card_global/item_card_global_widget.dart';
import '/shared_components/nav_bar/nav_bar_widget.dart';
import '/index.dart';
import 'dart:async';
import 'market_widget.dart' show MarketWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MarketModel extends FlutterFlowModel<MarketWidget> {
  ///  Local state fields for this page.

  int selectedSubCat = 1;

  int catID = 1;

  List<int> subcatIDs = [];
  void addToSubcatIDs(int item) => subcatIDs.add(item);
  void removeFromSubcatIDs(int item) => subcatIDs.remove(item);
  void removeAtIndexFromSubcatIDs(int index) => subcatIDs.removeAt(index);
  void insertAtIndexInSubcatIDs(int index, int item) =>
      subcatIDs.insert(index, item);
  void updateSubcatIDsAtIndex(int index, Function(int) updateFn) =>
      subcatIDs[index] = updateFn(subcatIDs[index]);

  String sortBy = 'created_at.desc.nullslast';

  List<int> cityIDs = [];
  void addToCityIDs(int item) => cityIDs.add(item);
  void removeFromCityIDs(int item) => cityIDs.remove(item);
  void removeAtIndexFromCityIDs(int index) => cityIDs.removeAt(index);
  void insertAtIndexInCityIDs(int index, int item) =>
      cityIDs.insert(index, item);
  void updateCityIDsAtIndex(int index, Function(int) updateFn) =>
      cityIDs[index] = updateFn(cityIDs[index]);

  int? limit = 5;

  int? mainCatID;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ListviewFilter widget.

  PagingController<ApiPagingParams, dynamic>? listviewFilterPagingController;
  Function(ApiPagingParams nextPageMarker)? listviewFilterApiCall;

  // Models for ItemCard_Global dynamic component.
  late FlutterFlowDynamicModels<ItemCardGlobalModel> itemCardGlobalModels;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    itemCardGlobalModels =
        FlutterFlowDynamicModels(() => ItemCardGlobalModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    listviewFilterPagingController?.dispose();
    itemCardGlobalModels.dispose();
    navBarModel.dispose();
  }

  /// Additional helper methods.
  Future waitForOnePageForListviewFilter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listviewFilterPagingController?.nextPageKey?.nextPageNumber ?? 0) >
              0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setListviewFilterController(
    Function(ApiPagingParams) apiCall,
  ) {
    listviewFilterApiCall = apiCall;
    return listviewFilterPagingController ??=
        _createListviewFilterController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListviewFilterController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listviewFilterFilterApiPage);
  }

  void listviewFilterFilterApiPage(ApiPagingParams nextPageMarker) =>
      listviewFilterApiCall!(nextPageMarker)
          .then((listviewFilterFilterApiResponse) {
        final pageItems = ((listviewFilterFilterApiResponse.jsonBody
                            .toList()
                            .map<FilterModelwithDetailsTableStruct?>(
                                FilterModelwithDetailsTableStruct.maybeFromMap)
                            .toList()
                        as Iterable<FilterModelwithDetailsTableStruct?>)
                    .withoutNulls ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listviewFilterPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listviewFilterFilterApiResponse,
                )
              : null,
        );
      });
}
