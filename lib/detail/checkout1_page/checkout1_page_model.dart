import '/all_comoponet/addresscomponent/addresscomponent_widget.dart';
import '/all_comoponet/app_bar/app_bar_widget.dart';
import '/all_comoponet/payment_component/payment_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'checkout1_page_widget.dart' show Checkout1PageWidget;
import 'package:flutter/material.dart';

class Checkout1PageModel extends FlutterFlowModel<Checkout1PageWidget> {
  ///  Local state fields for this page.

  int selected = 0;

  ///  State fields for stateful widgets in this page.

  // Model for AppBar component.
  late AppBarModel appBarModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for Addresscomponent component.
  late AddresscomponentModel addresscomponentModel;
  // Model for PaymentComponent component.
  late PaymentComponentModel paymentComponentModel;

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    addresscomponentModel = createModel(context, () => AddresscomponentModel());
    paymentComponentModel = createModel(context, () => PaymentComponentModel());
  }

  @override
  void dispose() {
    appBarModel.dispose();
    addresscomponentModel.dispose();
    paymentComponentModel.dispose();
  }
}
