import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/main_header/main_header_widget.dart';
import '/shared_components/nav_bar/nav_bar_widget.dart';
import '/shared_components/shout_out_card/shout_out_card_widget.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in HomePage widget.
  List<ViewTopSubcategoriesRow>? listOfCategories;
  // Stores action output result for [Backend Call - Query Rows] action in HomePage widget.
  List<ViewUnseenTotalsRow>? newMessages;
  // State field(s) for searchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
  // Stores action output result for [Custom Action - decodeJwtRole] action in Header widget.
  String? toplevelRole;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Models for shoutOutCard dynamic component.
  late FlutterFlowDynamicModels<ShoutOutCardModel> shoutOutCardModels;
  // Model for MainHeader component.
  late MainHeaderModel mainHeaderModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    shoutOutCardModels = FlutterFlowDynamicModels(() => ShoutOutCardModel());
    mainHeaderModel = createModel(context, () => MainHeaderModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    searchFieldFocusNode?.dispose();
    searchFieldTextController?.dispose();

    shoutOutCardModels.dispose();
    mainHeaderModel.dispose();
    navBarModel.dispose();
  }
}
