import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'splash_widget.dart' show SplashWidget;
import 'package:flutter/material.dart';

class SplashModel extends FlutterFlowModel<SplashWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Splash widget.
  List<CitiesRow>? citiesOutput;
  // Stores action output result for [Backend Call - Query Rows] action in Splash widget.
  List<ViewTopSubcategoriesRow>? topsubcatOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
