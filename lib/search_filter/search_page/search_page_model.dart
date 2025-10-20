import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/nav_bar/nav_bar_widget.dart';
import '/index.dart';
import 'dart:async';
import 'search_page_widget.dart' show SearchPageWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchPageModel extends FlutterFlowModel<SearchPageWidget> {
  ///  Local state fields for this page.

  int? selectedCat;

  List<int> selectedSubCats = [];
  void addToSelectedSubCats(int item) => selectedSubCats.add(item);
  void removeFromSelectedSubCats(int item) => selectedSubCats.remove(item);
  void removeAtIndexFromSelectedSubCats(int index) =>
      selectedSubCats.removeAt(index);
  void insertAtIndexInSelectedSubCats(int index, int item) =>
      selectedSubCats.insert(index, item);
  void updateSelectedSubCatsAtIndex(int index, Function(int) updateFn) =>
      selectedSubCats[index] = updateFn(selectedSubCats[index]);

  List<String> selectedLocations = [];
  void addToSelectedLocations(String item) => selectedLocations.add(item);
  void removeFromSelectedLocations(String item) =>
      selectedLocations.remove(item);
  void removeAtIndexFromSelectedLocations(int index) =>
      selectedLocations.removeAt(index);
  void insertAtIndexInSelectedLocations(int index, String item) =>
      selectedLocations.insert(index, item);
  void updateSelectedLocationsAtIndex(int index, Function(String) updateFn) =>
      selectedLocations[index] = updateFn(selectedLocations[index]);

  List<int> selectedWishlistIDs = [];
  void addToSelectedWishlistIDs(int item) => selectedWishlistIDs.add(item);
  void removeFromSelectedWishlistIDs(int item) =>
      selectedWishlistIDs.remove(item);
  void removeAtIndexFromSelectedWishlistIDs(int index) =>
      selectedWishlistIDs.removeAt(index);
  void insertAtIndexInSelectedWishlistIDs(int index, int item) =>
      selectedWishlistIDs.insert(index, item);
  void updateSelectedWishlistIDsAtIndex(int index, Function(int) updateFn) =>
      selectedWishlistIDs[index] = updateFn(selectedWishlistIDs[index]);

  bool? isCertified;

  String? searchText = '';

  int? limit = 5;

  bool isSearch = false;

  String sortBy = 'created_at.desc.nullslast';

  List<int> selectedCats = [];
  void addToSelectedCats(int item) => selectedCats.add(item);
  void removeFromSelectedCats(int item) => selectedCats.remove(item);
  void removeAtIndexFromSelectedCats(int index) => selectedCats.removeAt(index);
  void insertAtIndexInSelectedCats(int index, int item) =>
      selectedCats.insert(index, item);
  void updateSelectedCatsAtIndex(int index, Function(int) updateFn) =>
      selectedCats[index] = updateFn(selectedCats[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for ListViewSearch widget.

  PagingController<ApiPagingParams, dynamic>? listViewSearchPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewSearchApiCall;

  // Model for NavBar component.
  late NavBarModel navBarModel;
  // State field(s) for searchwidget widget.
  final searchwidgetKey = GlobalKey();
  FocusNode? searchwidgetFocusNode;
  TextEditingController? searchwidgetTextController;
  String? searchwidgetSelectedOption;
  String? Function(BuildContext, String?)? searchwidgetTextControllerValidator;
  // State field(s) for searchwidget_2 widget.
  final searchwidget2Key = GlobalKey();
  FocusNode? searchwidget2FocusNode;
  TextEditingController? searchwidget2TextController;
  String? searchwidget2SelectedOption;
  String? Function(BuildContext, String?)? searchwidget2TextControllerValidator;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    listViewSearchPagingController?.dispose();
    navBarModel.dispose();
    searchwidgetFocusNode?.dispose();

    searchwidget2FocusNode?.dispose();
  }

  /// Additional helper methods.
  Future waitForOnePageForListViewSearch({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewSearchPagingController?.nextPageKey?.nextPageNumber ?? 0) >
              0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setListViewSearchController(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewSearchApiCall = apiCall;
    return listViewSearchPagingController ??=
        _createListViewSearchController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewSearchController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewSearchSearchfilerapiPage);
  }

  void listViewSearchSearchfilerapiPage(ApiPagingParams nextPageMarker) =>
      listViewSearchApiCall!(nextPageMarker)
          .then((listViewSearchSearchfilerapiResponse) {
        final pageItems = ((listViewSearchSearchfilerapiResponse.jsonBody
                        .toList()
                        .map<FilterModelStruct?>(FilterModelStruct.maybeFromMap)
                        .toList() as Iterable<FilterModelStruct?>)
                    .withoutNulls ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewSearchPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewSearchSearchfilerapiResponse,
                )
              : null,
        );
      });
}
