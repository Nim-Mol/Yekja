import '/flutter_flow/flutter_flow_util.dart';
import 'cat_widget.dart' show CatWidget;
import 'package:flutter/material.dart';

class CatModel extends FlutterFlowModel<CatWidget> {
  ///  Local state fields for this component.

  int? maniCat;

  int? selectedCat;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for Col2 widget.
  ScrollController? col2ScrollController;
  // State field(s) for GridView widget.
  ScrollController? gridViewController;

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
  }
}
