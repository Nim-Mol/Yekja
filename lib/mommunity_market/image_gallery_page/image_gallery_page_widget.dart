import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/photo_gallary/photo_gallary_widget.dart';
import 'package:flutter/material.dart';
import 'image_gallery_page_model.dart';
export 'image_gallery_page_model.dart';

class ImageGalleryPageWidget extends StatefulWidget {
  const ImageGalleryPageWidget({
    super.key,
    this.marketId,
    this.previewImages,
  });

  final String? marketId;
  final List<String>? previewImages;

  static String routeName = 'ImageGalleryPage';
  static String routePath = '/imageGalleryPage';

  @override
  State<ImageGalleryPageWidget> createState() => _ImageGalleryPageWidgetState();
}

class _ImageGalleryPageWidgetState extends State<ImageGalleryPageWidget> {
  late ImageGalleryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageGalleryPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 50.0,
                      buttonSize: 40.0,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      icon: Icon(
                        Icons.chevron_left,
                        color: FlutterFlowTheme.of(context).info,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.safePop();
                      },
                    ),
                  ],
                ),
              ),
              wrapWithModel(
                model: _model.photoGallaryModel,
                updateCallback: () => safeSetState(() {}),
                child: PhotoGallaryWidget(
                  photoList: widget.previewImages!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
