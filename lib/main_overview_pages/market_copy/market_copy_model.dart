import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/item_card_horizental/item_card_horizental_widget.dart';
import '/shared_components/nav_bar/nav_bar_widget.dart';
import '/index.dart';
import 'dart:async';
import 'market_copy_widget.dart' show MarketCopyWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MarketCopyModel extends FlutterFlowModel<MarketCopyWidget> {
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

  // State field(s) for ListViewCat1 widget.

  PagingController<ApiPagingParams, dynamic>? listViewCat1PagingController;
  Function(ApiPagingParams nextPageMarker)? listViewCat1ApiCall;

  // Models for ItemCard_Horizental dynamic component.
  late FlutterFlowDynamicModels<ItemCardHorizentalModel>
      itemCardHorizentalModels1;
  // State field(s) for LisviewCat2 widget.

  PagingController<ApiPagingParams, dynamic>? lisviewCat2PagingController;
  Function(ApiPagingParams nextPageMarker)? lisviewCat2ApiCall;

  // Models for ItemCard_Horizental dynamic component.
  late FlutterFlowDynamicModels<ItemCardHorizentalModel>
      itemCardHorizentalModels2;
  // State field(s) for ListviewCat3 widget.

  PagingController<ApiPagingParams, dynamic>? listviewCat3PagingController;
  Function(ApiPagingParams nextPageMarker)? listviewCat3ApiCall;

  // Models for ItemCard_Horizental dynamic component.
  late FlutterFlowDynamicModels<ItemCardHorizentalModel>
      itemCardHorizentalModels3;
  // State field(s) for ListviewCat4 widget.

  PagingController<ApiPagingParams, dynamic>? listviewCat4PagingController;
  Function(ApiPagingParams nextPageMarker)? listviewCat4ApiCall;

  // Models for ItemCard_Horizental dynamic component.
  late FlutterFlowDynamicModels<ItemCardHorizentalModel>
      itemCardHorizentalModels4;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    itemCardHorizentalModels1 =
        FlutterFlowDynamicModels(() => ItemCardHorizentalModel());
    itemCardHorizentalModels2 =
        FlutterFlowDynamicModels(() => ItemCardHorizentalModel());
    itemCardHorizentalModels3 =
        FlutterFlowDynamicModels(() => ItemCardHorizentalModel());
    itemCardHorizentalModels4 =
        FlutterFlowDynamicModels(() => ItemCardHorizentalModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    listViewCat1PagingController?.dispose();
    itemCardHorizentalModels1.dispose();
    lisviewCat2PagingController?.dispose();
    itemCardHorizentalModels2.dispose();
    listviewCat3PagingController?.dispose();
    itemCardHorizentalModels3.dispose();
    listviewCat4PagingController?.dispose();
    itemCardHorizentalModels4.dispose();
    navBarModel.dispose();
  }

  /// Additional helper methods.
  Future waitForOnePageForListViewCat1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewCat1PagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForOnePageForLisviewCat2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (lisviewCat2PagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForOnePageForListviewCat3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listviewCat3PagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForOnePageForListviewCat4({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listviewCat4PagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setListViewCat1Controller(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewCat1ApiCall = apiCall;
    return listViewCat1PagingController ??=
        _createListViewCat1Controller(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewCat1Controller(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewCat1FilterApiPage);
  }

  void listViewCat1FilterApiPage(ApiPagingParams nextPageMarker) =>
      listViewCat1ApiCall!(nextPageMarker)
          .then((listViewCat1FilterApiResponse) {
        final pageItems = ((listViewCat1FilterApiResponse.jsonBody
                            .toList()
                            .map<FilterModelwithDetailsTableStruct?>(
                                FilterModelwithDetailsTableStruct.maybeFromMap)
                            .toList()
                        as Iterable<FilterModelwithDetailsTableStruct?>)
                    .withoutNulls ??
                [])
            .take(10 - nextPageMarker.numItems)
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewCat1PagingController?.appendPage(
          pageItems,
          (pageItems.length > 0) && newNumItems < 10
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewCat1FilterApiResponse,
                )
              : null,
        );
      });

  PagingController<ApiPagingParams, dynamic> setLisviewCat2Controller(
    Function(ApiPagingParams) apiCall,
  ) {
    lisviewCat2ApiCall = apiCall;
    return lisviewCat2PagingController ??=
        _createLisviewCat2Controller(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createLisviewCat2Controller(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(lisviewCat2FilterApiPage);
  }

  void lisviewCat2FilterApiPage(ApiPagingParams nextPageMarker) =>
      lisviewCat2ApiCall!(nextPageMarker).then((lisviewCat2FilterApiResponse) {
        final pageItems = ((lisviewCat2FilterApiResponse.jsonBody
                            .toList()
                            .map<FilterModelwithDetailsTableStruct?>(
                                FilterModelwithDetailsTableStruct.maybeFromMap)
                            .toList()
                        as Iterable<FilterModelwithDetailsTableStruct?>)
                    .withoutNulls ??
                [])
            .take(10 - nextPageMarker.numItems)
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        lisviewCat2PagingController?.appendPage(
          pageItems,
          (pageItems.length > 0) && newNumItems < 10
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: lisviewCat2FilterApiResponse,
                )
              : null,
        );
      });

  PagingController<ApiPagingParams, dynamic> setListviewCat3Controller(
    Function(ApiPagingParams) apiCall,
  ) {
    listviewCat3ApiCall = apiCall;
    return listviewCat3PagingController ??=
        _createListviewCat3Controller(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListviewCat3Controller(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listviewCat3FilterApiPage);
  }

  void listviewCat3FilterApiPage(ApiPagingParams nextPageMarker) =>
      listviewCat3ApiCall!(nextPageMarker)
          .then((listviewCat3FilterApiResponse) {
        final pageItems = ((listviewCat3FilterApiResponse.jsonBody
                            .toList()
                            .map<FilterModelwithDetailsTableStruct?>(
                                FilterModelwithDetailsTableStruct.maybeFromMap)
                            .toList()
                        as Iterable<FilterModelwithDetailsTableStruct?>)
                    .withoutNulls ??
                [])
            .take(10 - nextPageMarker.numItems)
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listviewCat3PagingController?.appendPage(
          pageItems,
          (pageItems.length > 0) && newNumItems < 10
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listviewCat3FilterApiResponse,
                )
              : null,
        );
      });

  PagingController<ApiPagingParams, dynamic> setListviewCat4Controller(
    Function(ApiPagingParams) apiCall,
  ) {
    listviewCat4ApiCall = apiCall;
    return listviewCat4PagingController ??=
        _createListviewCat4Controller(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListviewCat4Controller(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listviewCat4FilterApiPage);
  }

  void listviewCat4FilterApiPage(ApiPagingParams nextPageMarker) =>
      listviewCat4ApiCall!(nextPageMarker)
          .then((listviewCat4FilterApiResponse) {
        final pageItems = ((listviewCat4FilterApiResponse.jsonBody
                            .toList()
                            .map<FilterModelwithDetailsTableStruct?>(
                                FilterModelwithDetailsTableStruct.maybeFromMap)
                            .toList()
                        as Iterable<FilterModelwithDetailsTableStruct?>)
                    .withoutNulls ??
                [])
            .take(10 - nextPageMarker.numItems)
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listviewCat4PagingController?.appendPage(
          pageItems,
          (pageItems.length > 0) && newNumItems < 10
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listviewCat4FilterApiResponse,
                )
              : null,
        );
      });
}
