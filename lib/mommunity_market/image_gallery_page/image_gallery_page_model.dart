import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/photo_gallary/photo_gallary_widget.dart';
import 'image_gallery_page_widget.dart' show ImageGalleryPageWidget;
import 'package:flutter/material.dart';

class ImageGalleryPageModel extends FlutterFlowModel<ImageGalleryPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in ImageGalleryPage widget.
  List<MarketRow>? imagesFromDb;
  // Model for Photo_gallary component.
  late PhotoGallaryModel photoGallaryModel;

  @override
  void initState(BuildContext context) {
    photoGallaryModel = createModel(context, () => PhotoGallaryModel());
  }

  @override
  void dispose() {
    photoGallaryModel.dispose();
  }
}
