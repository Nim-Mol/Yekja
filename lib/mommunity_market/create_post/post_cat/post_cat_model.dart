import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'post_cat_widget.dart' show PostCatWidget;
import 'package:flutter/material.dart';

class PostCatModel extends FlutterFlowModel<PostCatWidget> {
  ///  Local state fields for this page.

  List<SubcatModelStruct> filteredList = [];
  void addToFilteredList(SubcatModelStruct item) => filteredList.add(item);
  void removeFromFilteredList(SubcatModelStruct item) =>
      filteredList.remove(item);
  void removeAtIndexFromFilteredList(int index) => filteredList.removeAt(index);
  void insertAtIndexInFilteredList(int index, SubcatModelStruct item) =>
      filteredList.insert(index, item);
  void updateFilteredListAtIndex(
          int index, Function(SubcatModelStruct) updateFn) =>
      filteredList[index] = updateFn(filteredList[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
