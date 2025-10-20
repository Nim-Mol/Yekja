import '/flutter_flow/flutter_flow_util.dart';
import 'images_widget.dart' show ImagesWidget;
import 'package:flutter/material.dart';

class ImagesModel extends FlutterFlowModel<ImagesWidget> {
  ///  Local state fields for this component.

  List<FFUploadedFile> localImages = [];
  void addToLocalImages(FFUploadedFile item) => localImages.add(item);
  void removeFromLocalImages(FFUploadedFile item) => localImages.remove(item);
  void removeAtIndexFromLocalImages(int index) => localImages.removeAt(index);
  void insertAtIndexInLocalImages(int index, FFUploadedFile item) =>
      localImages.insert(index, item);
  void updateLocalImagesAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      localImages[index] = updateFn(localImages[index]);

  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadimageLocalComp = false;
  FFUploadedFile uploadedLocalFile_uploadimageLocalComp =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
