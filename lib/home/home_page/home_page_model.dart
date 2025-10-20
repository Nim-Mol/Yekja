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

  final formKey = GlobalKey<FormState>();
  // State field(s) for searchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
  String? _searchFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qv9q21jt' /* Search is required */,
      );
    }

    if (!RegExp('^[\\u0600-\\u06FF\\s_\\u0660-\\u06690-9]+\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'vzxdrsnm' /* Please use only letters (Engli... */,
      );
    }
    return null;
  }

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
    searchFieldTextControllerValidator = _searchFieldTextControllerValidator;
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
