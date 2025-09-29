import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/profile_card_comp/profile_card_comp_widget.dart';
import '/shared_components/tags_card/tags_card_widget.dart';
import '/index.dart';
import 'iran_n_l_item_page_widget.dart' show IranNLItemPageWidget;
import 'package:flutter/material.dart';

class IranNLItemPageModel extends FlutterFlowModel<IranNLItemPageWidget> {
  ///  Local state fields for this page.

  int? currentPageIndex = 0;

  String selectedButton = 'join';

  ///  State fields for stateful widgets in this page.

  // Model for tagsCard component.
  late TagsCardModel tagsCardModel1;
  // Model for tagsCard component.
  late TagsCardModel tagsCardModel2;
  // Model for profileCardComp component.
  late ProfileCardCompModel profileCardCompModel;

  @override
  void initState(BuildContext context) {
    tagsCardModel1 = createModel(context, () => TagsCardModel());
    tagsCardModel2 = createModel(context, () => TagsCardModel());
    profileCardCompModel = createModel(context, () => ProfileCardCompModel());
  }

  @override
  void dispose() {
    tagsCardModel1.dispose();
    tagsCardModel2.dispose();
    profileCardCompModel.dispose();
  }
}
