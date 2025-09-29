import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_comp_widget.dart' show FilterCompWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class FilterCompModel extends FlutterFlowModel<FilterCompWidget> {
  ///  Local state fields for this component.

  int? selectedCat;

  int? selectedSubCat;

  List<int> selectedCities = [];
  void addToSelectedCities(int item) => selectedCities.add(item);
  void removeFromSelectedCities(int item) => selectedCities.remove(item);
  void removeAtIndexFromSelectedCities(int index) =>
      selectedCities.removeAt(index);
  void insertAtIndexInSelectedCities(int index, int item) =>
      selectedCities.insert(index, item);
  void updateSelectedCitiesAtIndex(int index, Function(int) updateFn) =>
      selectedCities[index] = updateFn(selectedCities[index]);

  String sortState = 'Recent';

  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController4;

  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController5;

  // State field(s) for location widget.
  List<int>? locationValue;
  FormFieldController<List<int>>? locationValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
    expandableExpandableController4.dispose();
    expandableExpandableController5.dispose();
  }
}
