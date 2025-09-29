import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'create_item_cat_widget.dart' show CreateItemCatWidget;
import 'package:flutter/material.dart';

class CreateItemCatModel extends FlutterFlowModel<CreateItemCatWidget> {
  ///  Local state fields for this page.

  List<CategoriesDicStruct> filteredList = [];
  void addToFilteredList(CategoriesDicStruct item) => filteredList.add(item);
  void removeFromFilteredList(CategoriesDicStruct item) =>
      filteredList.remove(item);
  void removeAtIndexFromFilteredList(int index) => filteredList.removeAt(index);
  void insertAtIndexInFilteredList(int index, CategoriesDicStruct item) =>
      filteredList.insert(index, item);
  void updateFilteredListAtIndex(
          int index, Function(CategoriesDicStruct) updateFn) =>
      filteredList[index] = updateFn(filteredList[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
