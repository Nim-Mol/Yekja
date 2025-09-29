import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/tags_card/tags_card_widget.dart';
import '/index.dart';
import 'event_itme_page_widget.dart' show EventItmePageWidget;
import 'package:flutter/material.dart';

class EventItmePageModel extends FlutterFlowModel<EventItmePageWidget> {
  ///  Local state fields for this page.

  int? currentPageIndex = 0;

  String selectedButton = 'join';

  ///  State fields for stateful widgets in this page.

  // Model for tagsCard component.
  late TagsCardModel tagsCardModel1;
  // Model for tagsCard component.
  late TagsCardModel tagsCardModel2;
  // Model for tagsCard component.
  late TagsCardModel tagsCardModel3;
  // Model for tagsCard component.
  late TagsCardModel tagsCardModel4;

  @override
  void initState(BuildContext context) {
    tagsCardModel1 = createModel(context, () => TagsCardModel());
    tagsCardModel2 = createModel(context, () => TagsCardModel());
    tagsCardModel3 = createModel(context, () => TagsCardModel());
    tagsCardModel4 = createModel(context, () => TagsCardModel());
  }

  @override
  void dispose() {
    tagsCardModel1.dispose();
    tagsCardModel2.dispose();
    tagsCardModel3.dispose();
    tagsCardModel4.dispose();
  }
}
