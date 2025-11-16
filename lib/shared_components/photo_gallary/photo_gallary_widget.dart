import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'photo_gallary_model.dart';
export 'photo_gallary_model.dart';

class PhotoGallaryWidget extends StatefulWidget {
  const PhotoGallaryWidget({
    super.key,
    required this.photoList,
  });

  final List<String>? photoList;

  @override
  State<PhotoGallaryWidget> createState() => _PhotoGallaryWidgetState();
}

class _PhotoGallaryWidgetState extends State<PhotoGallaryWidget> {
  late PhotoGallaryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhotoGallaryModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Builder(
        builder: (context) {
          final img = widget.photoList!.map((e) => e).toList();

          return Container(
            width: 500.0,
            height: 700.0,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _model.pageViewController ??= PageController(
                      initialPage: max(0, min(0, img.length - 1))),
                  scrollDirection: Axis.horizontal,
                  itemCount: img.length,
                  itemBuilder: (context, imgIndex) {
                    final imgItem = img[imgIndex];
                    return Image.network(
                      imgItem,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    );
                  },
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.76),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 42.0),
                    child: smooth_page_indicator.SmoothPageIndicator(
                      controller: _model.pageViewController ??= PageController(
                          initialPage: max(0, min(0, img.length - 1))),
                      count: img.length,
                      axisDirection: Axis.horizontal,
                      onDotClicked: (i) async {
                        await _model.pageViewController!.animateToPage(
                          i,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                        safeSetState(() {});
                      },
                      effect: smooth_page_indicator.SlideEffect(
                        spacing: 8.0,
                        radius: 8.0,
                        dotWidth: 10.0,
                        dotHeight: 10.0,
                        dotColor: FlutterFlowTheme.of(context).bordergray,
                        activeDotColor: FlutterFlowTheme.of(context).primary,
                        paintStyle: PaintingStyle.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
