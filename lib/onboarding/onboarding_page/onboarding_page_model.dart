import '/components_yekja/botton_standard/botton_standard_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'onboarding_page_widget.dart' show OnboardingPageWidget;
import 'package:flutter/material.dart';

class OnboardingPageModel extends FlutterFlowModel<OnboardingPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for BottonStandard component.
  late BottonStandardModel bottonStandardModel1;
  // Model for BottonStandard component.
  late BottonStandardModel bottonStandardModel2;
  // Model for BottonStandard component.
  late BottonStandardModel bottonStandardModel3;
  // Model for BottonStandard component.
  late BottonStandardModel bottonStandardModel4;

  @override
  void initState(BuildContext context) {
    bottonStandardModel1 = createModel(context, () => BottonStandardModel());
    bottonStandardModel2 = createModel(context, () => BottonStandardModel());
    bottonStandardModel3 = createModel(context, () => BottonStandardModel());
    bottonStandardModel4 = createModel(context, () => BottonStandardModel());
  }

  @override
  void dispose() {
    bottonStandardModel1.dispose();
    bottonStandardModel2.dispose();
    bottonStandardModel3.dispose();
    bottonStandardModel4.dispose();
  }
}
