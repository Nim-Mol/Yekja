import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'post_image_widget.dart' show PostImageWidget;
import 'package:flutter/material.dart';

class PostImageModel extends FlutterFlowModel<PostImageWidget> {
  ///  Local state fields for this page.

  bool busyUploading = false;

  List<FFUploadedFile> localImages = [];
  void addToLocalImages(FFUploadedFile item) => localImages.add(item);
  void removeFromLocalImages(FFUploadedFile item) => localImages.remove(item);
  void removeAtIndexFromLocalImages(int index) => localImages.removeAt(index);
  void insertAtIndexInLocalImages(int index, FFUploadedFile item) =>
      localImages.insert(index, item);
  void updateLocalImagesAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      localImages[index] = updateFn(localImages[index]);

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadimageLocal = false;
  FFUploadedFile uploadedLocalFile_uploadimageLocal =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadToStorageURL = false;
  FFUploadedFile uploadedLocalFile_uploadToStorageURL =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadToStorageURL = '';

  bool isDataUploading_uploadToStorageURLEdit = false;
  FFUploadedFile uploadedLocalFile_uploadToStorageURLEdit =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadToStorageURLEdit = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
