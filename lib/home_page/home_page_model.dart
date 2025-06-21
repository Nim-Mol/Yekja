import '/components_yekja/our_main_header/our_main_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? homePageController;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController1;
  int carouselCurrentIndex1 = 1;

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController2;
  int carouselCurrentIndex2 = 1;

  // Model for OurMainHeader component.
  late OurMainHeaderModel ourMainHeaderModel;

  @override
  void initState(BuildContext context) {
    ourMainHeaderModel = createModel(context, () => OurMainHeaderModel());
  }

  @override
  void dispose() {
    homePageController?.finish();
    ourMainHeaderModel.dispose();
  }
}
