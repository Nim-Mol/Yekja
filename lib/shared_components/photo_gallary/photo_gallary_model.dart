import '/flutter_flow/flutter_flow_util.dart';
import 'photo_gallary_widget.dart' show PhotoGallaryWidget;
import 'package:flutter/material.dart';

class PhotoGallaryModel extends FlutterFlowModel<PhotoGallaryWidget> {
  ///  Local state fields for this component.

  List<String> photos = [];
  void addToPhotos(String item) => photos.add(item);
  void removeFromPhotos(String item) => photos.remove(item);
  void removeAtIndexFromPhotos(int index) => photos.removeAt(index);
  void insertAtIndexInPhotos(int index, String item) =>
      photos.insert(index, item);
  void updatePhotosAtIndex(int index, Function(String) updateFn) =>
      photos[index] = updateFn(photos[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
