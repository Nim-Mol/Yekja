import '/components_yekja/botton_standard/botton_standard_widget.dart';
import '/components_yekja/interests_card/interests_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'questionair_page_widget.dart' show QuestionairPageWidget;
import 'package:flutter/material.dart';

class QuestionairPageModel extends FlutterFlowModel<QuestionairPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // Model for BottonStandard component.
  late BottonStandardModel bottonStandardModel1;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel1;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel2;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel3;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel4;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel5;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel6;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel7;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel8;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel9;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel10;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel11;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel12;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel13;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel14;
  // Model for BottonStandard component.
  late BottonStandardModel bottonStandardModel2;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel15;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel16;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel17;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel18;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel19;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel20;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel21;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel22;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel23;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel24;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel25;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel26;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel27;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel28;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel29;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel30;
  // Model for BottonStandard component.
  late BottonStandardModel bottonStandardModel3;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel31;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel32;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel33;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel34;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel35;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel36;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel37;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel38;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel39;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel40;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel41;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel42;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel43;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel44;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel45;
  // Model for InterestsCard component.
  late InterestsCardModel interestsCardModel46;
  // Model for BottonStandard component.
  late BottonStandardModel bottonStandardModel4;

  @override
  void initState(BuildContext context) {
    bottonStandardModel1 = createModel(context, () => BottonStandardModel());
    interestsCardModel1 = createModel(context, () => InterestsCardModel());
    interestsCardModel2 = createModel(context, () => InterestsCardModel());
    interestsCardModel3 = createModel(context, () => InterestsCardModel());
    interestsCardModel4 = createModel(context, () => InterestsCardModel());
    interestsCardModel5 = createModel(context, () => InterestsCardModel());
    interestsCardModel6 = createModel(context, () => InterestsCardModel());
    interestsCardModel7 = createModel(context, () => InterestsCardModel());
    interestsCardModel8 = createModel(context, () => InterestsCardModel());
    interestsCardModel9 = createModel(context, () => InterestsCardModel());
    interestsCardModel10 = createModel(context, () => InterestsCardModel());
    interestsCardModel11 = createModel(context, () => InterestsCardModel());
    interestsCardModel12 = createModel(context, () => InterestsCardModel());
    interestsCardModel13 = createModel(context, () => InterestsCardModel());
    interestsCardModel14 = createModel(context, () => InterestsCardModel());
    bottonStandardModel2 = createModel(context, () => BottonStandardModel());
    interestsCardModel15 = createModel(context, () => InterestsCardModel());
    interestsCardModel16 = createModel(context, () => InterestsCardModel());
    interestsCardModel17 = createModel(context, () => InterestsCardModel());
    interestsCardModel18 = createModel(context, () => InterestsCardModel());
    interestsCardModel19 = createModel(context, () => InterestsCardModel());
    interestsCardModel20 = createModel(context, () => InterestsCardModel());
    interestsCardModel21 = createModel(context, () => InterestsCardModel());
    interestsCardModel22 = createModel(context, () => InterestsCardModel());
    interestsCardModel23 = createModel(context, () => InterestsCardModel());
    interestsCardModel24 = createModel(context, () => InterestsCardModel());
    interestsCardModel25 = createModel(context, () => InterestsCardModel());
    interestsCardModel26 = createModel(context, () => InterestsCardModel());
    interestsCardModel27 = createModel(context, () => InterestsCardModel());
    interestsCardModel28 = createModel(context, () => InterestsCardModel());
    interestsCardModel29 = createModel(context, () => InterestsCardModel());
    interestsCardModel30 = createModel(context, () => InterestsCardModel());
    bottonStandardModel3 = createModel(context, () => BottonStandardModel());
    interestsCardModel31 = createModel(context, () => InterestsCardModel());
    interestsCardModel32 = createModel(context, () => InterestsCardModel());
    interestsCardModel33 = createModel(context, () => InterestsCardModel());
    interestsCardModel34 = createModel(context, () => InterestsCardModel());
    interestsCardModel35 = createModel(context, () => InterestsCardModel());
    interestsCardModel36 = createModel(context, () => InterestsCardModel());
    interestsCardModel37 = createModel(context, () => InterestsCardModel());
    interestsCardModel38 = createModel(context, () => InterestsCardModel());
    interestsCardModel39 = createModel(context, () => InterestsCardModel());
    interestsCardModel40 = createModel(context, () => InterestsCardModel());
    interestsCardModel41 = createModel(context, () => InterestsCardModel());
    interestsCardModel42 = createModel(context, () => InterestsCardModel());
    interestsCardModel43 = createModel(context, () => InterestsCardModel());
    interestsCardModel44 = createModel(context, () => InterestsCardModel());
    interestsCardModel45 = createModel(context, () => InterestsCardModel());
    interestsCardModel46 = createModel(context, () => InterestsCardModel());
    bottonStandardModel4 = createModel(context, () => BottonStandardModel());
  }

  @override
  void dispose() {
    bottonStandardModel1.dispose();
    interestsCardModel1.dispose();
    interestsCardModel2.dispose();
    interestsCardModel3.dispose();
    interestsCardModel4.dispose();
    interestsCardModel5.dispose();
    interestsCardModel6.dispose();
    interestsCardModel7.dispose();
    interestsCardModel8.dispose();
    interestsCardModel9.dispose();
    interestsCardModel10.dispose();
    interestsCardModel11.dispose();
    interestsCardModel12.dispose();
    interestsCardModel13.dispose();
    interestsCardModel14.dispose();
    bottonStandardModel2.dispose();
    interestsCardModel15.dispose();
    interestsCardModel16.dispose();
    interestsCardModel17.dispose();
    interestsCardModel18.dispose();
    interestsCardModel19.dispose();
    interestsCardModel20.dispose();
    interestsCardModel21.dispose();
    interestsCardModel22.dispose();
    interestsCardModel23.dispose();
    interestsCardModel24.dispose();
    interestsCardModel25.dispose();
    interestsCardModel26.dispose();
    interestsCardModel27.dispose();
    interestsCardModel28.dispose();
    interestsCardModel29.dispose();
    interestsCardModel30.dispose();
    bottonStandardModel3.dispose();
    interestsCardModel31.dispose();
    interestsCardModel32.dispose();
    interestsCardModel33.dispose();
    interestsCardModel34.dispose();
    interestsCardModel35.dispose();
    interestsCardModel36.dispose();
    interestsCardModel37.dispose();
    interestsCardModel38.dispose();
    interestsCardModel39.dispose();
    interestsCardModel40.dispose();
    interestsCardModel41.dispose();
    interestsCardModel42.dispose();
    interestsCardModel43.dispose();
    interestsCardModel44.dispose();
    interestsCardModel45.dispose();
    interestsCardModel46.dispose();
    bottonStandardModel4.dispose();
  }
}
