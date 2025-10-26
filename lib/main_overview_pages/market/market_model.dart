import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/main_overview_pages/item_card_global/item_card_global_widget.dart';
import '/shared_components/nav_bar/nav_bar_widget.dart';
import '/shared_components/shout_out_card/shout_out_card_widget.dart';
import '/index.dart';
import 'dart:async';
import 'market_widget.dart' show MarketWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MarketModel extends FlutterFlowModel<MarketWidget> {
  ///  Local state fields for this page.

  String sortBy = 'created_at.desc.nullslast';

  int? limit = 5;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for DropDownSort widget.
  String? dropDownSortValue1;
  FormFieldController<String>? dropDownSortValueController1;
  // State field(s) for ListviewMarket widget.

  PagingController<ApiPagingParams, dynamic>? listviewMarketPagingController;
  Function(ApiPagingParams nextPageMarker)? listviewMarketApiCall;

  // Models for ItemCard_Global dynamic component.
  late FlutterFlowDynamicModels<ItemCardGlobalModel> itemCardGlobalModels1;
  // State field(s) for DropDownSort widget.
  String? dropDownSortValue2;
  FormFieldController<String>? dropDownSortValueController2;
  // State field(s) for ListviewSupport widget.

  PagingController<ApiPagingParams, dynamic>? listviewSupportPagingController;
  Function(ApiPagingParams nextPageMarker)? listviewSupportApiCall;

  // Models for ItemCard_Global dynamic component.
  late FlutterFlowDynamicModels<ItemCardGlobalModel> itemCardGlobalModels2;
  // Models for shoutOutCard dynamic component.
  late FlutterFlowDynamicModels<ShoutOutCardModel> shoutOutCardModels;
  // State field(s) for DropDownSort widget.
  String? dropDownSortValue3;
  FormFieldController<String>? dropDownSortValueController3;
  // State field(s) for ListviewSkills widget.

  PagingController<ApiPagingParams, dynamic>? listviewSkillsPagingController;
  Function(ApiPagingParams nextPageMarker)? listviewSkillsApiCall;

  // Models for ItemCard_Global dynamic component.
  late FlutterFlowDynamicModels<ItemCardGlobalModel> itemCardGlobalModels3;
  // State field(s) for DropDownSort widget.
  String? dropDownSortValue4;
  FormFieldController<String>? dropDownSortValueController4;
  // State field(s) for ListviewEvents widget.

  PagingController<ApiPagingParams, dynamic>? listviewEventsPagingController;
  Function(ApiPagingParams nextPageMarker)? listviewEventsApiCall;

  // Models for ItemCard_Global dynamic component.
  late FlutterFlowDynamicModels<ItemCardGlobalModel> itemCardGlobalModels4;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    itemCardGlobalModels1 =
        FlutterFlowDynamicModels(() => ItemCardGlobalModel());
    itemCardGlobalModels2 =
        FlutterFlowDynamicModels(() => ItemCardGlobalModel());
    shoutOutCardModels = FlutterFlowDynamicModels(() => ShoutOutCardModel());
    itemCardGlobalModels3 =
        FlutterFlowDynamicModels(() => ItemCardGlobalModel());
    itemCardGlobalModels4 =
        FlutterFlowDynamicModels(() => ItemCardGlobalModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    listviewMarketPagingController?.dispose();
    itemCardGlobalModels1.dispose();
    listviewSupportPagingController?.dispose();
    itemCardGlobalModels2.dispose();
    shoutOutCardModels.dispose();
    listviewSkillsPagingController?.dispose();
    itemCardGlobalModels3.dispose();
    listviewEventsPagingController?.dispose();
    itemCardGlobalModels4.dispose();
    navBarModel.dispose();
  }

  /// Additional helper methods.
  Future waitForOnePageForListviewMarket({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listviewMarketPagingController?.nextPageKey?.nextPageNumber ?? 0) >
              0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setListviewMarketController(
    Function(ApiPagingParams) apiCall,
  ) {
    listviewMarketApiCall = apiCall;
    return listviewMarketPagingController ??=
        _createListviewMarketController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListviewMarketController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listviewMarketFilterApiPage);
  }

  void listviewMarketFilterApiPage(ApiPagingParams nextPageMarker) =>
      listviewMarketApiCall!(nextPageMarker)
          .then((listviewMarketFilterApiResponse) {
        final pageItems = ((listviewMarketFilterApiResponse.jsonBody
                            .toList()
                            .map<FilterModelwithDetailsTableStruct?>(
                                FilterModelwithDetailsTableStruct.maybeFromMap)
                            .toList()
                        as Iterable<FilterModelwithDetailsTableStruct?>)
                    .withoutNulls ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listviewMarketPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listviewMarketFilterApiResponse,
                )
              : null,
        );
      });

  Future waitForOnePageForListviewSupport({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listviewSupportPagingController?.nextPageKey?.nextPageNumber ?? 0) >
              0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setListviewSupportController(
    Function(ApiPagingParams) apiCall,
  ) {
    listviewSupportApiCall = apiCall;
    return listviewSupportPagingController ??=
        _createListviewSupportController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListviewSupportController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listviewSupportFilterApiPage);
  }

  void listviewSupportFilterApiPage(ApiPagingParams nextPageMarker) =>
      listviewSupportApiCall!(nextPageMarker)
          .then((listviewSupportFilterApiResponse) {
        final pageItems = ((listviewSupportFilterApiResponse.jsonBody
                            .toList()
                            .map<FilterModelwithDetailsTableStruct?>(
                                FilterModelwithDetailsTableStruct.maybeFromMap)
                            .toList()
                        as Iterable<FilterModelwithDetailsTableStruct?>)
                    .withoutNulls ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listviewSupportPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listviewSupportFilterApiResponse,
                )
              : null,
        );
      });

  Future waitForOnePageForListviewSkills({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listviewSkillsPagingController?.nextPageKey?.nextPageNumber ?? 0) >
              0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setListviewSkillsController(
    Function(ApiPagingParams) apiCall,
  ) {
    listviewSkillsApiCall = apiCall;
    return listviewSkillsPagingController ??=
        _createListviewSkillsController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListviewSkillsController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listviewSkillsFilterApiPage);
  }

  void listviewSkillsFilterApiPage(ApiPagingParams nextPageMarker) =>
      listviewSkillsApiCall!(nextPageMarker)
          .then((listviewSkillsFilterApiResponse) {
        final pageItems = ((listviewSkillsFilterApiResponse.jsonBody
                            .toList()
                            .map<FilterModelwithDetailsTableStruct?>(
                                FilterModelwithDetailsTableStruct.maybeFromMap)
                            .toList()
                        as Iterable<FilterModelwithDetailsTableStruct?>)
                    .withoutNulls ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listviewSkillsPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listviewSkillsFilterApiResponse,
                )
              : null,
        );
      });

  Future waitForOnePageForListviewEvents({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listviewEventsPagingController?.nextPageKey?.nextPageNumber ?? 0) >
              0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setListviewEventsController(
    Function(ApiPagingParams) apiCall,
  ) {
    listviewEventsApiCall = apiCall;
    return listviewEventsPagingController ??=
        _createListviewEventsController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListviewEventsController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listviewEventsFilterApiPage);
  }

  void listviewEventsFilterApiPage(ApiPagingParams nextPageMarker) =>
      listviewEventsApiCall!(nextPageMarker)
          .then((listviewEventsFilterApiResponse) {
        final pageItems = ((listviewEventsFilterApiResponse.jsonBody
                            .toList()
                            .map<FilterModelwithDetailsTableStruct?>(
                                FilterModelwithDetailsTableStruct.maybeFromMap)
                            .toList()
                        as Iterable<FilterModelwithDetailsTableStruct?>)
                    .withoutNulls ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listviewEventsPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listviewEventsFilterApiResponse,
                )
              : null,
        );
      });
}
