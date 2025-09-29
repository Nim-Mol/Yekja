import '/flutter_flow/flutter_flow_util.dart';
import 'images_widget.dart' show ImagesWidget;
import 'package:flutter/material.dart';

class ImagesModel extends FlutterFlowModel<ImagesWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadimageLocalComp = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadimageLocalComp = [];

  bool isDataUploading_uploadToStorageURLComp = false;
  FFUploadedFile uploadedLocalFile_uploadToStorageURLComp =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadToStorageURLComp = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
