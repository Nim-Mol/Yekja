import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/badge_card2/badge_card2_widget.dart';
import 'profile_card_comp_widget.dart' show ProfileCardCompWidget;
import 'package:flutter/material.dart';

class ProfileCardCompModel extends FlutterFlowModel<ProfileCardCompWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for badgeCard2 component.
  late BadgeCard2Model badgeCard2Model1;
  // Model for badgeCard2 component.
  late BadgeCard2Model badgeCard2Model2;
  // Model for badgeCard2 component.
  late BadgeCard2Model badgeCard2Model3;
  // Model for badgeCard2 component.
  late BadgeCard2Model badgeCard2Model4;

  @override
  void initState(BuildContext context) {
    badgeCard2Model1 = createModel(context, () => BadgeCard2Model());
    badgeCard2Model2 = createModel(context, () => BadgeCard2Model());
    badgeCard2Model3 = createModel(context, () => BadgeCard2Model());
    badgeCard2Model4 = createModel(context, () => BadgeCard2Model());
  }

  @override
  void dispose() {
    badgeCard2Model1.dispose();
    badgeCard2Model2.dispose();
    badgeCard2Model3.dispose();
    badgeCard2Model4.dispose();
  }
}
